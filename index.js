import express from 'express';
import cors from 'cors';
import bodyParser from 'body-parser';

import fetch from 'node-fetch';
import mysql from 'mysql2/promise';

process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0';

const pool = await mysql.createPool({
  connectionLimit: 10,
  waitForConnections: true,
  user: 'datauser',
  password: 'Mr$0200097a',
  host: 'localhost',
  database: 'checkpostingdb',
});

const app = express();

app.use(cors());
app.use(bodyParser.json());

app.post('/relay', (req, res, next) => {
  handleRelayRoute(req, res, next).catch((error) => {
    console.log(error);
  });
});

app.get('/db', (req, res, next) => {
  handleDBRoute(req, res, next).catch((error) => {
    console.log(error);
  });
});

app.get('/configs', (req, res, next) => {
  handleConfigsRoute(req, res, next).catch((error) => {
    console.log(error);
  });
});

app.post('/osb', (req, res, next) => {
  handleOSBRoute(req, res, next).catch((error) => {
    console.log(error);
  });
});

app.post('/sales', (req, res, next) => {
  handleSalesRoute(req, res, next).catch((error) => {
    console.log(error);
  });
});

app.post('/checksToExport', (req, res, next) => {
  handleChecksToExportRoute(req, res, next).catch((error) => {
    console.log(error);
  })
});

app.post('/stats', (req, res, next) => {
  handleStatsRoute(req, res, next).catch((error) => {
    console.log(error); 
  });
});

app.listen(3002, () => {
  console.log('Server running on port 3002');
});

async function handleRelayRoute(
  req,
  res,
  next,
) {
  const data = req.body;
  try {
    const response = await fetch(
      'https://10.1.3.130/app/org.openbravo.mobile.core.service.jsonrest/org.openbravo.retail.posterminal.ExternalOrderLoader?user=microsexport&password=openbravo&synchronizedProcessing=true',
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
      },
    );
    const jsonResponse = await response.json();
    if (jsonResponse.response?.error != null) {
      throw new Error(jsonResponse.response.error.message);
    }
    console.log('SUCCESS: /relay');
    res.status(200).json(jsonResponse);
  } catch (error) {
    console.log('FAILED: /relay');
    console.error(error);
    next(error);
  }
}

async function handleDBRoute(
  _req,
  res,
  next,
) {
  try {
    // Query to the database and get the records
    const [menuItemRecords] = await pool.query(`select master.ObjectNumber,
    masterDef.PrintClassObjNum,
    printClass.OrderDeviceOutput
from menu_item_master as master
right join menu_item_definition as masterDef
    on master.MenuItemMasterID = masterDef.MenuItemMasterID
right join print_class as printClass
    on masterDef.PrintClassObjNum = printClass.ObjectNumber`);
    const menuItemInfo = menuItemRecords.reduce((acc, record) => {
      if (record.ObjectNumber == null) {
        return acc;
      }

      // Parse out device IDs from the order device output string
      acc[record.ObjectNumber] = (record.OrderDeviceOutput ?? '')
        .split('')
        .map((value, index) => {
          const intValue = Number(value);
          if (!Number.isNaN(intValue) && intValue === 1) {
            return index + 1;
          }
          return null;
        })
        .filter((value) => value != null);

      return acc;
    }, {});

    console.log('SUCCESS: /db');
    res.status(200).send({ menuItemInfo });
  } catch (error) {
    console.log('FAILED: /db');
    console.error(error);
    next(error);
  }
}

async function handleConfigsRoute(
  req,
  res,
  next,
) {
  try {
    // Query to the database and get the records
    const [configRecords] = await pool.query(`SELECT
       TaxClasses.ObjectNumber as TaxClassRef
      ,Names.StringText as TaxClassName
      ,TaxRate.TaxIndex as TaxRateRef
      ,Tax.Percentage as TaxRatePercentage
      ,HierarchyUnit.PropertyID as PropertyID
  FROM tax_class as TaxClasses
  LEFT JOIN string_table as Names
    ON TaxClasses.NameID = Names.StringNumberID
  LEFT JOIN tax_class_tax as TaxRate
    ON TaxRate.TaxClassID = TaxClasses.TaxClassID
  LEFT JOIN tax as Tax
    ON TaxRate.TaxIndex = Tax.TaxIndex
  LEFT JOIN hierarchy_structure as Hierarchy
    ON Tax.HierStrucID = Hierarchy.HierStrucID
  LEFT JOIN hierarchy_unit as HierarchyUnit
    ON Hierarchy.HierUnitID = HierarchyUnit.HierUnitID`);

    const taxClasses = configRecords.map((record) => {
      if (record.TaxClassRef == null) {
        return null;
      }

      return {
        propertyID: record.PropertyID,
        taxClassRef: record.TaxClassRef,
        taxClassName: record.TaxClassName,
        taxRateRef: record.TaxRateRef,
        taxRatePercentage: record.TaxRatePercentage,
      };
    });

    console.log('SUCCESS: /configs');
    res.status(200).send({ taxClasses });
  } catch (error) {
    console.log('FAILED: /configs');
    console.error(error);
    next(error);
  }
}

async function handleOSBRoute(
  req,
  res,
  next,
) {
  const {
    orderDeviceIds,
    lastN,
  } = req.body;
  try {
    // Query to the database and get the records
    const [completedOrderRecord] = await pool
      .query(`select checks.CheckNumber
from kds_detail as detail
right join checks as checks
  on checks.CheckID = detail.CheckID
where detail.OrderDeviceIndex in (${orderDeviceIds.join(', ')})
order by detail.SentTime desc limit ${lastN}`);

    const completedCheckNumbers = completedOrderRecord.map((record) => {
      return record.CheckNumber;
    }, []);

    console.log('SUCCESS: /osb');
    res.status(200).send({ completedCheckNumbers });
  } catch (error) {
    console.log('FAILED: /osb');
    console.error(error);
    next(error);
  }
}

async function handleSalesRoute(
  req,
  res,
  next,
) {
  const { date } = req.body;
  try {
    // Query to the database and get sales counts
    const [salesCountRecords] = await pool
      .query(`select
    detail.ObjectNumber as MenuItemId,
    sum(detail.SalesCount) as Total
from check_detail as detail
where detail.ObjectNumber is not null
  and detail.ObjectNumber not in (1, 100, 20)
  and datediff(detail.DetailPostingTime, '${date}') = 0
group by detail.ObjectNumber`);

    const salesCounts = salesCountRecords.reduce((acc, record) => {
	acc[record.MenuItemId] = record.Total;
      return acc;
    }, {});

    console.log('SUCCESS: /sales');
    res.status(200).send({ salesCounts });
  } catch (error) {
    console.log('FAILED: /sales');
    console.error(error);
    next(error);
  }
}

async function handleStatsRoute(
  req,
  res,
  next,
) {
  const {dateStart, dateEnd} = req.body;

  try {
    const [records] = await pool
      .query(`select count(t.CheckID) as Checks,
  sum(t.Covers) as GuestCount,
  sum(t.Payment) as Total
from (
  select distinct
    c.CheckID,
    c.Covers,
    c.Payment
  from checks c
  left join check_detail cd
    on c.CheckID = cd.CheckID
  where c.CheckClose >= '${dateStart}'
    and c.CheckClose < '${dateEnd}'
    and c.SubTotal is not null
    and c.SubTotal >= 0.0
    and cd.DetailType = 4
    and cd.ObjectNumber != 99
) as t`);
    const record = records[0];

    const stats = {
      totalOrders: record.Checks,
      totalIncome: record.Total,
      totalGuests: record.GuestCount,
    };

    console.log('SUCCESS: /stats');
    res.status(200).send(stats);
  } catch (error) {
    console.log('FAILED: /stats');
    console.error(error);
    next(error);
  }
}

async function handleChecksToExportRoute(
  req,
  res,
  next,
) {
  const { dateStart, dateEnd, ignoreObjectNumber } = req.body;
  try {
    // Query to the database and get the records
    const [closedChecksThatNeedExport] = await pool
      .query(`select distinct
  checks.CheckNumber as CheckNumber,
  detail.RevCtrID as RevenueCenterID,
  checks.Guid as Guid,
  checks.Covers as Covers,
  checks.Payment as Payment,
  checks.SubTotal as SubTotal,
  checks.Tax as Tax
from checks as checks
left join check_detail as detail
  on checks.CheckID = detail.CheckID
where checks.CheckClose >= '${dateStart}'
  and checks.CheckClose < '${dateEnd}'
  and checks.SubTotal is not null
  and checks.SubTotal >= 0.0
  and detail.DetailType = 4
  and detail.ObjectNumber != ${ignoreObjectNumber}
order by checks.CheckNumber asc`);

    const closedChecks = closedChecksThatNeedExport.map((record) => {
      return {
        checkNumber: record.CheckNumber,
        sequenceNumber: Number(record.Guid.replace(/[^\d]+/g, '').substr(0, 9)),
        checkTotal: Number(record.Payment),
        subTotal: Number(record.SubTotal),
        taxTotal: record.Tax != null ? Number(record.Tax) : null,
        guestCount: Number(record.Covers),
		    revenueCenterID: record.RevenueCenterID,
      };
    }, []);

    console.log('SUCCESS: /checksToExport', closedChecks.length);
    res.status(200).send({ closedChecks });
  } catch (error) {
    console.log('FAILED: /checksToExport');
    console.error(error);
    next(error);
  }
}

