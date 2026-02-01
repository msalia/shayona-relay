// @generated automatically by Diesel CLI.

diesel::table! {
    active_kds_theme (ActiveKdsThemeID) {
        ActiveKdsThemeID -> Bigint,
        HierStrucID -> Bigint,
        KdsThemeID -> Nullable<Bigint>,
        KdsThemePeriodID -> Nullable<Bigint>,
        LastChangeTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    add_transfer_revenue_center (AddTransRevCtrID) {
        AddTransRevCtrID -> Integer,
        HierStrucID -> Bigint,
        XferIndex -> Integer,
        RevCtrID -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    allergen (AllergenID) {
        AllergenID -> Bigint,
        HierStrucID -> Bigint,
        AllergenIndex -> Integer,
        #[max_length = 128]
        AllergenCode -> Nullable<Varchar>,
        NameID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        LastPostingTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    allergen_class (AllergenClassID) {
        AllergenClassID -> Bigint,
        HierStrucID -> Bigint,
        NameID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        #[max_length = 2000]
        AllergenData -> Nullable<Varchar>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    alphanumeric_keyboard (AlphanumericKeyboardID) {
        AlphanumericKeyboardID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        PopupNameID -> Bigint,
        ContentDataID -> Bigint,
        #[max_length = 8]
        OptionBits -> Varchar,
        LangID -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        #[max_length = 256]
        InternalTemplate -> Varchar,
    }
}

diesel::table! {
    application_text (ApplicationTextID) {
        ApplicationTextID -> Integer,
        HierStrucID -> Bigint,
        TextID -> Bigint,
        ApplicationKey -> Unsigned<Tinyint>,
        #[max_length = 64]
        TextKey -> Varchar,
    }
}

diesel::table! {
    assembly_config (AssemblyConfigID) {
        AssemblyConfigID -> Bigint,
        HierStrucID -> Nullable<Bigint>,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        ContentDataID -> Nullable<Bigint>,
        ModuleType -> Integer,
        #[max_length = 100]
        AssemblyName -> Nullable<Varchar>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        #[max_length = 100]
        MinimumCompatibility -> Nullable<Varchar>,
        #[max_length = 100]
        MaximumCompatibility -> Nullable<Varchar>,
    }
}

diesel::table! {
    auto_menu_level (AutoMenuLvlID) {
        AutoMenuLvlID -> Integer,
        HierStrucID -> Bigint,
        AutoMenuLvlIndex -> Integer,
        #[max_length = 8]
        OptionBits -> Varchar,
        StartTime -> Nullable<Integer>,
        EndTime -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        MainLevelIndex -> Nullable<Integer>,
        SubLevelIndex -> Nullable<Integer>,
    }
}

diesel::table! {
    autofire_parameter (AutofireParamID) {
        AutofireParamID -> Integer,
        HierStrucID -> Bigint,
        WorkstationID -> Nullable<Integer>,
        MaxChecks -> Nullable<Integer>,
        TendMedID -> Nullable<Integer>,
        #[max_length = 8]
        OptionBits -> Varchar,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        MaxDays -> Nullable<Smallint>,
        EmployeeID -> Nullable<Bigint>,
        BackupDelay -> Nullable<Integer>,
    }
}

diesel::table! {
    barcode (BarcodeID) {
        BarcodeID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        Code -> Bigint,
        Price -> Nullable<Decimal>,
        PrepCost -> Nullable<Decimal>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        MiMasterObjNum -> Nullable<Integer>,
        MiDefSeqNum -> Nullable<Integer>,
        MiPriceSeqNum -> Nullable<Integer>,
        LeadNumZeros -> Integer,
    }
}

diesel::table! {
    barcode_format (BarcodeFormatID) {
        BarcodeFormatID -> Integer,
        HierStrucID -> Bigint,
        NameID -> Nullable<Bigint>,
        BarcodeFormatSetID -> Integer,
        BarcodeFormatIndex -> Smallint,
        Length -> Integer,
        StartPosition -> Integer,
        ReturnedLength -> Integer,
        Custom -> Bit,
    }
}

diesel::table! {
    barcode_format_set (BarcodeFormatSetID) {
        BarcodeFormatSetID -> Integer,
        HierStrucID -> Bigint,
        NameID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
    }
}

diesel::table! {
    browser_allowed_url (BrowserAllowedUrlId) {
        BrowserAllowedUrlId -> Bigint,
        HierStrucID -> Bigint,
        #[max_length = 512]
        UrlAddress -> Varchar,
        DescriptionId -> Nullable<Bigint>,
        #[max_length = 8]
        OptionBits -> Varchar,
        OrganizationId -> Nullable<Bigint>,
    }
}

diesel::table! {
    canadian_gst (GstID) {
        GstID -> Integer,
        HierStrucID -> Bigint,
        #[max_length = 16]
        OptionBits -> Varchar,
        Threshold1 -> Nullable<Decimal>,
        Threshold2 -> Nullable<Decimal>,
        PstNameID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        TaxIndex -> Nullable<Smallint>,
    }
}

diesel::table! {
    canadian_pst (PstID) {
        PstID -> Integer,
        HierStrucID -> Bigint,
        RateIndex -> Integer,
        #[max_length = 8]
        OptionBits1 -> Varchar,
        Threshold1 -> Nullable<Decimal>,
        #[max_length = 8]
        OptionBits2 -> Varchar,
        Threshold2 -> Nullable<Decimal>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        TaxIndex -> Nullable<Smallint>,
    }
}

diesel::table! {
    cashier (CashierID) {
        CashierID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        TrkGrpID -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        LastPostingTime -> Nullable<Datetime>,
        ShiftNumber -> Nullable<Integer>,
    }
}

diesel::table! {
    change_set (ChangeSetID) {
        ChangeSetID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        IsDeleted -> Bit,
        AllowLocalControl -> Nullable<Bit>,
    }
}

diesel::table! {
    change_set_timetable (ChangeSetTimetableID) {
        ChangeSetTimetableID -> Bigint,
        StartTime -> Nullable<Datetime>,
        EndTime -> Nullable<Datetime>,
        #[max_length = 1]
        TimeIsLocal -> Varchar,
        MinLeadTime -> Nullable<Datetime>,
        MaxLeadTime -> Nullable<Datetime>,
        ChangeSetID -> Integer,
        HierStrucID -> Bigint,
        RequireLocalControl -> Nullable<Bit>,
        MustActivateBy -> Nullable<Datetime>,
        OverrideStatus -> Bit,
    }
}

diesel::table! {
    changeset_eff_status (ChangesetEffStatusID) {
        ChangesetEffStatusID -> Integer,
        HierStrucID -> Bigint,
        ChangesetID -> Integer,
        ChangesetObjNum -> Nullable<Integer>,
        OverrideStatus -> Nullable<Bit>,
    }
}

diesel::table! {
    channel_mgmt_post_data (ChannelMgmtPostDataId) {
        ChannelMgmtPostDataId -> Bigint,
        #[max_length = 40]
        CheckGuid -> Varchar,
        CurrentStatus -> Integer,
        CurrentJsonVal -> Longtext,
        LastReqDateTime -> Datetime,
        CheckFireTime -> Nullable<Datetime>,
        CheckNumber -> Integer,
    }
}

diesel::table! {
    charge_tender_parameter (ChgTendParamID) {
        ChgTendParamID -> Integer,
        HierStrucID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        CashTenderObjNum -> Nullable<Integer>,
        BankTenderObjNum -> Nullable<Integer>,
        CashDeclareTenderObjNum -> Nullable<Integer>,
        AutoSvcObjNum -> Nullable<Integer>,
        CoverChgObjNum -> Nullable<Integer>,
        ReprintTenderObjNum -> Nullable<Integer>,
        SuspendOrderTenderObjNum -> Nullable<Integer>,
        CreditCardTenderObjNum -> Nullable<Integer>,
        KdsGuestCheckTenderObjNum -> Nullable<Integer>,
        ServiceTenderObjNum -> Nullable<Integer>,
        PrintTenderObjNum -> Nullable<Integer>,
        GiftCardActivateObjNum -> Nullable<Integer>,
        GiftCardIssueObjNum -> Nullable<Integer>,
        GiftCardReloadObjNum -> Nullable<Integer>,
        GiftCardRedeemObjNum -> Nullable<Integer>,
        GiftCardCashOutObjNum -> Nullable<Integer>,
        CreditCardAuthPaymentObjNum -> Nullable<Integer>,
        CreditCardCashbackObjNum -> Nullable<Integer>,
        RoomChargeTenderObjNum -> Nullable<Integer>,
        AmountAdjustmentObjNum -> Nullable<Integer>,
        DonationObjNum -> Nullable<Integer>,
        CCSurchargeObjNum -> Nullable<Integer>,
        PackageObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    check_detail (CheckDetailID) {
        CheckID -> Bigint,
        DetailIndex -> Integer,
        DetailType -> Integer,
        #[max_length = 64]
        Status -> Varchar,
        Seat -> Nullable<Integer>,
        RevCtrID -> Nullable<Integer>,
        EmployeeID -> Nullable<Bigint>,
        SalesCount -> Nullable<Integer>,
        Total -> Nullable<Decimal>,
        VoidLink -> Nullable<Integer>,
        Numerator -> Nullable<Integer>,
        Denominator -> Nullable<Integer>,
        StoredValueCardID -> Nullable<Integer>,
        StoredValueCardType -> Nullable<Integer>,
        DetailPostingTime -> Nullable<Datetime>,
        DetailLink -> Nullable<Integer>,
        TaxForgivenTotal -> Nullable<Decimal>,
        ParentDetailLink -> Nullable<Integer>,
        RoundNumber -> Nullable<Smallint>,
        CheckDetailID -> Bigint,
        KdsDetailLink -> Nullable<Integer>,
        #[max_length = 30]
        KdsOrderID -> Nullable<Varchar>,
        GuestCount -> Nullable<Integer>,
        ObjectNumber -> Nullable<Integer>,
        OwnerDetailLink -> Nullable<Integer>,
        OrdChannelID -> Nullable<Bigint>,
        AuthEmployeeID -> Nullable<Bigint>,
    }
}

diesel::table! {
    check_detail_order_device (CheckDetailOrdDvcID) {
        CheckDetailOrdDvcID -> Bigint,
        CheckDetailID -> Bigint,
        OrdDvcIndex -> Integer,
    }
}

diesel::table! {
    check_detail_tax (CheckDetailTaxID) {
        CheckDetailTaxID -> Bigint,
        CheckDetailID -> Bigint,
        TaxID -> Integer,
    }
}

diesel::table! {
    check_number_parameter (ChkNumParamID) {
        ChkNumParamID -> Integer,
        HierStrucID -> Bigint,
        MinCheck -> Integer,
        MaxCheck -> Integer,
        NextCheck -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    checks (CheckID) {
        CheckID -> Bigint,
        RevCtrID -> Integer,
        CheckNumber -> Integer,
        #[max_length = 40]
        Guid -> Varchar,
        Covers -> Nullable<Integer>,
        DiningTableID -> Nullable<Integer>,
        EmployeeID -> Nullable<Bigint>,
        CashierID -> Nullable<Integer>,
        WorkstationID -> Nullable<Integer>,
        AutofireWorkstationID -> Nullable<Integer>,
        CheckOpen -> Datetime,
        TableOpen -> Nullable<Datetime>,
        CheckClose -> Nullable<Datetime>,
        FirstPrint -> Nullable<Datetime>,
        Fire -> Nullable<Datetime>,
        AutofireRevCtrID -> Nullable<Integer>,
        AutofireTendMedID -> Nullable<Integer>,
        #[max_length = 16]
        AutofirePrinterMask -> Varchar,
        AddedToRevCtrID -> Nullable<Integer>,
        SplitFromRevCtrID -> Nullable<Integer>,
        AddedToCheckNum -> Nullable<Integer>,
        SplitFromCheckNum -> Nullable<Integer>,
        ReopenedFromCheckNum -> Nullable<Integer>,
        ReopenedToCheckNum -> Nullable<Integer>,
        #[max_length = 48]
        Status -> Varchar,
        #[max_length = 104]
        ClosedSeat -> Varchar,
        #[max_length = 104]
        PrintedSeat -> Varchar,
        ServingPeriodID -> Nullable<Integer>,
        #[max_length = 64]
        ServingPeriodTaxMask -> Varchar,
        GroupNum -> Nullable<Integer>,
        OrdTypeID -> Nullable<Integer>,
        AddedIn -> Nullable<Integer>,
        SplitOut -> Nullable<Integer>,
        LineFind -> Nullable<Integer>,
        PageNumber -> Nullable<Integer>,
        PrintCount -> Nullable<Integer>,
        #[max_length = 20]
        AlternateID -> Nullable<Varchar>,
        SubTotal -> Nullable<Decimal>,
        Tax -> Nullable<Decimal>,
        AutoGratuity -> Nullable<Decimal>,
        Other -> Nullable<Decimal>,
        Payment -> Nullable<Decimal>,
        Due -> Nullable<Decimal>,
        Deposit -> Nullable<Decimal>,
        MaxTotal -> Nullable<Decimal>,
        LastWorkstationID -> Nullable<Integer>,
        LangID -> Integer,
        CloseStatus -> Unsigned<Tinyint>,
        UserCustomData -> Nullable<Smallint>,
        CheckPostingTime -> Nullable<Datetime>,
        Version -> Nullable<Smallint>,
        #[max_length = 30]
        KdsOrderID -> Nullable<Varchar>,
        BarcodeEditCount -> Nullable<Integer>,
        GiftReceiptCount -> Nullable<Integer>,
        TaxByCheck -> Nullable<Decimal>,
        TaxCollected -> Nullable<Decimal>,
        RoundNumber -> Smallint,
        #[max_length = 40]
        RoundGuid -> Varchar,
        PostingServingPeriodID -> Nullable<Integer>,
        #[max_length = 40]
        ReopenedToCheckGuid -> Nullable<Varchar>,
        #[max_length = 40]
        ReopenedFromCheckGuid -> Nullable<Varchar>,
        #[max_length = 40]
        AddedToCheckGuid -> Nullable<Varchar>,
        #[max_length = 40]
        SplitFromCheckGuid -> Nullable<Varchar>,
        PendingAutoDiscount -> Nullable<Decimal>,
        TransferToEmployeeID -> Nullable<Bigint>,
        LastEmployeeID -> Nullable<Bigint>,
        DetailCount -> Nullable<Integer>,
        CheckDetailData -> Nullable<Longblob>,
        PrintedRoundNumber -> Smallint,
        ItemInclusiveTax -> Nullable<Decimal>,
        TeamID -> Nullable<Integer>,
        PickupTime -> Nullable<Datetime>,
        GroupEventDefDtlID -> Nullable<Bigint>,
        OrdStatusId -> Nullable<Integer>,
        OrderMethodObjNum -> Nullable<Integer>,
        IntendedPaymentMethod -> Nullable<Unsigned<Tinyint>>,
        RequestedPickupDateTimeUtc -> Nullable<Datetime>,
        QuotedPickupDateTimeUtc -> Nullable<Datetime>,
        ActualPickupDateTimeUtc -> Nullable<Datetime>,
        PickupQuoteTime -> Nullable<Integer>,
        PickupQuoteType -> Nullable<Unsigned<Tinyint>>,
        RequestedDeliveryDateTimeUtc -> Nullable<Datetime>,
        QuotedDeliveryDateTimeUtc -> Nullable<Datetime>,
        ActualDeliveryDateTimeUtc -> Nullable<Datetime>,
        DeliveryQuoteTime -> Nullable<Integer>,
        DeliveryQuoteType -> Nullable<Unsigned<Tinyint>>,
        PickupPersonArrivalDateTimeUtc -> Nullable<Datetime>,
        OrderConfirmedDateTimeUtc -> Nullable<Datetime>,
        DeliveryEmployeeID -> Nullable<Bigint>,
        OrdChannelID -> Nullable<Bigint>,
    }
}

diesel::table! {
    clear_totals (ClearTotalsID) {
        ClearTotalsID -> Integer,
        HierStrucID -> Bigint,
        ClearAsOfBusinessDate -> Datetime,
        ClearAsOfDateTime -> Datetime,
        IsCleared -> Bit,
    }
}

diesel::table! {
    cm_account (CmAccountID) {
        CmAccountID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        #[max_length = 8]
        OptionBits -> Varchar,
        #[max_length = 128]
        ReferenceCode -> Nullable<Varchar>,
    }
}

diesel::table! {
    cm_cash_count_threshold (CmCashCountThresholdID) {
        CmCashCountThresholdID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        MinThreshold -> Nullable<Decimal>,
        MaxThreshold -> Nullable<Decimal>,
        MaxCountAttempts -> Integer,
        #[max_length = 8]
        OptionBits -> Varchar,
    }
}

diesel::table! {
    cm_cash_count_thrshld_cls (CmCashCountThresholdClassID) {
        CmCashCountThresholdClassID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        CmCashCountThresholdID -> Bigint,
        CmItemObjNum -> Integer,
        MinThreshold -> Nullable<Decimal>,
        MaxThreshold -> Nullable<Decimal>,
    }
}

diesel::table! {
    cm_cash_pull_threshold (CmCashPullThresholdID) {
        CmCashPullThresholdID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        ChitQuantity -> Nullable<Smallint>,
    }
}

diesel::table! {
    cm_cash_pull_threshold_level (CmCashPullThresholdLevelID) {
        CmCashPullThresholdLevelID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        #[max_length = 8]
        OptionBits -> Varchar,
        CmCashPullThresholdID -> Bigint,
        Amount -> Nullable<Decimal>,
    }
}

diesel::table! {
    cm_change_order (CmChangeOrderID) {
        CmChangeOrderID -> Bigint,
        HierStrucID -> Bigint,
        CMReceptacleDetailID -> Bigint,
        ChangeOrderStatus -> Smallint,
        ChangeOrderMethod -> Smallint,
        CMBankReceptacleDetailID -> Nullable<Bigint>,
        #[max_length = 128]
        ReferenceChangeOrder -> Nullable<Varchar>,
        DayOfWeek -> Integer,
        TransTime -> Datetime,
        CmItemID -> Bigint,
        CmChangeReceptacleDetailID -> Nullable<Bigint>,
    }
}

diesel::table! {
    cm_change_order_items (CmChangeOrderItemID) {
        CmChangeOrderItemID -> Bigint,
        HierStrucID -> Bigint,
        CmChangeOrderID -> Bigint,
        CmItemUnitID -> Nullable<Bigint>,
        Quantity -> Nullable<Integer>,
        Amount -> Nullable<Decimal>,
    }
}

diesel::table! {
    cm_count_detail (CmCountDetailID) {
        CmCountDetailID -> Bigint,
        HierStrucID -> Bigint,
        CmCountsheetID -> Bigint,
        CmReceptacleDetailID -> Nullable<Bigint>,
        #[max_length = 128]
        Reference -> Nullable<Varchar>,
        TransTime -> Datetime,
        CountState -> Smallint,
    }
}

diesel::table! {
    cm_count_detail_classes (CmCountClassItemID) {
        CmCountClassItemID -> Bigint,
        CmCountDetailID -> Bigint,
        CmItemID -> Bigint,
        Amount -> Nullable<Decimal>,
        ExpectedAmount -> Nullable<Decimal>,
        Variance -> Nullable<Decimal>,
        Adjustment -> Nullable<Decimal>,
        AdjustReasonID -> Nullable<Integer>,
    }
}

diesel::table! {
    cm_count_detail_items (CmCountDetailItemID) {
        CmCountDetailItemID -> Bigint,
        CmCountDetailID -> Bigint,
        CmItemUnitID -> Nullable<Bigint>,
        CmCountsheetGroupID -> Nullable<Bigint>,
        Quantity -> Nullable<Integer>,
        Amount -> Nullable<Decimal>,
        #[max_length = 64]
        Reference -> Nullable<Varchar>,
    }
}

diesel::table! {
    cm_countsheet (CmCountSheetID) {
        CmCountSheetID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        #[max_length = 8]
        OptionBits -> Varchar,
    }
}

diesel::table! {
    cm_countsheet_group (CmCountsheetGroupID) {
        CmCountsheetGroupID -> Bigint,
        CmCountsheetID -> Nullable<Bigint>,
        HierStrucID -> Bigint,
        CmItemID -> Nullable<Bigint>,
        ObjectNumber -> Integer,
        NameID -> Nullable<Bigint>,
        CmCountsheetPageID -> Bigint,
        SortOrder -> Integer,
        #[max_length = 8]
        OptionBits -> Varchar,
    }
}

diesel::table! {
    cm_countsheet_group_detail (CmCountsheetGroupDetailID) {
        CmCountsheetGroupDetailID -> Bigint,
        CmCountsheetGroupID -> Bigint,
        CmItemUnitID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        SortOrder -> Integer,
        #[max_length = 8]
        OptionBits -> Varchar,
    }
}

diesel::table! {
    cm_countsheet_page (CmCountsheetPageID) {
        CmCountsheetPageID -> Bigint,
        HierStrucID -> Bigint,
        CmCountsheetID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        SortOrder -> Integer,
    }
}

diesel::table! {
    cm_employee_till_assignment (CmEmployeeTillAssignmentID) {
        CmEmployeeTillAssignmentID -> Integer,
        EmployeeID -> Bigint,
        #[max_length = 40]
        ReceptacleGuid -> Varchar,
        StartTime -> Datetime,
    }
}

diesel::table! {
    cm_item (CmItemID) {
        CmItemID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        #[max_length = 8]
        OptionBits -> Varchar,
        CurrencyObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    cm_item_behavior (CmItemBehaviorID) {
        CmItemBehaviorID -> Bigint,
        HierStrucID -> Bigint,
        CmItemID -> Bigint,
        ObjectNumber -> Integer,
        #[max_length = 8]
        OptionBits -> Varchar,
    }
}

diesel::table! {
    cm_item_pos_items (CmItemItemsID) {
        CmItemItemsID -> Bigint,
        HierStrucID -> Bigint,
        CmItemID -> Bigint,
        ObjectNumber -> Integer,
        POSObjNum -> Integer,
        POSObjType -> Unsigned<Tinyint>,
        CmItemBehaviorID -> Bigint,
    }
}

diesel::table! {
    cm_item_units (CmItemUnitID) {
        CmItemUnitID -> Bigint,
        HierStrucID -> Bigint,
        CmItemID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        Denominator -> Integer,
        Numerator -> Integer,
        #[max_length = 8]
        OptionBits -> Varchar,
    }
}

diesel::table! {
    cm_par_level (CmParLevelID) {
        CmParLevelID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        CmItemObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    cm_par_level_item (CmParLeveItemID) {
        CmParLeveItemID -> Bigint,
        HierStrucID -> Bigint,
        CmParLevelID -> Bigint,
        ObjectNumber -> Integer,
        CmItemUnitObjNum -> Integer,
        Value -> Nullable<Integer>,
        DayOfWeek -> Integer,
    }
}

diesel::table! {
    cm_parameter (CMParameterID) {
        CMParameterID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        ChangeOrderReportsCount -> Integer,
        #[max_length = 64]
        OptionBits -> Varchar,
        ReceptacleBalancingItemObjNum -> Nullable<Integer>,
        CashPullWarningFrequencyID -> Nullable<Integer>,
        PaidInPaidOutChitCount -> Integer,
        CountingMethod -> Integer,
        ServerBankingTemplateObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    cm_receptacle (CmReceptacleID) {
        CmReceptacleID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        CmReceptacleType -> Nullable<Unsigned<Tinyint>>,
        CmReceptacleTemplateObjNum -> Nullable<Integer>,
        Location -> Nullable<Unsigned<Tinyint>>,
        #[max_length = 8]
        OptionBits -> Varchar,
        StartAmount -> Nullable<Decimal>,
    }
}

diesel::table! {
    cm_receptacle_detail (CmReceptacleDetailID) {
        CmReceptacleDetailID -> Bigint,
        HierStrucID -> Bigint,
        CmReceptacleID -> Nullable<Bigint>,
        #[max_length = 40]
        Guid -> Nullable<Varchar>,
        ReceptacleType -> Unsigned<Tinyint>,
        State -> Unsigned<Tinyint>,
        StartAmount -> Nullable<Decimal>,
        StartTime -> Datetime,
        CloseTime -> Nullable<Datetime>,
        CashPullAmount -> Nullable<Decimal>,
        CmCountsheetID -> Nullable<Bigint>,
        CmParLevelID -> Nullable<Bigint>,
        SessionId -> Nullable<Bigint>,
        #[max_length = 128]
        Reference -> Nullable<Varchar>,
        OperatorID -> Nullable<Bigint>,
        FailedCount -> Nullable<Unsigned<Tinyint>>,
        CashPullReceptacleID -> Nullable<Bigint>,
        SourceReceptacleID -> Nullable<Bigint>,
        ReceptacleStatus -> Integer,
        BusinessDate -> Nullable<Datetime>,
    }
}

diesel::table! {
    cm_receptacle_template (CmReceptacleTemplateID) {
        CmReceptacleTemplateID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        DescriptionID -> Nullable<Bigint>,
        TemplateType -> Unsigned<Tinyint>,
        StartAmount -> Nullable<Decimal>,
        #[max_length = 8]
        OptionBits -> Varchar,
        Minimum -> Nullable<Decimal>,
        Maximum -> Nullable<Decimal>,
        CmCountSheetObjNum -> Nullable<Integer>,
        CmParLevelObjNum -> Nullable<Integer>,
        CmCashPullThresholdObjNum -> Nullable<Integer>,
        Location -> Nullable<Unsigned<Tinyint>>,
        StartAmtSourceReceptacleObjNum -> Nullable<Integer>,
        DesignatedCashPullReceptObjNum -> Nullable<Integer>,
        CashCountThresholdObjNum -> Nullable<Integer>,
        CashDepositRoutingObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    cm_template_class (CmTemplateClassID) {
        CmTemplateClassID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        CmReceptacleTemplateID -> Bigint,
        CmItemObjNum -> Integer,
        StartAmount -> Nullable<Decimal>,
        StartAmtSourceReceptacleObjNum -> Nullable<Integer>,
        #[max_length = 8]
        OptionBits -> Varchar,
        CmCashPullThresholdObjNum -> Nullable<Integer>,
        DesignatedCashPullReceptObjNum -> Nullable<Integer>,
        Minimum -> Nullable<Decimal>,
        Maximum -> Nullable<Decimal>,
        CashDepositRoutingObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    cm_template_class_exclude (CmTemplateClassExclusionID) {
        CmTemplateClassExclusionID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        CmReceptacleTemplateID -> Bigint,
        CmItemObjNum -> Integer,
    }
}

diesel::table! {
    cm_template_par_level (CmTemplatePARLevelID) {
        CmTemplatePARLevelID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        CmReceptacleTemplateID -> Bigint,
        CmParLevelObjNum -> Integer,
    }
}

diesel::table! {
    cm_till_session (CMTillSessionID) {
        CMTillSessionID -> Integer,
        EmployeeID -> Bigint,
        WorkstationID -> Integer,
        DrawerID -> Integer,
        BusinessDate -> Datetime,
        CreatedDate -> Datetime,
        Status -> Nullable<Smallint>,
    }
}

diesel::table! {
    cm_transaction_detail (CmTransactionDetailID) {
        CmTransactionDetailID -> Bigint,
        HierStrucID -> Bigint,
        CmReceptacleDetailID -> Bigint,
        EmployeeID -> Bigint,
        WorkstationID -> Nullable<Bigint>,
        TransactionTime -> Datetime,
        TransactionType -> Unsigned<Tinyint>,
        DrawerNumber -> Nullable<Integer>,
        PosType -> Nullable<Unsigned<Tinyint>>,
        PosItemID -> Nullable<Bigint>,
        Amount -> Nullable<Decimal>,
        ForeignAmount -> Nullable<Decimal>,
        CmTargetReceptacleDetailID -> Nullable<Bigint>,
        TargetEmployeeID -> Nullable<Bigint>,
        CmVendorID -> Nullable<Bigint>,
        CmAccountID -> Nullable<Bigint>,
        PosTransactionID -> Nullable<Bigint>,
        CmItemID -> Nullable<Bigint>,
        Balance -> Nullable<Decimal>,
        ReasonID -> Nullable<Integer>,
        #[max_length = 128]
        Reference -> Nullable<Varchar>,
        CashBalance -> Nullable<Decimal>,
        #[max_length = 50]
        InvoiceNumber -> Nullable<Varchar>,
        InvoiceDate -> Nullable<Datetime>,
        #[max_length = 128]
        Description -> Nullable<Varchar>,
        StartAmount -> Nullable<Decimal>,
        CashPullAmount -> Nullable<Decimal>,
        OtherCmReceptacleDetailID -> Nullable<Bigint>,
    }
}

diesel::table! {
    cm_vendor (CmVendorID) {
        CmVendorID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        #[max_length = 8]
        OptionBits -> Varchar,
        CmAccObjNum -> Nullable<Integer>,
        #[max_length = 128]
        ReferenceCode -> Nullable<Varchar>,
    }
}

diesel::table! {
    combo (ComboID) {
        ComboID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        #[max_length = 16]
        OptionBits -> Varchar,
        Priority -> Nullable<Integer>,
        MenuItemMasterObjNum -> Nullable<Integer>,
        MainItemComboGroupObjNum -> Nullable<Integer>,
        AutoComboAlgorithm -> Nullable<Smallint>,
    }
}

diesel::table! {
    combo_group (ComboGroupID) {
        ComboGroupID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        #[max_length = 8]
        OptionBits -> Varchar,
        SluIndex -> Nullable<Integer>,
        HhtSluIndex -> Nullable<Integer>,
    }
}

diesel::table! {
    combo_group_detail (ComboGroupDetailID) {
        ComboGroupDetailID -> Integer,
        HierStrucID -> Bigint,
        ComboGroupID -> Integer,
        Size1ComboGroupDetailID -> Nullable<Integer>,
        Size2ComboGroupDetailID -> Nullable<Integer>,
        Size3ComboGroupDetailID -> Nullable<Integer>,
        Size4ComboGroupDetailID -> Nullable<Integer>,
        #[max_length = 48]
        OptionBits -> Varchar,
        Quantity -> Integer,
        Size1MenuLvlIndex -> Nullable<Integer>,
        Size2MenuLvlIndex -> Nullable<Integer>,
        Size3MenuLvlIndex -> Nullable<Integer>,
        Size4MenuLvlIndex -> Nullable<Integer>,
        MenuItemMasterObjNum -> Nullable<Integer>,
        ChangeSetObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    combo_group_detail_price (ComboGroupDetailPriceID) {
        ComboGroupDetailPriceID -> Integer,
        HierStrucID -> Bigint,
        ComboGroupDetailID -> Integer,
        SequenceNum -> Integer,
        MenuLvlIndex -> Nullable<Integer>,
        Price -> Nullable<Decimal>,
        ChangeSetObjNum -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        PrepCost -> Nullable<Decimal>,
    }
}

diesel::table! {
    combo_group_price (ComboGroupPriceID) {
        ComboGroupPriceID -> Integer,
        HierStrucID -> Bigint,
        ComboSideID -> Integer,
        SequenceNum -> Integer,
        MenuLvlIndex -> Nullable<Integer>,
        Price -> Nullable<Decimal>,
        PrepCost -> Nullable<Decimal>,
    }
}

diesel::table! {
    combo_group_substitutions (ComboGroupSubstitutionId) {
        ComboGroupSubstitutionId -> Bigint,
        ComboGroup -> Integer,
        AlternateComboGroup -> Integer,
        HierStrucID -> Bigint,
    }
}

diesel::table! {
    combo_side (ComboSideID) {
        ComboSideID -> Integer,
        HierStrucID -> Bigint,
        ComboID -> Integer,
        SideNumber -> Smallint,
        ComboGroupObjNum -> Nullable<Integer>,
        SideCount -> Nullable<Smallint>,
        DefaultMenuLvlIndex -> Nullable<Smallint>,
        #[max_length = 8]
        MenuLvls -> Varchar,
    }
}

diesel::table! {
    component (ComponentID) {
        ComponentID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Bigint>,
        NameID -> Bigint,
        PrepTime -> Nullable<Integer>,
        #[max_length = 8]
        OptionBits -> Varchar,
        PrintClassObjNum -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        DisplayName -> Nullable<Bigint>,
        CapacityUsage -> Integer,
        PreProdCourseOffset -> Nullable<Smallint>,
    }
}

diesel::table! {
    component_condiment (ComponentCondimentID) {
        ComponentCondimentID -> Bigint,
        HierStrucID -> Bigint,
        ComponentObjNum -> Bigint,
        MenuItemObjNum -> Integer,
        MenuItemDefSeqNum -> Integer,
        MenuItemDefID -> Bigint,
    }
}

diesel::table! {
    condiment_set (CondimentSetID) {
        CondimentSetID -> Bigint,
        IsDeleted -> Bit,
        #[max_length = 50]
        TempConfiguration -> Nullable<Varchar>,
        ObjectNumber -> Nullable<Integer>,
        IsVisible -> Bit,
        HierStrucID -> Bigint,
        NameID -> Nullable<Bigint>,
    }
}

diesel::table! {
    condiment_set_condiment (CondimentSetCondID) {
        CondimentSetCondID -> Bigint,
        #[max_length = 8]
        OptionBits -> Nullable<Varchar>,
        DefaultCount -> Nullable<Integer>,
        PriceLevel -> Nullable<Smallint>,
        SortOrder -> Nullable<Smallint>,
        #[max_length = 50]
        TempConfiguration -> Nullable<Varchar>,
        HierStrucID -> Nullable<Bigint>,
        CondimentSetID -> Bigint,
        DefLevel -> Nullable<Smallint>,
        MenuItemMasterObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    confirm_parameter (ConfirmParamID) {
        ConfirmParamID -> Integer,
        HierStrucID -> Bigint,
        #[max_length = 96]
        OptionBits -> Varchar,
        MaxGuest -> Nullable<Integer>,
        MaxCheckPrint -> Nullable<Integer>,
        PopUpTimeout -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        DaysAdjustClsdChk -> Nullable<Integer>,
        DaysReopenClsdChk -> Nullable<Integer>,
        EmpLockDuration -> Nullable<Integer>,
        EmpLockSchStartTime -> Nullable<Integer>,
        #[max_length = 96]
        WorkstationReportsDefaultView -> Varchar,
        HoldFireWarningTime -> Nullable<Integer>,
        DaysReprintClsdChk -> Nullable<Integer>,
    }
}

diesel::table! {
    consent_definition (ConsentID) {
        ConsentID -> Integer,
        Description -> Longtext,
        HierStrucID -> Bigint,
        KeepPIIData -> Nullable<Integer>,
        LangID -> Integer,
    }
}

diesel::table! {
    consent_detail (EmployeeID) {
        ConsentID -> Integer,
        EmployeeID -> Bigint,
        ConsentFlag -> Bit,
        LastUpdatedDateTime -> Datetime,
        AnonymizedDateTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    content (ContentID) {
        ContentID -> Bigint,
        #[max_length = 200]
        Name -> Nullable<Varchar>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        ContentDataID -> Nullable<Bigint>,
        DescriptionID -> Nullable<Bigint>,
        HierStrucID -> Nullable<Bigint>,
    }
}

diesel::table! {
    content_data (ContentDataID) {
        ContentDataID -> Bigint,
        DataBlob -> Nullable<Longblob>,
        #[max_length = 200]
        Source -> Nullable<Varchar>,
        #[max_length = 400]
        FileNameOrigin -> Nullable<Varchar>,
        ContentTypeID -> Nullable<Integer>,
        HierStrucID -> Bigint,
        #[max_length = 1024]
        WriteToDiskFileName -> Nullable<Varchar>,
        Configuration -> Nullable<Longtext>,
        #[max_length = 32]
        Target -> Varchar,
        DataText -> Nullable<Longtext>,
        EncConfiguration -> Nullable<Longblob>,
        EncryptionKeyID -> Nullable<Integer>,
        Signature -> Nullable<Longblob>,
    }
}

diesel::table! {
    content_group (ContentGroupID) {
        ContentGroupID -> Integer,
        HierStrucID -> Bigint,
        #[max_length = 50]
        Name -> Varchar,
        GroupType -> Integer,
        #[max_length = 1024]
        Description -> Nullable<Varchar>,
        OwnerServiceID -> Nullable<Integer>,
        Data -> Nullable<Longtext>,
        Options -> Nullable<Integer>,
    }
}

diesel::table! {
    content_group_data (ContentGroupDataID) {
        ContentGroupDataID -> Integer,
        HierStrucID -> Bigint,
        ContentGroupID -> Integer,
        ContentDataID -> Bigint,
    }
}

diesel::table! {
    content_type (ContentTypeID) {
        ContentTypeID -> Integer,
        #[max_length = 200]
        Description -> Nullable<Varchar>,
        #[max_length = 200]
        ConfigurationType -> Nullable<Varchar>,
        #[max_length = 200]
        LoadType -> Nullable<Varchar>,
        #[max_length = 200]
        Comments -> Nullable<Varchar>,
        #[max_length = 200]
        Source -> Nullable<Varchar>,
        NameID -> Bigint,
    }
}

diesel::table! {
    credit_driver_instance (CredDrvInstID) {
        CredDrvInstID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        CredDrvID -> Integer,
        ConfigInfo -> Nullable<Longtext>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        ServiceID -> Nullable<Integer>,
    }
}

diesel::table! {
    credit_parameter (CredParamID) {
        CredParamID -> Integer,
        HierStrucID -> Nullable<Bigint>,
        #[max_length = 24]
        OptionBits -> Varchar,
        SavedBatches -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        MerchantConfigID -> Nullable<Integer>,
        WorkstationID -> Nullable<Integer>,
    }
}

diesel::table! {
    currency (CurrencyID) {
        CurrencyID -> Integer,
        HierStrucID -> Bigint,
        NameID -> Bigint,
        SymbolID -> Nullable<Bigint>,
        ScaleFactor -> Smallint,
        #[max_length = 16]
        OptionBits -> Varchar,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        ObjectNumber -> Integer,
        InsignificantDigits -> Nullable<Smallint>,
        SmallestAvailableBill -> Nullable<Smallint>,
        AbbreviationID -> Nullable<Bigint>,
    }
}

diesel::table! {
    currency_conversion (CurrConvID) {
        CurrConvID -> Integer,
        HierStrucID -> Bigint,
        CurrencyID -> Nullable<Integer>,
        DestCurrencyID -> Nullable<Integer>,
        Rate -> Decimal,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        ObjectNumber -> Integer,
    }
}

diesel::table! {
    currency_instance (CurrInstID) {
        CurrInstID -> Integer,
        CurrInstIndex -> Integer,
        HierStrucID -> Bigint,
        #[max_length = 16]
        OptionBits -> Varchar,
        CurrencyID -> Nullable<Integer>,
    }
}

diesel::table! {
    currency_parameter (CurrParamID) {
        CurrParamID -> Integer,
        HierStrucID -> Bigint,
        #[max_length = 8]
        OptionBits -> Varchar,
        CurrencyID -> Integer,
        AlternateCurrencyID -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    custom_report (CustomReportID) {
        CustomReportID -> Integer,
        ObjectNumber -> Nullable<Integer>,
        Definition -> Nullable<Longtext>,
        Style -> Nullable<Longtext>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        HierStrucID -> Nullable<Bigint>,
        NameID -> Nullable<Bigint>,
        ContentDataID -> Nullable<Bigint>,
    }
}

diesel::table! {
    data_dist_local_revs (LocalRevisionID) {
        LocalRevisionID -> Bigint,
        TransactionalDataType -> Integer,
        LocalRevisionNumber -> Nullable<Bigint>,
    }
}

diesel::table! {
    data_dist_revs (RevisionNumber) {
        RevisionNumber -> Bigint,
        TransactionalDataType -> Nullable<Integer>,
        NotificationType -> Nullable<Integer>,
        #[max_length = 40]
        LogicalRecordID -> Nullable<Varchar>,
        OriginatingServiceID -> Nullable<Integer>,
    }
}

diesel::table! {
    db_schema (DbTableID) {
        DbTableID -> Integer,
        #[max_length = 128]
        TblName -> Varchar,
        #[max_length = 128]
        KeyName -> Nullable<Varchar>,
        Version -> Integer,
    }
}

diesel::table! {
    deposit_info_detail (DepositDtlID) {
        DepositDtlID -> Bigint,
        CheckDetailID -> Bigint,
        #[max_length = 256]
        Address -> Nullable<Varchar>,
        DepositID -> Bigint,
        Status -> Nullable<Unsigned<Tinyint>>,
        DepositDateTime -> Nullable<Datetime>,
        DepositAmount -> Nullable<Decimal>,
        #[max_length = 256]
        Description -> Nullable<Varchar>,
        #[max_length = 256]
        DepositNotes -> Nullable<Varchar>,
        #[max_length = 40]
        FirstName -> Nullable<Varchar>,
        #[max_length = 40]
        LastName -> Nullable<Varchar>,
        #[max_length = 64]
        PaymentIdentifier -> Nullable<Varchar>,
        PaymentType -> Nullable<Unsigned<Tinyint>>,
        #[max_length = 64]
        PhoneNumber -> Nullable<Varchar>,
        #[max_length = 64]
        AltPhoneNumber -> Nullable<Varchar>,
        RefundAmount -> Nullable<Decimal>,
        ReturnDateTime -> Nullable<Datetime>,
        #[max_length = 256]
        ReturnNotes -> Nullable<Varchar>,
    }
}

diesel::table! {
    descriptors (DescriptorID) {
        DescriptorID -> Integer,
        HierStrucID -> Bigint,
        DescType -> Integer,
        LineNumber -> Nullable<Integer>,
        StringNumberID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        #[max_length = 16]
        OptionBits -> Varchar,
    }
}

diesel::table! {
    dining_course (DiningCourseID) {
        DiningCourseID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        MinPrepTime -> Nullable<Integer>,
        MaxPrepTime -> Nullable<Integer>,
        CourseColor -> Nullable<Integer>,
        CourseIcon -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        #[max_length = 255]
        CourseImageName -> Nullable<Varchar>,
        InitialCourseMinPrepTime -> Nullable<Integer>,
    }
}

diesel::table! {
    dining_course_alerts (DiningCourseAlertID) {
        DiningCourseAlertID -> Bigint,
        RVCHierStrucId -> Nullable<Bigint>,
        #[max_length = 40]
        CheckGuid -> Nullable<Varchar>,
        DiningTableId -> Nullable<Integer>,
        AlertTime -> Nullable<Datetime>,
        DiningCourseObjectNumber -> Nullable<Integer>,
        HierStrucID -> Bigint,
        AlertType -> Nullable<Integer>,
        #[max_length = 40]
        RequestGuid -> Nullable<Varchar>,
    }
}

diesel::table! {
    dining_table (DiningTableID) {
        DiningTableID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        DiningTableClassNum -> Nullable<Integer>,
    }
}

diesel::table! {
    dining_table_class (DiningTableClassID) {
        DiningTableClassID -> Integer,
        NameID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        HierStrucID -> Bigint,
        MinimumCovers -> Smallint,
        MaximumCovers -> Smallint,
        #[max_length = 255]
        DefaultImageName -> Nullable<Varchar>,
        #[max_length = 255]
        DefaultColor -> Nullable<Varchar>,
        #[max_length = 8]
        OptionBits -> Varchar,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        #[max_length = 255]
        DefaultFgndColor -> Nullable<Varchar>,
        DiningTableStatusDefSetNum -> Nullable<Integer>,
    }
}

diesel::table! {
    dining_table_states (DiningTableStatesID) {
        DiningTableStatesID -> Bigint,
        DiningTableID -> Integer,
        #[max_length = 255]
        State -> Varchar,
        Priority -> Unsigned<Tinyint>,
    }
}

diesel::table! {
    dining_table_status (DiningTableStatusID) {
        DiningTableStatusID -> Integer,
        DiningTableID -> Integer,
        StatusDefSetNumber -> Nullable<Integer>,
        StatusDefIndex -> Nullable<Integer>,
        LastUpdateTime -> Nullable<Datetime>,
        LastUpdateWorkstationID -> Nullable<Integer>,
        LastUpdateEmployeeID -> Nullable<Bigint>,
        MergedWithDiningTableID -> Nullable<Integer>,
        MergedByWorkstationID -> Nullable<Integer>,
        MergedByEmployeeID -> Nullable<Bigint>,
        HierStrucID -> Bigint,
        SectionID -> Nullable<Bigint>,
        EmployeeID -> Nullable<Bigint>,
        #[max_length = 1]
        State -> Nullable<Varchar>,
        #[max_length = 1]
        Progress -> Nullable<Varchar>,
        IsDirty -> Nullable<Bit>,
        IsUserSuggested -> Nullable<Bit>,
        DiningCourse -> Nullable<Smallint>,
        EstimatedAvailableTime -> Nullable<Smallint>,
        NumSeats -> Nullable<Smallint>,
        EstimatedTurnTime -> Nullable<Smallint>,
        NextAvailable -> Nullable<Bit>,
        KdsCourseAlertLevel -> Nullable<Smallint>,
        KdsCoursePeakAlertLevel -> Nullable<Smallint>,
        LastServiceTime -> Nullable<Datetime>,
        CheckOpenTime -> Nullable<Datetime>,
        GMSAltMaximumCovers -> Nullable<Smallint>,
        MergeParentTableCount -> Integer,
        CurrentCoverCnt -> Nullable<Integer>,
    }
}

diesel::table! {
    dining_table_status_def (DiningTableStatusDefID) {
        DiningTableStatusDefID -> Integer,
        DiningTableStatusDefSetID -> Integer,
        NameID -> Bigint,
        StatusDefIndex -> Nullable<Integer>,
        HierStrucID -> Bigint,
        #[max_length = 255]
        ObjectKey -> Nullable<Varchar>,
        #[max_length = 255]
        OverrideImageName -> Nullable<Varchar>,
        #[max_length = 255]
        OverrideColor -> Nullable<Varchar>,
        #[max_length = 8]
        OptionBits -> Varchar,
        #[max_length = 255]
        OverrideFgndColor -> Nullable<Varchar>,
    }
}

diesel::table! {
    dining_table_status_def_set (DiningTableStatusDefSetID) {
        DiningTableStatusDefSetID -> Integer,
        NameID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        HierStrucID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        DefaultIndex -> Nullable<Integer>,
        DisabledIndex -> Nullable<Integer>,
    }
}

diesel::table! {
    discount (DscntID) {
        DscntID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        #[max_length = 56]
        OptionBits -> Varchar,
        #[max_length = 8]
        PrintOptionBits -> Nullable<Varchar>,
        Nlu -> Nullable<Bigint>,
        TransDfltMain -> Bit,
        MainMenuLvlIndex -> Nullable<Integer>,
        TransDfltSub -> Bit,
        SubMenuLvlIndex -> Nullable<Integer>,
        Percentage -> Nullable<Decimal>,
        Amount -> Nullable<Decimal>,
        PrivilegeGrp -> Nullable<Integer>,
        IconNumber -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        DiscountPostingTime -> Nullable<Datetime>,
        #[max_length = 2000]
        TempConfiguration -> Nullable<Varchar>,
        EffectivityID -> Nullable<Bigint>,
        RvcGroupID -> Nullable<Integer>,
        ActivationType -> Nullable<Smallint>,
        Priority -> Nullable<Smallint>,
        RuleType -> Nullable<Smallint>,
        TriggerQuantity -> Nullable<Integer>,
        TriggerTotal -> Nullable<Decimal>,
        AwardType -> Nullable<Smallint>,
        AwardCount -> Nullable<Integer>,
        AwardMaxCount -> Nullable<Integer>,
        #[max_length = 32]
        ItemExclusivityMask -> Varchar,
        #[max_length = 32]
        TransactionExclusivityMask -> Varchar,
        Imported -> Bit,
        Locked -> Bit,
        Enabled -> Bit,
        CreationDateTime -> Nullable<Datetime>,
        DiscountComment -> Nullable<Longtext>,
        TriggerObjectNumber -> Nullable<Integer>,
        AwardObjectNumber -> Nullable<Integer>,
        MaxCountPerCheck -> Nullable<Smallint>,
        TaxClassObjNum -> Nullable<Integer>,
        SluIndex -> Nullable<Integer>,
        HhtSluIndex -> Nullable<Integer>,
        TriggerMenuItemGroupObjNum -> Nullable<Integer>,
        TriggerMenuItemGroupObjNum2 -> Nullable<Integer>,
        TriggerMenuItemGroupObjNum3 -> Nullable<Integer>,
        TriggerMenuItemGroupObjNum4 -> Nullable<Integer>,
        AwardMenuItemGroupObjNum -> Nullable<Integer>,
        AwardingAlgorithm -> Smallint,
        #[max_length = 32]
        RvcGroupMask -> Varchar,
        AwardAllocation -> Nullable<Integer>,
        ChangeSetObjNum -> Nullable<Integer>,
        SluGroupNum -> Nullable<Integer>,
        RptGrpObjNum -> Nullable<Integer>,
        TrggrCndmntMenuItmGrpObjNum -> Nullable<Integer>,
        MinAmount -> Nullable<Decimal>,
        PrintClassObjNum -> Nullable<Integer>,
        ConstrainType -> Nullable<Smallint>,
        #[max_length = 32]
        OrderTypeIndexes -> Varchar,
    }
}

diesel::table! {
    discount_alloc_detail (DscntAllocDtlID) {
        DscntAllocDtlID -> Bigint,
        CheckDetailID -> Bigint,
        DscntDetailLink -> Integer,
        ItemDetailLink -> Integer,
        SubItem -> Nullable<Smallint>,
        IncludesMITax -> Bit,
        Amount -> Nullable<Decimal>,
        InclusiveTax -> Nullable<Decimal>,
    }
}

diesel::table! {
    discount_award_group (DscntAwardGrpID) {
        DscntAwardGrpID -> Integer,
        DscntID -> Integer,
        HierStrucID -> Bigint,
        MIGroupObjNum -> Nullable<Integer>,
        AwardType -> Nullable<Smallint>,
        Percentage -> Nullable<Decimal>,
        Amount -> Nullable<Decimal>,
        Count -> Nullable<Integer>,
        MaxCount -> Nullable<Integer>,
        OrderNum -> Smallint,
    }
}

diesel::table! {
    discount_detail (DscntDtlID) {
        DscntDtlID -> Bigint,
        CheckDetailID -> Bigint,
        DscntID -> Integer,
        #[max_length = 56]
        OptionBits -> Varchar,
        EmployeeID -> Nullable<Bigint>,
        Percentage -> Nullable<Decimal>,
        #[max_length = 40]
        PrintOptionBits -> Varchar,
        PrivilegeLevel -> Nullable<Integer>,
        #[max_length = 2000]
        TempAllocation -> Nullable<Varchar>,
        TillDetailID -> Nullable<Integer>,
        InclusiveTax -> Nullable<Decimal>,
        #[max_length = 64]
        TaxRates -> Nullable<Varchar>,
        TillSessionID -> Nullable<Integer>,
        CouponTotal -> Nullable<Decimal>,
    }
}

diesel::table! {
    discount_itemizer (DscntItmzrID) {
        DscntItmzrID -> Integer,
        HierStrucID -> Bigint,
        DscntItmzrIndex -> Smallint,
        NameID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    discount_itemizer_discount (DscntItmzrDscntID) {
        DscntItmzrDscntID -> Integer,
        HierStrucID -> Bigint,
        DscntID -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        DscntItmzrIndex -> Nullable<Smallint>,
    }
}

diesel::table! {
    discount_main_menu_level (DscntMainMenuLvlID) {
        DscntMainMenuLvlID -> Integer,
        HierStrucID -> Bigint,
        DscntID -> Integer,
        MenuLvlIndex -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    discount_sub_menu_level (DscntSubMenuLvlID) {
        DscntSubMenuLvlID -> Integer,
        HierStrucID -> Bigint,
        DscntID -> Integer,
        MenuLvlIndex -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    discount_trigger_group (DscntTrgGrpID) {
        DscntTrgGrpID -> Integer,
        DscntID -> Integer,
        HierStrucID -> Bigint,
        MIGroupObjNum -> Nullable<Integer>,
        CndmntMIGroupObjNum -> Nullable<Integer>,
        Quantity -> Nullable<Integer>,
        Total -> Nullable<Decimal>,
        OrderNum -> Smallint,
    }
}

diesel::table! {
    distribution_group (DistributionGroupID) {
        DistributionGroupID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Nullable<Bigint>,
        #[max_length = 8]
        OptionBits -> Varchar,
    }
}

diesel::table! {
    dscnt_itmzr_dscnt_dtl (DscntItmzrDscntDtlID) {
        DscntItmzrDscntDtlID -> Bigint,
        DscntDtlID -> Bigint,
        DscntItmzrID -> Integer,
    }
}

diesel::table! {
    dto_order_method_setting (OrderMethodSettingID) {
        OrderMethodSettingID -> Bigint,
        HierStrucID -> Bigint,
        DTOParamID -> Nullable<Integer>,
        OrderMethod -> Integer,
        NameID -> Bigint,
        #[max_length = 64]
        OptionBits -> Varchar,
        FutureOrderMinDays -> Smallint,
        FutureOrderMaxDays -> Smallint,
        OrderConfirmationType -> Integer,
        UnpickedOrderAlertTime -> Unsigned<Tinyint>,
        DeviceIndex -> Nullable<Smallint>,
        UnassignedAlertTime -> Unsigned<Tinyint>,
        DefaultDeliveryQuoteTime -> Smallint,
        ServiceChargeObjNum -> Nullable<Integer>,
        ObjectNumber -> Nullable<Integer>,
        ConfirmOrderTenderObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    dto_parameter (DTOParamID) {
        DTOParamID -> Integer,
        HierStrucID -> Bigint,
        #[max_length = 64]
        OptionBits -> Varchar,
        DeliveryOrdTypeIndex -> Nullable<Integer>,
        TakeoutOrdTypeIndex -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        CurbsideOrdTypeIndex -> Nullable<Integer>,
    }
}

diesel::table! {
    dto_quoting_rule (QuotingRuleID) {
        QuotingRuleID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        PeriodID -> Integer,
        ChangeSetObjNum -> Nullable<Integer>,
        #[max_length = 8]
        OptionBits -> Varchar,
        QuoteTime -> Integer,
    }
}

diesel::table! {
    effectivity (EffectivityID) {
        EffectivityID -> Bigint,
        HierStrucID -> Bigint,
        StartDateTime -> Nullable<Datetime>,
        EndDateTime -> Nullable<Datetime>,
        ActiveStartTime -> Nullable<Integer>,
        ActiveEndTime -> Nullable<Integer>,
        #[max_length = 7]
        RecurrenceDayOfWeek -> Varchar,
        #[max_length = 100]
        EffectivityComment -> Nullable<Varchar>,
    }
}

diesel::table! {
    employee (EmployeeID) {
        EmployeeID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        LastNameID -> Nullable<Bigint>,
        FirstNameID -> Nullable<Bigint>,
        IdNumber -> Nullable<Bigint>,
        CheckNameID -> Nullable<Bigint>,
        EmplGroup -> Nullable<Integer>,
        EmpLevel -> Nullable<Integer>,
        PcFuncID -> Nullable<Bigint>,
        #[max_length = 25]
        Username -> Nullable<Varchar>,
        PasswordChanged -> Nullable<Datetime>,
        LangID -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        EmployeePostingTime -> Nullable<Datetime>,
        Locked -> Nullable<Bit>,
        NumFailedLogins -> Nullable<Integer>,
        #[max_length = 2000]
        EMCPreferences -> Nullable<Varchar>,
        LocaleInfoID -> Nullable<Integer>,
        #[max_length = 50]
        PIN -> Nullable<Varchar>,
        #[max_length = 50]
        OldPIN -> Nullable<Varchar>,
        #[max_length = 50]
        NewPIN -> Nullable<Varchar>,
        #[max_length = 35]
        PayrollID -> Nullable<Varchar>,
        NewIdNumber -> Nullable<Bigint>,
        OldIdNumber -> Nullable<Bigint>,
        #[max_length = 200]
        FirstName -> Nullable<Varchar>,
        #[max_length = 200]
        LastName -> Nullable<Varchar>,
        #[max_length = 200]
        CheckName -> Nullable<Varchar>,
        FingerPrintTemplate1 -> Nullable<Longblob>,
        FingerPrintTemplate2 -> Nullable<Longblob>,
        FingerPrintTemplate3 -> Nullable<Longblob>,
        TerminationDate -> Nullable<Datetime>,
        #[max_length = 8]
        EmployeeOptionBits -> Varchar,
        FingerPrintNewTemplate1 -> Nullable<Longblob>,
        FingerPrintNewTemplate2 -> Nullable<Longblob>,
        FingerPrintNewTemplate3 -> Nullable<Longblob>,
        EmailAddress -> Nullable<Longblob>,
        EncryptionKeyID -> Nullable<Bigint>,
        EngageLangId -> Nullable<Integer>,
        AvailableForDelivery -> Bit,
        #[max_length = 36]
        OPUserID -> Nullable<Varchar>,
        LastUpdateDateTime -> Nullable<Datetime>,
        empLevelUpdateDateTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    employee_class (EmpClassID) {
        EmpClassID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        #[max_length = 160]
        TransactionOptionBits -> Varchar,
        #[max_length = 8]
        IslOptionBits -> Varchar,
        #[max_length = 64]
        SupervisorOptionBits -> Varchar,
        #[max_length = 24]
        TimeclockOptionBits -> Varchar,
        RmcAccLvlID -> Nullable<Integer>,
        RwAccLvlID -> Nullable<Integer>,
        DayMinutesOvertime -> Nullable<Integer>,
        PeriodMinutesOvertime -> Nullable<Integer>,
        PickupTransferStyle -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        LastPostingTime -> Nullable<Datetime>,
        CMAccountingMethodID -> Nullable<Integer>,
        ServerBankingTemplateObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    employee_class_operator (EmployeeClassOperatorID) {
        EmployeeClassOperatorID -> Integer,
        EmpClassID -> Integer,
        HierStrucID -> Bigint,
        #[max_length = 32]
        OptionBits -> Varchar,
    }
}

diesel::table! {
    employee_class_touchscreen (EmpClassTouchscrnID) {
        EmpClassTouchscrnID -> Integer,
        HierStrucID -> Bigint,
        EmpClassID -> Integer,
        DeviceType -> Integer,
        DfltTouchscreen -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    employee_instance (EmployeeInstanceID) {
        EmployeeInstanceID -> Bigint,
        HierStrucID -> Bigint,
        EmployeeID -> Bigint,
        EmpClassID -> Nullable<Integer>,
        RevCtrID -> Nullable<Integer>,
        #[max_length = 16]
        OptionBits -> Varchar,
        Training -> Bit,
        LdsID -> Nullable<Integer>,
        #[max_length = 35]
        PayrollID -> Nullable<Varchar>,
        LateGrace -> Nullable<Integer>,
        #[max_length = 8]
        Status -> Varchar,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        BankDeclared -> Nullable<Bit>,
        #[max_length = 16]
        MyLaborPrivilegeBits -> Varchar,
        WsID -> Nullable<Integer>,
        ShiftNumber -> Nullable<Integer>,
        AuthorizeClockInsPriv -> Nullable<Integer>,
        PerformClockInPriv -> Nullable<Integer>,
    }
}

diesel::table! {
    enabled_by_order_channel (EnabledByOrderChannelId) {
        EnabledByOrderChannelId -> Integer,
        DbTableId -> Integer,
        DefId -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
    }
}

diesel::table! {
    event_schedule (ScheduleID) {
        ScheduleID -> Integer,
        #[max_length = 40]
        Guid -> Nullable<Varchar>,
        HierStrucID -> Bigint,
        ServiceID -> Nullable<Integer>,
        ServiceType -> Smallint,
        #[max_length = 128]
        EventName -> Varchar,
        EventData -> Nullable<Longtext>,
        ChainScheduleFromScheduleID -> Nullable<Integer>,
        event_duration_seconds -> Nullable<Integer>,
        freq_type -> Integer,
        freq_interval -> Integer,
        freq_subday_type -> Nullable<Integer>,
        freq_subday_interval -> Nullable<Integer>,
        freq_relative_interval -> Nullable<Integer>,
        freq_recurrence_factor -> Nullable<Integer>,
        active_start_date -> Nullable<Integer>,
        active_end_date -> Nullable<Integer>,
        active_start_time -> Nullable<Integer>,
        active_end_time -> Nullable<Integer>,
        next_run_date -> Nullable<Integer>,
        next_run_time -> Nullable<Integer>,
        Enabled -> Integer,
        TZIndex -> Nullable<Integer>,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Nullable<Bigint>,
    }
}

diesel::table! {
    event_schedule_instance (ScheduleInstanceID) {
        ScheduleInstanceID -> Integer,
        #[max_length = 40]
        Guid -> Nullable<Varchar>,
        HierStrucID -> Bigint,
        ScheduleID -> Integer,
        ServiceID -> Nullable<Integer>,
        ServiceType -> Smallint,
        #[max_length = 128]
        EventName -> Varchar,
        EventData -> Nullable<Longtext>,
        RunStatus -> Integer,
        StartDateTime -> Datetime,
        EndDateTime -> Datetime,
    }
}

diesel::table! {
    extension_application (ExtensionApplicationID) {
        ExtensionApplicationID -> Bigint,
        HierStrucID -> Nullable<Bigint>,
        #[max_length = 200]
        Name -> Nullable<Varchar>,
        DescriptionID -> Nullable<Bigint>,
        ExtensionApplicationType -> Integer,
        InterfaceID -> Nullable<Integer>,
        #[max_length = 64]
        OptionBits -> Varchar,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        DataLevel -> Integer,
        MaxChars -> Integer,
        MaxItems -> Integer,
    }
}

diesel::table! {
    extension_application_content (ExtensionApplicationContentID) {
        ExtensionApplicationContentID -> Bigint,
        HierStrucID -> Nullable<Bigint>,
        #[max_length = 64]
        OptionBits -> Varchar,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        ContentDataID -> Nullable<Bigint>,
        ExtensionApplicationID -> Bigint,
        DescriptionID -> Nullable<Bigint>,
        #[max_length = 200]
        ZoneableKey -> Varchar,
        #[max_length = 100]
        MinimumCompatibility -> Nullable<Varchar>,
        #[max_length = 100]
        MaximumCompatibility -> Nullable<Varchar>,
        HostType -> Nullable<Smallint>,
    }
}

diesel::table! {
    extension_data_property (ExtensionDataPropertyID) {
        ExtensionDataPropertyID -> Bigint,
        #[max_length = 1024]
        Name -> Varchar,
        DbTableID -> Integer,
        ValueType -> Nullable<Integer>,
        ValueLimits -> Nullable<Longtext>,
        SortPriority -> Nullable<Integer>,
        DisplayWidth -> Nullable<Integer>,
        DisplayNameID -> Nullable<Bigint>,
        IsEditable -> Bit,
        IsViewable -> Bit,
        CommentID -> Nullable<Bigint>,
        IsDownloadable -> Bit,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        #[max_length = 25]
        APPLICATIONTYPE -> Nullable<Varchar>,
    }
}

diesel::table! {
    extension_data_value (ExtensionDataValueID) {
        ExtensionDataValueID -> Bigint,
        DataElementID -> Bigint,
        XMLProperties -> Nullable<Longtext>,
        ExtensionDataPropertyID -> Bigint,
        HierStrucID -> Bigint,
        LANGID -> Integer,
    }
}

diesel::table! {
    family_group (FamGrpID) {
        FamGrpID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        MajGrpID -> Nullable<Integer>,
        ReportGroup -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        FamilyGroupPostingTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    fcr_customer_data (FCRCustomerDataID) {
        #[max_length = 20]
        CustomerID -> Nullable<Varchar>,
        #[max_length = 5]
        CustomerType -> Nullable<Varchar>,
        #[max_length = 100]
        CustInfo1 -> Nullable<Varchar>,
        #[max_length = 100]
        CustInfo2 -> Nullable<Varchar>,
        #[max_length = 100]
        CustInfo3 -> Nullable<Varchar>,
        #[max_length = 100]
        CustInfo4 -> Nullable<Varchar>,
        #[max_length = 100]
        CustInfo5 -> Nullable<Varchar>,
        #[max_length = 100]
        CustInfo6 -> Nullable<Varchar>,
        #[max_length = 100]
        CustInfo7 -> Nullable<Varchar>,
        #[max_length = 100]
        CustInfo8 -> Nullable<Varchar>,
        PropertyID -> Integer,
        #[max_length = 100]
        CustInfo9 -> Nullable<Varchar>,
        #[max_length = 100]
        CustInfo10 -> Nullable<Varchar>,
        #[max_length = 100]
        CustInfo11 -> Nullable<Varchar>,
        #[max_length = 100]
        CustInfo12 -> Nullable<Varchar>,
        PurgeStatus -> Unsigned<Tinyint>,
        HierStrucID -> Nullable<Bigint>,
        #[max_length = 40]
        Guid -> Nullable<Varchar>,
        ReplicationDest -> Unsigned<Tinyint>,
        ReplicationStatus -> Unsigned<Tinyint>,
        #[max_length = 100]
        ReplicationError -> Nullable<Varchar>,
        CPPurgeDate -> Nullable<Datetime>,
        RepPurgeDate -> Nullable<Datetime>,
        UpdateTime -> Nullable<Datetime>,
        #[max_length = 100]
        CustInfo13 -> Nullable<Varchar>,
        #[max_length = 100]
        CustInfo14 -> Nullable<Varchar>,
        FCRCustomerDataID -> Bigint,
        FCRJSONEXP -> Nullable<Longtext>,
    }
}

diesel::table! {
    fcr_invoice_control (FCRInvoiceControlID) {
        PCWSID -> Nullable<Integer>,
        InvoiceType -> Nullable<Unsigned<Tinyint>>,
        #[max_length = 3]
        Series -> Nullable<Varchar>,
        StartInvNum -> Nullable<Bigint>,
        EndInvNum -> Nullable<Bigint>,
        Status -> Nullable<Unsigned<Tinyint>>,
        CurrInvNum -> Nullable<Bigint>,
        LockedBy -> Nullable<Smallint>,
        ResolutionDate -> Nullable<Datetime>,
        #[max_length = 100]
        ExtraField1 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField2 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField3 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField4 -> Nullable<Varchar>,
        PropertyID -> Integer,
        #[max_length = 100]
        ExtraField5 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField6 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField7 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField8 -> Nullable<Varchar>,
        PurgeStatus -> Unsigned<Tinyint>,
        HierStrucID -> Nullable<Bigint>,
        RevenueCenterID -> Nullable<Integer>,
        #[max_length = 40]
        Guid -> Nullable<Varchar>,
        ReplicationDest -> Unsigned<Tinyint>,
        ReplicationStatus -> Unsigned<Tinyint>,
        #[max_length = 100]
        ReplicationError -> Nullable<Varchar>,
        CPPurgeDate -> Nullable<Datetime>,
        RepPurgeDate -> Nullable<Datetime>,
        UpdateTime -> Nullable<Datetime>,
        #[max_length = 100]
        ExtraField9 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField10 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField11 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField12 -> Nullable<Varchar>,
        microsBsnzDate -> Nullable<Datetime>,
        CtrlID -> Bigint,
        FCRInvoiceControlID -> Bigint,
        FCRJSONEXP -> Nullable<Longtext>,
    }
}

diesel::table! {
    fcr_invoice_data (FCRInvoiceDataID) {
        PCWSID -> Nullable<Integer>,
        #[max_length = 50]
        FCRInvNumber -> Nullable<Varchar>,
        MicrosChkNum -> Nullable<Bigint>,
        InvoiceType -> Nullable<Unsigned<Tinyint>>,
        InSARMode -> Unsigned<Tinyint>,
        #[max_length = 20]
        CustomerID -> Nullable<Varchar>,
        InvoiceStatus -> Nullable<Unsigned<Tinyint>>,
        MicrosBsnzDate -> Nullable<Datetime>,
        FCRBsnzDate -> Nullable<Datetime>,
        Subtotal1 -> Nullable<Decimal>,
        Subtotal2 -> Nullable<Decimal>,
        Subtotal3 -> Nullable<Decimal>,
        Subtotal4 -> Nullable<Decimal>,
        Subtotal5 -> Nullable<Decimal>,
        Subtotal6 -> Nullable<Decimal>,
        Subtotal7 -> Nullable<Decimal>,
        Subtotal8 -> Nullable<Decimal>,
        Subtotal9 -> Nullable<Decimal>,
        Subtotal10 -> Nullable<Decimal>,
        Subtotal11 -> Nullable<Decimal>,
        Subtotal12 -> Nullable<Decimal>,
        TaxTtl1 -> Nullable<Decimal>,
        TaxTtl2 -> Nullable<Decimal>,
        TaxTtl3 -> Nullable<Decimal>,
        TaxTtl4 -> Nullable<Decimal>,
        TaxTtl5 -> Nullable<Decimal>,
        TaxTtl6 -> Nullable<Decimal>,
        TaxTtl7 -> Nullable<Decimal>,
        TaxTtl8 -> Nullable<Decimal>,
        #[max_length = 100]
        ExtraField1 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField2 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField3 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField4 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField5 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField6 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField7 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField8 -> Nullable<Varchar>,
        PropertyID -> Integer,
        FCRID -> Nullable<Integer>,
        StoreID -> Nullable<Integer>,
        #[max_length = 50]
        SerialID -> Nullable<Varchar>,
        #[max_length = 10]
        DocumentType -> Nullable<Varchar>,
        #[max_length = 10]
        DataType -> Nullable<Varchar>,
        SysDocID -> Nullable<Decimal>,
        #[max_length = 100]
        FiscalRef -> Nullable<Varchar>,
        Subtotal13 -> Nullable<Decimal>,
        Subtotal14 -> Nullable<Decimal>,
        #[max_length = 100]
        ExtraField9 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField10 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField11 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField12 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField13 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField14 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField15 -> Nullable<Varchar>,
        #[max_length = 100]
        ExtraField16 -> Nullable<Varchar>,
        ExtraDate1 -> Nullable<Datetime>,
        ExtraDate2 -> Nullable<Datetime>,
        ExtraDate3 -> Nullable<Datetime>,
        ExtraDate4 -> Nullable<Datetime>,
        ExtraDate5 -> Nullable<Datetime>,
        PurgeStatus -> Unsigned<Tinyint>,
        HierStrucID -> Nullable<Bigint>,
        RevenueCenterID -> Nullable<Integer>,
        #[max_length = 40]
        Guid -> Nullable<Varchar>,
        ReplicationDest -> Unsigned<Tinyint>,
        ReplicationStatus -> Unsigned<Tinyint>,
        #[max_length = 100]
        ReplicationError -> Nullable<Varchar>,
        CPPurgeDate -> Nullable<Datetime>,
        RepPurgeDate -> Nullable<Datetime>,
        UpdateTime -> Nullable<Datetime>,
        TaxTtl9 -> Nullable<Decimal>,
        TaxTtl10 -> Nullable<Decimal>,
        TaxTtl11 -> Nullable<Decimal>,
        TaxTtl12 -> Nullable<Decimal>,
        TaxTtl13 -> Nullable<Decimal>,
        TaxTtl14 -> Nullable<Decimal>,
        TaxTtl15 -> Nullable<Decimal>,
        TaxTtl16 -> Nullable<Decimal>,
        #[max_length = 40]
        CheckGuid -> Nullable<Varchar>,
        FCRInvoiceDataID -> Bigint,
        FCRJSONEXP -> Nullable<Longtext>,
    }
}

diesel::table! {
    fcr_ttl_data (FCRTotalDataID) {
        FCRBsnzDate -> Nullable<Datetime>,
        #[max_length = 50]
        FCRID1 -> Nullable<Varchar>,
        #[max_length = 50]
        FCRID2 -> Nullable<Varchar>,
        MicrosBsnzDate -> Nullable<Datetime>,
        #[max_length = 100]
        FCRInfo1 -> Nullable<Varchar>,
        #[max_length = 100]
        FCRInfo2 -> Nullable<Varchar>,
        #[max_length = 100]
        FCRInfo3 -> Nullable<Varchar>,
        #[max_length = 100]
        FCRInfo4 -> Nullable<Varchar>,
        #[max_length = 100]
        FCRInfo5 -> Nullable<Varchar>,
        #[max_length = 100]
        FCRInfo6 -> Nullable<Varchar>,
        #[max_length = 100]
        FCRInfo7 -> Nullable<Varchar>,
        #[max_length = 100]
        FCRInfo8 -> Nullable<Varchar>,
        #[max_length = 100]
        FCRInfo9 -> Nullable<Varchar>,
        #[max_length = 100]
        FCRInfo10 -> Nullable<Varchar>,
        #[max_length = 100]
        FCRInfo11 -> Nullable<Varchar>,
        #[max_length = 100]
        FCRInfo12 -> Nullable<Varchar>,
        PropertyID -> Integer,
        #[max_length = 100]
        FCRInfo13 -> Nullable<Varchar>,
        #[max_length = 100]
        FCRInfo14 -> Nullable<Varchar>,
        #[max_length = 100]
        FCRInfo15 -> Nullable<Varchar>,
        #[max_length = 100]
        FCRInfo16 -> Nullable<Varchar>,
        PurgeStatus -> Unsigned<Tinyint>,
        PCWSID -> Nullable<Integer>,
        HierStrucID -> Nullable<Bigint>,
        RevenueCenterID -> Nullable<Integer>,
        #[max_length = 40]
        Guid -> Nullable<Varchar>,
        ReplicationDest -> Unsigned<Tinyint>,
        ReplicationStatus -> Unsigned<Tinyint>,
        #[max_length = 100]
        ReplicationError -> Nullable<Varchar>,
        CPPurgeDate -> Nullable<Datetime>,
        RepPurgeDate -> Nullable<Datetime>,
        UpdateTime -> Nullable<Datetime>,
        FCRTotalDataID -> Bigint,
        FCRJSONEXP -> Nullable<Longtext>,
    }
}

diesel::table! {
    financial_calendar (FinCalendarID) {
        FinCalendarID -> Integer,
        HierStrucID -> Bigint,
        EntryType -> Integer,
        EntryValue -> Integer,
        AseqID -> Nullable<Integer>,
        PcAseqID -> Nullable<Integer>,
        aseq_sched_id -> Nullable<Integer>,
    }
}

diesel::table! {
    financial_calendar_hist (FinCalendarHistID) {
        FinCalendarHistID -> Integer,
        HierStrucID -> Bigint,
        EndDate -> Datetime,
        EntryType -> Integer,
        EntryValue -> Integer,
    }
}

diesel::table! {
    financial_calendar_hist_off (FinCalendarHistID) {
        FinCalendarHistID -> Integer,
        HierStrucID -> Bigint,
        EndDate -> Datetime,
        EntryType -> Integer,
        EntryValue -> Bigint,
    }
}

diesel::table! {
    format_parameter (FmtParamID) {
        FmtParamID -> Integer,
        HierStrucID -> Bigint,
        LineFeedsBeforeOrder -> Nullable<Integer>,
        LinesFirst -> Nullable<Integer>,
        LineFeedsBeforeFirst -> Nullable<Bigint>,
        LinesOther -> Nullable<Integer>,
        LineFeedsBeforeOther -> Nullable<Integer>,
        MinimumLines -> Nullable<Integer>,
        InformationLines -> Nullable<Integer>,
        #[max_length = 80]
        OptionBits -> Varchar,
        ScreenSort -> Nullable<Integer>,
        ReceiptSort -> Nullable<Integer>,
        CheckSort -> Nullable<Integer>,
        HelpSort -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        InvoiceThreshold -> Nullable<Integer>,
        CustInfoThreshold -> Nullable<Integer>,
        LabelID -> Nullable<Bigint>,
        #[max_length = 16]
        CFDOptionBits -> Varchar,
        #[max_length = 200]
        CFDContentImage -> Nullable<Varchar>,
        #[max_length = 200]
        CFDContentImage2 -> Nullable<Varchar>,
    }
}

diesel::table! {
    giftcard_provider (GiftCardProviderID) {
        GiftCardProviderID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        #[max_length = 15]
        ProviderReference -> Nullable<Varchar>,
        ActivateType -> Nullable<Smallint>,
        ActivateObjNum -> Nullable<Integer>,
        IssueType -> Nullable<Smallint>,
        IssueObjNum -> Nullable<Integer>,
        ReloadType -> Nullable<Smallint>,
        ReloadObjNum -> Nullable<Integer>,
        RedeemType -> Nullable<Smallint>,
        RedeemObjNum -> Nullable<Integer>,
        CashOutType -> Nullable<Smallint>,
        CashOutObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    global_parameter (ParamCode) {
        #[max_length = 64]
        ParamCode -> Varchar,
        #[max_length = 1]
        ParamType -> Varchar,
        IntVal -> Nullable<Bigint>,
        NumberVal -> Nullable<Decimal>,
        DateVal -> Nullable<Datetime>,
        #[max_length = 256]
        StringVal -> Nullable<Varchar>,
        #[max_length = 128]
        UnicodeStrVal -> Nullable<Varchar>,
    }
}

diesel::table! {
    gms_acceptance_limit (AcceptanceLimitID) {
        AcceptanceLimitID -> Bigint,
        ReservationPeriodID -> Bigint,
        HierStrucID -> Bigint,
        TimeBegin -> Nullable<Smallint>,
        TimeEnd -> Nullable<Smallint>,
        RepeatCycle -> Nullable<Smallint>,
        MaxAcceptance -> Nullable<Smallint>,
    }
}

diesel::table! {
    gms_check_alert (CheckAlertID) {
        CheckAlertID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        AlertTime -> Nullable<Smallint>,
        AlertColor -> Nullable<Integer>,
    }
}

diesel::table! {
    gms_occupancy_limit (OccupancyLimitID) {
        OccupancyLimitID -> Bigint,
        ReservationPeriodID -> Bigint,
        HierStrucID -> Bigint,
        TimeBegin -> Nullable<Smallint>,
        TimeEnd -> Nullable<Smallint>,
        MaxOccupancy -> Nullable<Smallint>,
    }
}

diesel::table! {
    gms_parameter (GMSParamID) {
        GMSParamID -> Bigint,
        HierStrucID -> Bigint,
        IsEnabled -> Bit,
        #[max_length = 255]
        TableSelectImageName -> Nullable<Varchar>,
        #[max_length = 255]
        TableDirtyImageName -> Nullable<Varchar>,
        #[max_length = 255]
        TableSeatedImageName -> Nullable<Varchar>,
        #[max_length = 255]
        TableOccupiedImageName -> Nullable<Varchar>,
        #[max_length = 255]
        TablePrintedImageName -> Nullable<Varchar>,
        #[max_length = 255]
        TablePaidImageName -> Nullable<Varchar>,
        #[max_length = 255]
        TableParentImageName -> Nullable<Varchar>,
        #[max_length = 255]
        TableChildImageName -> Nullable<Varchar>,
        #[max_length = 255]
        TableClosedImageName -> Nullable<Varchar>,
        #[max_length = 255]
        TableReservedImageName -> Nullable<Varchar>,
        #[max_length = 255]
        TableUserSuggestedImageName -> Nullable<Varchar>,
        #[max_length = 255]
        TableSysSuggestedImageName -> Nullable<Varchar>,
        #[max_length = 255]
        HostAreaImageName -> Nullable<Varchar>,
        #[max_length = 255]
        LoyaltyModuleID -> Nullable<Varchar>,
        #[max_length = 64]
        OptionBits -> Varchar,
        AutoAbandonWaitlistDelay -> Nullable<Smallint>,
        ReservationToWaitlistDelay -> Nullable<Smallint>,
        MaxConfirmationNumber -> Nullable<Bigint>,
        MinConfirmationNumber -> Nullable<Bigint>,
        MaxReservationNotice -> Nullable<Smallint>,
        MinReservationNotice -> Nullable<Smallint>,
        #[max_length = 255]
        HighLightedTableImageName -> Nullable<Varchar>,
        PerMinWaitingPastQuoteWgt -> Nullable<Smallint>,
        WaitQuoteInterval -> Nullable<Integer>,
        AutoResetPaidStatus -> Nullable<Smallint>,
        ServerUnavailableMinutes -> Nullable<Smallint>,
    }
}

diesel::table! {
    gms_reason (GMSReasonDescID) {
        GMSReasonDescID -> Integer,
        HierStrucID -> Bigint,
        GMSReasonIndex -> Smallint,
        NameID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        LastPostingTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    gms_reservation_period (ReservationPeriodID) {
        ReservationPeriodID -> Bigint,
        HierStrucID -> Bigint,
        EffectivityID -> Nullable<Bigint>,
        ObjectNumber -> Integer,
        NameID -> Bigint,
    }
}

diesel::table! {
    gms_seating_limit (SeatingLimitID) {
        SeatingLimitID -> Bigint,
        ReservationPeriodID -> Bigint,
        HierStrucID -> Bigint,
        TimeBegin -> Nullable<Smallint>,
        TimeEnd -> Nullable<Smallint>,
        Capacity -> Nullable<Smallint>,
        Quantity -> Nullable<Smallint>,
    }
}

diesel::table! {
    gms_section (SectionID) {
        SectionID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        SectionColor -> Nullable<Integer>,
    }
}

diesel::table! {
    gms_section_layout (LayoutID) {
        LayoutID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Nullable<Bigint>,
        LastAccessedDate -> Nullable<Datetime>,
        #[max_length = 40]
        RecordGuid -> Nullable<Varchar>,
        #[max_length = 40]
        Name -> Nullable<Varchar>,
    }
}

diesel::table! {
    gms_section_layout_tbl (ID) {
        ID -> Bigint,
        HierStrucID -> Bigint,
        LayoutID -> Nullable<Bigint>,
        DiningTableID -> Integer,
        SectionID -> Bigint,
        EmployeeID -> Nullable<Bigint>,
        #[max_length = 40]
        RecordGuid -> Nullable<Varchar>,
        #[max_length = 40]
        LayoutRecordGuid -> Nullable<Varchar>,
    }
}

diesel::table! {
    gms_section_template (TemplateID) {
        TemplateID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        LastAccessedDate -> Nullable<Datetime>,
    }
}

diesel::table! {
    gms_section_template_tbl (ID) {
        ID -> Bigint,
        HierStrucID -> Bigint,
        TemplateID -> Bigint,
        DiningTableID -> Integer,
        SectionID -> Bigint,
    }
}

diesel::table! {
    gms_service_alert (ServiceAlertID) {
        ServiceAlertID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        AlertTime -> Nullable<Smallint>,
        AlertColor -> Nullable<Integer>,
    }
}

diesel::table! {
    gms_suggestion_factor (GMSSuggestionFactorID) {
        GMSSuggestionFactorID -> Bigint,
        HierStrucID -> Bigint,
        SuggestionFactor -> Nullable<Integer>,
        Rank -> Nullable<Integer>,
        Weight -> Nullable<Integer>,
    }
}

diesel::table! {
    gms_target_turn_time (TargetTurnTimeID) {
        TargetTurnTimeID -> Bigint,
        ReservationPeriodID -> Bigint,
        HierStrucID -> Bigint,
        TimeBegin -> Nullable<Smallint>,
        TimeEnd -> Nullable<Smallint>,
        CoverCnt -> Nullable<Smallint>,
        Minutes -> Nullable<Smallint>,
    }
}

diesel::table! {
    gms_tbl_mergeable_assign (MergeableAssignID) {
        MergeableAssignID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        DiningTableID -> Integer,
        MergeableTableObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    gms_tbl_pref_assign (PreferenceAssignID) {
        PreferenceAssignID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        DiningTableID -> Integer,
        PreferenceAttrDefID -> Nullable<Bigint>,
        PreferenceAttrObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    gms_tbl_pref_attr_def (PreferenceAttrDefID) {
        PreferenceAttrDefID -> Bigint,
        HierStrucID -> Bigint,
        PreferenceCatDefID -> Nullable<Bigint>,
        NameID -> Bigint,
        CodeID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        IsExclusive -> Bit,
    }
}

diesel::table! {
    gms_tbl_pref_cat_def (PreferenceCatDefID) {
        PreferenceCatDefID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        IsExclusive -> Bit,
    }
}

diesel::table! {
    gms_tbl_pref_request (PreferenceRequestID) {
        PreferenceRequestID -> Bigint,
        TblRequestDtlID -> Bigint,
        PreferenceAttrID -> Nullable<Bigint>,
        HierStrucID -> Bigint,
        PreferenceAttrObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    gms_tbl_request_detail (TblRequestDtlID) {
        TblRequestDtlID -> Bigint,
        CreationDate -> Nullable<Datetime>,
        EmployeeID -> Nullable<Bigint>,
        RevCtrID -> Nullable<Integer>,
        ReservationCovCnt -> Nullable<Smallint>,
        IsPendingApproval -> Nullable<Bit>,
        ApprovedBy -> Nullable<Bigint>,
        ApprovedDate -> Nullable<Datetime>,
        ReservationDate -> Nullable<Datetime>,
        CancelDate -> Nullable<Datetime>,
        NoShowDate -> Nullable<Datetime>,
        GreetedDate -> Nullable<Datetime>,
        CoverCnt -> Nullable<Smallint>,
        #[max_length = 40]
        GuestName -> Varchar,
        #[max_length = 30]
        PhoneNumber -> Nullable<Varchar>,
        IsVip -> Nullable<Bit>,
        WaitQuote -> Nullable<Smallint>,
        PagerNumber -> Nullable<Smallint>,
        PageTime -> Nullable<Smallint>,
        AbandonTime -> Nullable<Smallint>,
        SeatedTime -> Nullable<Smallint>,
        CheckID -> Nullable<Bigint>,
        #[max_length = 254]
        TextDetail -> Nullable<Varchar>,
        EstimatedWait -> Nullable<Smallint>,
        DiningTableID -> Nullable<Integer>,
        ConfirmationNumber -> Nullable<Bigint>,
        #[max_length = 254]
        ReferralNotes -> Nullable<Varchar>,
        #[max_length = 1]
        RequestMethod -> Nullable<Varchar>,
        #[max_length = 20]
        RequestMethodRef -> Nullable<Varchar>,
        LockTime -> Nullable<Datetime>,
        UserTblSuggest -> Nullable<Bit>,
        SuggestPosition -> Nullable<Smallint>,
        #[max_length = 40]
        CheckGuid -> Nullable<Varchar>,
        #[max_length = 40]
        RecordGuid -> Nullable<Varchar>,
        CRMRecordID -> Nullable<Bigint>,
        #[max_length = 64]
        CRMAccountNumber -> Nullable<Varchar>,
        GMSReasonDescID -> Nullable<Integer>,
        CardEntryType -> Integer,
        #[max_length = 320]
        EmailAddress -> Nullable<Varchar>,
        LastEmployeeID -> Nullable<Bigint>,
        LastModifiedDate -> Nullable<Datetime>,
        CancelEmployeeID -> Nullable<Bigint>,
        AbandonEmployeeID -> Nullable<Bigint>,
        NoShowEmployeeID -> Nullable<Bigint>,
        GreetedEmployeeID -> Nullable<Bigint>,
        SeatedEmployeeID -> Nullable<Bigint>,
        ActualTurnTime -> Nullable<Smallint>,
        PageEmployeeID -> Nullable<Bigint>,
        SectionID -> Nullable<Bigint>,
        LastSuggestedDiningTableID -> Nullable<Integer>,
        HierStrucID -> Nullable<Bigint>,
        RevisionNumber -> Nullable<Integer>,
    }
}

diesel::table! {
    gms_wait_quote_time (WaitQuoteInvervalId) {
        WaitQuoteInvervalId -> Bigint,
        HierStrucID -> Bigint,
        WaitQuoteInterval -> Nullable<Smallint>,
        ObjectNumber -> Integer,
        NameId -> Bigint,
    }
}

diesel::table! {
    group_event_area (GroupEventAreaID) {
        GroupEventAreaID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    group_event_def (GroupEventDefID) {
        GroupEventDefID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        #[max_length = 32]
        EventCode -> Varchar,
        GroupEventTypeID -> Nullable<Bigint>,
        GroupEventSubTypeID -> Nullable<Bigint>,
        StartDateTime -> Nullable<Datetime>,
        StartAutoTrigger -> Bit,
        EndDateTime -> Nullable<Datetime>,
        EndAutoTrigger -> Bit,
        NextGroupEventDefID -> Nullable<Bigint>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        Attendance -> Nullable<Bigint>,
        PrevGroupEventDefID -> Nullable<Bigint>,
        CancelDateTime -> Nullable<Datetime>,
        #[max_length = 8]
        ExternalEventID -> Nullable<Varchar>,
    }
}

diesel::table! {
    group_event_def_dtl (GroupEventDefDtlID) {
        GroupEventDefDtlID -> Bigint,
        HierStrucID -> Bigint,
        GroupEventDefID -> Nullable<Bigint>,
        RevCtrID -> Nullable<Integer>,
        GroupEventAreaID -> Nullable<Bigint>,
    }
}

diesel::table! {
    group_event_status (GroupEventStatusID) {
        GroupEventStatusID -> Bigint,
        GroupEventDefID -> Bigint,
        Status -> Integer,
        ActualStartDateTime -> Nullable<Datetime>,
        ActualEndDateTime -> Nullable<Datetime>,
        LastChangeDateTime -> Nullable<Datetime>,
        LastChangeEmployeeID -> Nullable<Bigint>,
        LastChangeRevCtrID -> Nullable<Integer>,
        HierStrucID -> Bigint,
    }
}

diesel::table! {
    group_event_sub_type (GroupEventSubTypeID) {
        GroupEventSubTypeID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        GroupEventTypeID -> Nullable<Bigint>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    group_event_type (GroupEventTypeID) {
        GroupEventTypeID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        MenuLvlIndex -> Nullable<Integer>,
        SubMenuLvlIndex -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    guest_information_detail (GuestInfoDtlID) {
        GuestInfoDtlID -> Bigint,
        CheckDetailID -> Bigint,
        GuestInfoID -> Bigint,
    }
}

diesel::table! {
    help_screen (HlpScrnID) {
        HlpScrnID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Nullable<Bigint>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        ScreenType -> Nullable<Smallint>,
        #[max_length = 256]
        Address -> Nullable<Varchar>,
        HtmlID -> Nullable<Bigint>,
    }
}

diesel::table! {
    hierarchy (HierID) {
        HierID -> Integer,
        NameID -> Bigint,
        HierType -> Integer,
    }
}

diesel::table! {
    hierarchy_parameter (HierParamID) {
        HierParamID -> Integer,
        HierStrucID -> Bigint,
        #[max_length = 128]
        OptionBits -> Varchar,
        #[max_length = 16]
        HhtOptionBits -> Varchar,
        TableCount -> Nullable<Integer>,
        TrkGrpID -> Nullable<Integer>,
        OrdTypeID -> Nullable<Integer>,
        LdsNluGrp -> Nullable<Integer>,
        ServingPeriodID -> Nullable<Integer>,
        EncryptionKeyID -> Nullable<Integer>,
        AseqEmployeeID -> Nullable<Bigint>,
        AseqPcPrtIndex -> Nullable<Smallint>,
        #[max_length = 50]
        AseqUserName -> Nullable<Varchar>,
        AseqPassword -> Nullable<Longblob>,
        MaxIdleTime -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        EncryptionKeySig -> Nullable<Longblob>,
        SIMServiceID -> Nullable<Integer>,
        OCServiceID -> Nullable<Integer>,
        DiscountCalcTimeLimit -> Nullable<Integer>,
        DiscountAutoSLUGraceLimit -> Nullable<Integer>,
        CheckDetailWatermarkID -> Nullable<Integer>,
        #[max_length = 256]
        MyMicrosURL -> Nullable<Varchar>,
        DefaultTierScale -> Smallint,
        NumBCEditsPerChk -> Nullable<Integer>,
        NumBCEditsPerDay -> Nullable<Integer>,
        NumChkRcptToPrnt -> Nullable<Unsigned<Tinyint>>,
        DefaultMasterGroupID -> Nullable<Bigint>,
        MainMenuLvlIndex -> Nullable<Integer>,
        SubMenuLvlIndex -> Nullable<Integer>,
        BarcodeNluIndex -> Nullable<Integer>,
        OrdTypeIndex -> Nullable<Integer>,
        DiningTableStatusDefSetNum -> Nullable<Integer>,
        #[max_length = 256]
        MyLaborURL -> Nullable<Varchar>,
        #[max_length = 50]
        MyLaborUser -> Nullable<Varchar>,
        #[max_length = 50]
        MyLaborPass -> Nullable<Varchar>,
        MyLaborUpdateInterval -> Nullable<Integer>,
        MyLaborPlaybackInterval -> Nullable<Integer>,
        InactiveOpenOrderThreshold -> Nullable<Smallint>,
        PurgeOrderThreshold -> Nullable<Smallint>,
        #[max_length = 256]
        MyLaborURL_ext -> Nullable<Varchar>,
        DepositMenuItemObjNum -> Nullable<Integer>,
        EmailConfiguration -> Nullable<Longtext>,
        #[max_length = 256]
        EngageURL -> Nullable<Varchar>,
        #[max_length = 12]
        EngageOrgCode -> Nullable<Varchar>,
        PopupCondOrderPageObjNum -> Nullable<Integer>,
        PopupCondEditPageObjNum -> Nullable<Integer>,
        IEMaxBadRecords -> Nullable<Bigint>,
        IEDaysBeforePurge -> Nullable<Bigint>,
        #[max_length = 50]
        IEDateFormatString -> Nullable<Varchar>,
        #[max_length = 256]
        PropertyMyLaborURL -> Nullable<Varchar>,
        MyLaborPasEnc -> Nullable<Longblob>,
        AutoServingPeriod -> Unsigned<Tinyint>,
        AMTTHRESHOLD -> Nullable<Decimal>,
        FiscalLocation -> Nullable<Smallint>,
        #[max_length = 256]
        OPPConfigURL -> Nullable<Varchar>,
        OrdChannelObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    hierarchy_structure (HierStrucID) {
        HierStrucID -> Bigint,
        HierID -> Integer,
        HierUnitID -> Integer,
        ParentHierStrucID -> Nullable<Bigint>,
        CHANGETIME -> Nullable<Datetime>,
        #[max_length = 16]
        HierOptionBits -> Varchar,
        ZoneType -> Nullable<Integer>,
        OrganizationID -> Nullable<Integer>,
    }
}

diesel::table! {
    hierarchy_unit (HierUnitID) {
        HierUnitID -> Integer,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        RevCtrID -> Nullable<Integer>,
        PropertyID -> Nullable<Integer>,
        ChangeTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    interface (InterfaceID) {
        InterfaceID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        PosPcID -> Nullable<Integer>,
        BackupPosPcID -> Nullable<Integer>,
        NameID -> Bigint,
        ServiceType -> Nullable<Smallint>,
        #[max_length = 16]
        OptionBits -> Varchar,
        #[max_length = 256]
        ScriptName -> Nullable<Varchar>,
        HeapSize -> Nullable<Integer>,
        Timeout -> Nullable<Integer>,
        PingFrequency -> Nullable<Integer>,
        BackupInterfaceNumber -> Nullable<Integer>,
        OfflineInterfaceNumber -> Nullable<Integer>,
        SimDbSync -> Nullable<Integer>,
        #[max_length = 256]
        SimDbDll -> Nullable<Varchar>,
        SimDbInterfaceNumber -> Nullable<Integer>,
        InterfaceType -> Nullable<Smallint>,
        #[max_length = 8]
        TtyOptionBits -> Varchar,
        #[max_length = 15]
        TtyDevice -> Nullable<Varchar>,
        TtyBaudRate -> Smallint,
        TtyWordLength -> Smallint,
        #[max_length = 50]
        TcpHost -> Nullable<Varchar>,
        TcpPort -> Nullable<Integer>,
        #[max_length = 8]
        SpxNetwork -> Nullable<Varchar>,
        #[max_length = 12]
        SpxNode -> Nullable<Varchar>,
        #[max_length = 4]
        SpxSocket -> Nullable<Varchar>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        #[max_length = 20]
        NameInternal -> Nullable<Varchar>,
        ServiceID -> Nullable<Integer>,
        EncodingType -> Nullable<Smallint>,
    }
}

diesel::table! {
    interface_link (InterfaceLinkID) {
        InterfaceLinkID -> Integer,
        HierStrucID -> Bigint,
        LinkIndex -> Integer,
        InterfaceID -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    job_code (JobCodeID) {
        JobCodeID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        ReportGroup -> Nullable<Integer>,
        #[max_length = 8]
        OptionBits -> Varchar,
        AvailableHierStrucID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        JobCodePostingTime -> Nullable<Datetime>,
        RoleID -> Nullable<Bigint>,
        EmpClassID -> Nullable<Integer>,
        ClkInPrivLevel -> Nullable<Integer>,
    }
}

diesel::table! {
    kds_bumpbar_button (KdsBumpbarButtonID) {
        KdsBumpbarButtonID -> Bigint,
        HierStrucID -> Bigint,
        KdsBumpbarStyleID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        ScancodeValue -> Integer,
        KdsFunction -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        #[max_length = 200]
        Parameters -> Nullable<Varchar>,
    }
}

diesel::table! {
    kds_bumpbar_style (KdsBumpbarStyleID) {
        KdsBumpbarStyleID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        LangID -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        AutoBumpTime -> Nullable<Bigint>,
        AutoBumpCheckCount -> Nullable<Bigint>,
    }
}

diesel::table! {
    kds_client (KdsClientID) {
        KdsClientID -> Bigint,
        HierStrucID -> Bigint,
        DeviceID -> Nullable<Bigint>,
        KdsControllerID -> Nullable<Bigint>,
        KdsLayoutStyleID -> Bigint,
        LangID -> Integer,
        PlatformType -> Integer,
        LicenseSeqNumber -> Nullable<Integer>,
        #[max_length = 32]
        OptionBits -> Varchar,
        SelectionTimeOut -> Nullable<Integer>,
        DisplayType -> Integer,
        NumberOfChitColumns -> Integer,
        NumberOfTableColumns -> Integer,
        NumberOfRows -> Integer,
        NumberOfPanels -> Integer,
        ToolbarPositionType -> Integer,
        PanelLayoutType -> Smallint,
        SOSTableDetailTimeOut -> Nullable<Integer>,
        ProdItemLocationType -> Nullable<Smallint>,
        ProdItemColumns -> Nullable<Integer>,
        SerpentineModeType -> Smallint,
        OrderTypeFontSize -> Nullable<Integer>,
        MenuItemFontSize -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        #[max_length = 50]
        HostAddress -> Nullable<Varchar>,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Nullable<Bigint>,
        KdsToolbarStyleObjNum -> Nullable<Integer>,
        KdsBumpbarStyleObjNum -> Nullable<Integer>,
        CardID -> Nullable<Smallint>,
        VideoID -> Nullable<Smallint>,
        SosZoneFontSize -> Nullable<Integer>,
        SortMethod -> Nullable<Integer>,
        MinTableState -> Nullable<Integer>,
        MaxTableState -> Nullable<Integer>,
        RecallListCol1Type -> Nullable<Integer>,
        RecallListCol1Width -> Nullable<Integer>,
        RecallListCol2Type -> Nullable<Integer>,
        RecallListCol2Width -> Nullable<Integer>,
        RecallListCol3Type -> Nullable<Integer>,
        RecallListCol3Width -> Nullable<Integer>,
        RecallListCol4Type -> Nullable<Integer>,
        RecallListCol4Width -> Nullable<Integer>,
        RecallListCol5Type -> Nullable<Integer>,
        RecallListCol5Width -> Nullable<Integer>,
        RecallListCol6Type -> Nullable<Integer>,
        RecallListCol6Width -> Nullable<Integer>,
        OrientationType -> Integer,
        AutoBumpTime -> Nullable<Bigint>,
        AutoBumpCheckCount -> Nullable<Bigint>,
        TableDetailToolbar -> Nullable<Integer>,
        ComboItemFontSize -> Integer,
        KdsWidth -> Integer,
        KdsHeight -> Integer,
        KdsFromTop -> Integer,
        KdsFromLeft -> Integer,
        #[max_length = 1000]
        PanelProportions -> Nullable<Varchar>,
        #[max_length = 1000]
        PanelChitColumns -> Nullable<Varchar>,
        #[max_length = 1000]
        PanelChitRows -> Nullable<Varchar>,
        SecRecAuthKeyId -> Nullable<Bigint>,
        #[max_length = 1000]
        PanelCapacity -> Nullable<Varchar>,
    }
}

diesel::table! {
    kds_client_production_item (KdsClientProdItemID) {
        KdsClientProdItemID -> Bigint,
        HierStrucID -> Bigint,
        KdsClientID -> Bigint,
        ProductionItemObjNum -> Integer,
        PersistenceType -> Smallint,
    }
}

diesel::table! {
    kds_controller (KdsControllerID) {
        KdsControllerID -> Bigint,
        HierStrucID -> Bigint,
        DeviceID -> Nullable<Bigint>,
        #[max_length = 32]
        OptionBits -> Varchar,
        PrepSuborderWait -> Nullable<Integer>,
        ProductionCountIncType -> Nullable<Smallint>,
        ProductionCountDecType -> Nullable<Smallint>,
        ExpoRecallAction -> Nullable<Smallint>,
        NumberOfZones -> Nullable<Integer>,
        MaxItemsPerZone -> Nullable<Integer>,
        #[max_length = 256]
        PostFileName1 -> Nullable<Varchar>,
        #[max_length = 256]
        PostFileName2 -> Nullable<Varchar>,
        #[max_length = 256]
        PostFileName3 -> Nullable<Varchar>,
        ItemStatusFiredColor -> Nullable<Integer>,
        ItemStatusBumpedColor -> Nullable<Integer>,
        ItemStatusSentColor -> Nullable<Integer>,
        LayoutAlert1Color -> Nullable<Integer>,
        LayoutAlert2Color -> Nullable<Integer>,
        LayoutBackgroundColor -> Nullable<Integer>,
        LayoutOrderSelectionColor -> Nullable<Integer>,
        LayoutOrderBackgroundColor -> Nullable<Integer>,
        LayoutVoidItemColor -> Nullable<Integer>,
        LayoutCourse1ItemColor -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Nullable<Bigint>,
        DbUpdateFrequency -> Nullable<Integer>,
        ServiceID -> Nullable<Integer>,
        ItemStatusStartedColor -> Nullable<Integer>,
        ItemSelectColor -> Nullable<Integer>,
        ItemMarkColor -> Nullable<Integer>,
        ItemRecallColor -> Nullable<Integer>,
        ItemRecallableColor -> Nullable<Integer>,
        AutoBumpTime -> Nullable<Bigint>,
        AutoBumpCheckCount -> Nullable<Bigint>,
        BackupServiceID -> Nullable<Integer>,
        BackupIsActive -> Nullable<Bit>,
        #[max_length = 256]
        ExternalPostFile1 -> Nullable<Varchar>,
        #[max_length = 256]
        ExternalPostFile2 -> Nullable<Varchar>,
        #[max_length = 256]
        ExternalPostFile3 -> Nullable<Varchar>,
        #[max_length = 10]
        LangISOCode -> Nullable<Varchar>,
        ResetAllTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    kds_detail (KdsDetailID) {
        KdsDetailID -> Bigint,
        #[max_length = 32]
        OrderID -> Varchar,
        CheckID -> Bigint,
        RevCtrID -> Integer,
        OrderDeviceIndex -> Smallint,
        IsAppetizer -> Bit,
        IsHighPriority -> Bit,
        MenuItemCount -> Integer,
        CourseNumber -> Integer,
        SentTime -> Datetime,
        PrepTime -> Integer,
        RecallCount -> Smallint,
        OrderAgingCategory1 -> Unsigned<Tinyint>,
        OrderAgingCategory2 -> Unsigned<Tinyint>,
        OrderAgingCategory3 -> Unsigned<Tinyint>,
        OrderAgingCategory4 -> Unsigned<Tinyint>,
        OrderAgingCategory5 -> Unsigned<Tinyint>,
        OrderAgingCategory6 -> Unsigned<Tinyint>,
        OrderAgingCategory7 -> Unsigned<Tinyint>,
        PostingTime -> Datetime,
        PostingWeekday -> Unsigned<Tinyint>,
        PostingMinute -> Smallint,
        ServingPeriodID -> Integer,
        AlertLevel1 -> Unsigned<Tinyint>,
        AlertLevel2 -> Unsigned<Tinyint>,
    }
}

diesel::table! {
    kds_detail_suborder (KdsDetailSuborderID) {
        KdsDetailSuborderID -> Bigint,
        KdsDetailID -> Bigint,
        #[max_length = 32]
        SuborderID -> Varchar,
        SIPSMenuItemObjectNumber -> Nullable<Integer>,
        SIPSMenuItemDefSeq -> Nullable<Integer>,
        SIPSMenuItemPrepTime -> Nullable<Integer>,
        #[max_length = 80]
        SIPSMenuItemModifiers -> Nullable<Varchar>,
        PostingTime -> Datetime,
        ActualPrepTime -> Nullable<Integer>,
    }
}

diesel::table! {
    kds_highlight_scheme (KdsHighlightSchemeID) {
        KdsHighlightSchemeID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        BackgroundColor -> Nullable<Integer>,
        ForegroundColor -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    kds_layout_element (KdsLayoutElementID) {
        KdsLayoutElementID -> Bigint,
        HierStrucID -> Bigint,
        KdsLayoutStyleID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        LayoutElementType -> Integer,
        AlternateLayoutElementType -> Nullable<Integer>,
        RowNumber -> Nullable<Integer>,
        ColumnNumber -> Nullable<Integer>,
        Justification -> Nullable<Integer>,
        Width -> Nullable<Integer>,
        #[max_length = 30]
        ColumnTitle -> Nullable<Varchar>,
        FontName -> Nullable<Integer>,
        FontSize -> Nullable<Integer>,
        FontBold -> Nullable<Bit>,
        ForeGroundColor -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    kds_layout_style (KdsLayoutStyleID) {
        KdsLayoutStyleID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        StyleType -> Integer,
        PanelColor -> Nullable<Integer>,
        SelectedColor -> Nullable<Integer>,
        ActiveColor -> Nullable<Integer>,
        Alert1Color -> Nullable<Integer>,
        Alert2Color -> Nullable<Integer>,
        TitleFontName -> Nullable<Integer>,
        TitleFontSize -> Nullable<Integer>,
        TitleFontBold -> Nullable<Bit>,
        ElementFontName -> Nullable<Integer>,
        ElementFontSize -> Nullable<Integer>,
        ElementFontBold -> Nullable<Bit>,
        GridColor -> Nullable<Integer>,
        VoidColor -> Nullable<Integer>,
        AppItemColor -> Nullable<Integer>,
        #[max_length = 32]
        OptionBits -> Varchar,
        LangID -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    kds_linked_order_devices (KdsLinkedOrderDeviceId) {
        KdsLinkedOrderDeviceId -> Bigint,
        HierStrucID -> Bigint,
        KdsOrderDeviceParamsID -> Bigint,
        OrderDeviceID -> Integer,
    }
}

diesel::table! {
    kds_order_device_parameters (KdsOrderDeviceParamsID) {
        KdsOrderDeviceParamsID -> Bigint,
        HierStrucID -> Bigint,
        #[max_length = 48]
        KdsOrderDeviceOptionBits -> Varchar,
        SendToPanel -> Nullable<Integer>,
        BeepOnNewOrder -> Nullable<Integer>,
        Course1FirstAlertTimeout -> Integer,
        Course1SecondAlertTimeout -> Integer,
        OtherCourse1stAlertTimeout -> Integer,
        OtherCourse2ndAlertTimeout -> Integer,
        PrimaryRunnerChitPrinterID -> Nullable<Bigint>,
        BackupRunnerChitPrinterID -> Nullable<Bigint>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        PrimaryPrinterID -> Nullable<Integer>,
        BackupPrinterID -> Nullable<Integer>,
        AddSortRule -> Nullable<Smallint>,
        ModifySortRule -> Nullable<Smallint>,
        VoidSortRule -> Nullable<Smallint>,
        AddHighlightObjNum -> Nullable<Integer>,
        ModifyHighlightObjNum -> Nullable<Integer>,
        VoidHighlightObjNum -> Nullable<Integer>,
        NewOrderTimeout -> Nullable<Integer>,
        BeepOnPrioritizeOrder -> Nullable<Integer>,
        BeepOnVIPOrder -> Nullable<Integer>,
        BeepOnRushOrder -> Nullable<Integer>,
        OrderAppearanceDelay -> Integer,
        Lane -> Nullable<Smallint>,
        Workflow -> Nullable<Smallint>,
        #[max_length = 1000]
        AssociatedOrderDevices -> Nullable<Varchar>,
    }
}

diesel::table! {
    kds_order_distribution_state (KdsOrderDistributionStateID) {
        KdsOrderDistributionStateID -> Bigint,
        #[max_length = 32]
        OrderID -> Varchar,
        CheckID -> Bigint,
        RevCtrID -> Integer,
        DistributionState -> Integer,
        SetOnTime -> Datetime,
    }
}

diesel::table! {
    kds_rvchier (KdsRvcID) {
        KdsRvcID -> Bigint,
        HierStrucID -> Bigint,
        KdsControllerID -> Bigint,
        RvcHierStrucID -> Nullable<Bigint>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    kds_theme (KdsThemeID) {
        KdsThemeID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        #[max_length = 32]
        RvcGroupMask -> Varchar,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    kds_theme_kds_client (KdsThemeKdsClientID) {
        KdsThemeKdsClientID -> Bigint,
        HierStrucID -> Bigint,
        KdsThemeID -> Bigint,
        KdsClientID -> Bigint,
        KdsToolbarStyleObjNum -> Integer,
        KdsBumpbarStyleObjNum -> Integer,
        NumberOfPanels -> Integer,
        PanelLayoutType -> Smallint,
        SerpentineModeType -> Smallint,
        #[max_length = 1000]
        PanelProportions -> Nullable<Varchar>,
        #[max_length = 1000]
        PanelChitColumns -> Nullable<Varchar>,
        #[max_length = 1000]
        PanelChitRows -> Nullable<Varchar>,
        #[max_length = 1000]
        PanelCapacity -> Nullable<Varchar>,
    }
}

diesel::table! {
    kds_theme_order_device (KdsThemeOrderDeviceID) {
        KdsThemeOrderDeviceID -> Bigint,
        HierStrucID -> Bigint,
        KdsThemeID -> Bigint,
        OrdDvcIndex -> Smallint,
        RedirectOrderDeviceID -> Nullable<Integer>,
        KdsOrderDeviceParamsID -> Nullable<Bigint>,
        OrdDvcType -> Smallint,
        PrimaryType -> Nullable<Smallint>,
        PrimaryID -> Nullable<Bigint>,
        BackupType -> Nullable<Smallint>,
        BackupID -> Nullable<Bigint>,
        DOMType -> Nullable<Smallint>,
        DistributionGroupID -> Nullable<Integer>,
        SecondaryBackupID -> Nullable<Bigint>,
        CondimentSortType -> Integer,
    }
}

diesel::table! {
    kds_theme_order_type (KdsThemeOrderTypeID) {
        KdsThemeOrderTypeID -> Bigint,
        HierStrucID -> Bigint,
        OrdTypeIndex -> Integer,
        KdsThemeID -> Bigint,
        #[max_length = 32]
        OrderDeviceMask -> Varchar,
    }
}

diesel::table! {
    kds_theme_period (KdsThemePeriodID) {
        KdsThemePeriodID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        EffectivityID -> Nullable<Bigint>,
        KdsThemeID -> Nullable<Bigint>,
    }
}

diesel::table! {
    kds_theme_ws_order_device (KdsThemeWsOrderDeviceID) {
        KdsThemeWsOrderDeviceID -> Bigint,
        HierStrucID -> Bigint,
        WorkstationID -> Integer,
        KdsThemeID -> Bigint,
        #[max_length = 32]
        OrderDeviceMask -> Varchar,
    }
}

diesel::table! {
    kds_toolbar_button (KdsToolbarButtonID) {
        KdsToolbarButtonID -> Bigint,
        HierStrucID -> Bigint,
        KdsToolbarStyleID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        ButtonBackgroundColor -> Nullable<Integer>,
        ButtonForegroundColor -> Nullable<Integer>,
        ButtonFunction -> Integer,
        LegendID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        #[max_length = 200]
        Parameters -> Nullable<Varchar>,
        SortOrder -> Nullable<Integer>,
    }
}

diesel::table! {
    kds_toolbar_style (KdsToolbarStyleID) {
        KdsToolbarStyleID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        ToolBarBackgroundColor -> Integer,
        ButtonHeight -> Integer,
        ButtonWidth -> Integer,
        LangID -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    key_db_info (KeyDBInfoID) {
        KeyDBInfoID -> Integer,
        KeyDBIdx -> Integer,
        KeyDBVer -> Integer,
    }
}

diesel::table! {
    labor_data (ID) {
        ID -> Bigint,
        Type -> Smallint,
        #[max_length = 64]
        TypeExt -> Varchar,
        #[max_length = 128]
        TypeID1 -> Varchar,
        #[max_length = 128]
        TypeID2 -> Varchar,
        #[max_length = 128]
        TypeID3 -> Varchar,
        DateTime1 -> Nullable<Datetime>,
        DateTime2 -> Nullable<Datetime>,
        Data -> Nullable<Longblob>,
    }
}

diesel::table! {
    labor_punches (ID) {
        ID -> Bigint,
        Type -> Smallint,
        #[max_length = 128]
        TypeExt -> Varchar,
        #[max_length = 128]
        PayrollID -> Varchar,
        #[max_length = 128]
        AuthPayrollID -> Varchar,
        ClockInOutStatus -> Smallint,
        JobCode -> Nullable<Integer>,
        RevenueCenter -> Nullable<Integer>,
        CashTips -> Nullable<Decimal>,
        IndirectTips -> Nullable<Decimal>,
        Time2 -> Nullable<Datetime>,
        ClockIn -> Nullable<Bit>,
        SelectedBreak -> Nullable<Longblob>,
        ShiftNumber -> Nullable<Integer>,
        OtherStoresClockedIn -> Nullable<Longblob>,
    }
}

diesel::table! {
    language_information (LangID) {
        LangID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        #[max_length = 16]
        OptionBits -> Varchar,
        #[max_length = 1]
        DotChar -> Varchar,
        #[max_length = 1]
        CommaChar -> Varchar,
        #[max_length = 10]
        Digits -> Nullable<Varchar>,
        #[max_length = 256]
        TrnFile -> Varchar,
        #[max_length = 256]
        OpsDisplayCfg -> Varchar,
        #[max_length = 256]
        UserDisplayCfg -> Varchar,
        #[max_length = 70]
        PrintingFont -> Nullable<Varchar>,
        FontSize -> Integer,
        LineSpacing -> Integer,
        LeftMargin -> Integer,
        KeyboardLayout -> Nullable<Integer>,
        #[max_length = 70]
        LocaleString -> Varchar,
        ImpactFontID1 -> Integer,
        ImpactFontID2 -> Integer,
        ThermalFontID1 -> Integer,
        ThermalFontID2 -> Integer,
        LocaleID -> Integer,
        CompareFlags -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        #[max_length = 256]
        AltTrnFile -> Nullable<Varchar>,
        #[max_length = 20]
        WsReportsLogonName -> Nullable<Varchar>,
        #[max_length = 16]
        WsReportsPassword -> Nullable<Varchar>,
        #[max_length = 9]
        WsReportsLanguage -> Nullable<Varchar>,
        #[max_length = 50]
        LCDCustomerDisplayFont -> Nullable<Varchar>,
        POSAlphaNumericKeyboardNum -> Nullable<Smallint>,
    }
}

diesel::table! {
    language_information_text (LanguageInformationTextID) {
        LanguageInformationTextID -> Integer,
        HierStrucID -> Nullable<Bigint>,
        LangID -> Nullable<Integer>,
        #[max_length = 256]
        TextType -> Nullable<Varchar>,
        TextFile -> Nullable<Longblob>,
        #[max_length = 256]
        Description -> Nullable<Varchar>,
        IsTranslation -> Bit,
        Version -> Integer,
        LastUpdatedDateTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    language_property (LangPropertyID) {
        LangPropertyID -> Integer,
        LangID -> Integer,
        HierStrucID -> Bigint,
        LangIndex -> Integer,
        Is2ndPrintLang -> Bit,
    }
}

diesel::table! {
    locale_information (LocaleInfoID) {
        LocaleInfoID -> Integer,
        HierStrucID -> Bigint,
        NameID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        #[max_length = 5]
        DecimalSeparator -> Nullable<Varchar>,
        #[max_length = 5]
        ThousandsSeparator -> Nullable<Varchar>,
    }
}

diesel::table! {
    loyalty_config (LoyaltyConfigID) {
        LoyaltyConfigID -> Bigint,
        HierStrucID -> Nullable<Bigint>,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        #[max_length = 64]
        OptionBits -> Varchar,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    loyalty_provider (LoyaltyProviderID) {
        LoyaltyProviderID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        #[max_length = 15]
        ProviderReference -> Nullable<Varchar>,
        InterfaceType -> Nullable<Smallint>,
        InterfaceTypeObjNum -> Nullable<Integer>,
        LoyaltyRecords -> Nullable<Smallint>,
        LoyaltyRecordsObjNum -> Nullable<Integer>,
        ModuleType -> Nullable<Smallint>,
        ModuleTypeObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    #[sql_name = "macro"]
    macro_ (MacroID) {
        MacroID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        #[max_length = 8]
        OptionBits -> Varchar,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    macro_step (MacroStepID) {
        MacroStepID -> Integer,
        HierStrucID -> Bigint,
        MacroID -> Integer,
        StepNumber -> Integer,
        KeyType -> Nullable<Integer>,
        KeyNumber -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        MainLevelIndex -> Nullable<Integer>,
        SubLevelIndex -> Nullable<Integer>,
    }
}

diesel::table! {
    main_menu_level (MainMenuLvlID) {
        MainMenuLvlID -> Integer,
        HierStrucID -> Bigint,
        MenuLvlIndex -> Smallint,
        PrefixID -> Bigint,
        NameID -> Bigint,
        SuffixID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        LastPostingTime -> Nullable<Datetime>,
        EntryType -> Nullable<Smallint>,
        #[max_length = 8]
        OptionBits -> Varchar,
    }
}

diesel::table! {
    major_group (MajGrpID) {
        MajGrpID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        ReportGroup -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        MajorGroupPostingTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    menu_item_class (MenuItemClassID) {
        MenuItemClassID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        #[max_length = 96]
        OptionBits -> Varchar,
        TransDfltMain -> Bit,
        TransDfltSub -> Bit,
        #[max_length = 8]
        PrintOptionBits -> Nullable<Varchar>,
        PrintGroup -> Smallint,
        PrivilegeGroup -> Nullable<Smallint>,
        DscntItmzrIndex -> Nullable<Integer>,
        SvcChgItmzrIndex -> Nullable<Integer>,
        Halo -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        LastPostingTime -> Nullable<Datetime>,
        TempConfiguration -> Nullable<Longtext>,
        CondimentOrderingType -> Nullable<Smallint>,
        TaxClassObjNum -> Nullable<Integer>,
        SlsItmzrIndex -> Nullable<Smallint>,
        MainMenuLvlIndex -> Nullable<Smallint>,
        SubMenuLvlIndex -> Nullable<Smallint>,
        DefaultMasterGroupObjNum -> Nullable<Integer>,
        CountEntryType -> Nullable<Smallint>,
        CountDisplayType -> Nullable<Smallint>,
        PricingCalculation -> Nullable<Smallint>,
        #[max_length = 256]
        MemberOfCondiments -> Varchar,
        #[max_length = 256]
        RequiredCondiments -> Varchar,
        #[max_length = 256]
        AllowedCondiments -> Varchar,
        RoutingGroupObjNum -> Nullable<Integer>,
        KdsCourseNum -> Nullable<Integer>,
        PrintClassObjNum -> Nullable<Integer>,
        NextPage -> Nullable<Integer>,
        #[max_length = 200]
        NextPanel -> Nullable<Varchar>,
        CondimentPrefixType -> Nullable<Smallint>,
        DefaultOrderTypeIndex -> Nullable<Integer>,
        KdsHighlightSchemeObjNum -> Nullable<Integer>,
        MaxRefillCount -> Nullable<Integer>,
        RefillDescriptorID -> Nullable<Bigint>,
        PopupCondOrderPageObjNum -> Nullable<Integer>,
        PopupCondEditPageObjNum -> Nullable<Integer>,
        ServiceChargeGroupObjNum -> Nullable<Integer>,
        PreProdChitPrintClassObjNum -> Nullable<Integer>,
        AllergenClassObjNum -> Nullable<Integer>,
        CondimentHandling -> Nullable<Smallint>,
    }
}

diesel::table! {
    menu_item_component (MenuItemComponentID) {
        MenuItemComponentID -> Bigint,
        HierStrucID -> Bigint,
        MenuItemDefID -> Bigint,
        ObjectNumber -> Bigint,
        MenuItemObjNum -> Integer,
        MenuItemDefSeqNum -> Integer,
    }
}

diesel::table! {
    menu_item_default_condiment (MenuItemDefaultCondID) {
        MenuItemDefaultCondID -> Bigint,
        DefLevelOverride -> Nullable<Smallint>,
        SortGroup -> Nullable<Smallint>,
        PriceLevelOverride -> Nullable<Smallint>,
        #[max_length = 50]
        TempConfiguration -> Nullable<Varchar>,
        HierStrucID -> Bigint,
        MenuItemDefID -> Bigint,
        #[max_length = 8]
        OptionBits -> Varchar,
        CondimentSetObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    menu_item_definition (MenuItemDefID) {
        MenuItemDefID -> Bigint,
        HierStrucID -> Bigint,
        MenuItemMasterID -> Integer,
        SequenceNum -> Integer,
        Name1ID -> Bigint,
        Name2ID -> Bigint,
        SluSort -> Nullable<Integer>,
        NluNumber -> Nullable<Bigint>,
        Tare -> Nullable<Decimal>,
        Surcharge -> Nullable<Decimal>,
        IconNumber -> Nullable<Integer>,
        #[max_length = 8]
        OptionBits -> Varchar,
        SpecialCount -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        PrepTime -> Nullable<Integer>,
        MenuItemDefinitionPostingTime -> Nullable<Datetime>,
        Name3ID -> Nullable<Bigint>,
        LongDescriptorID -> Nullable<Bigint>,
        TempConfiguration -> Nullable<Longtext>,
        MenuItemClassObjNum -> Nullable<Integer>,
        NluGroupIndex -> Nullable<Integer>,
        SluIndex -> Nullable<Integer>,
        HhtSluIndex -> Nullable<Integer>,
        #[max_length = 8]
        MainLvl -> Varchar,
        #[max_length = 8]
        SubLvl -> Varchar,
        PosRef -> Nullable<Bigint>,
        SluGroupNum -> Nullable<Integer>,
        PrintClassObjNum -> Nullable<Integer>,
        PrefixLevelOverride -> Integer,
        GuestCount -> Nullable<Integer>,
        Slu2 -> Nullable<Integer>,
        Slu3 -> Nullable<Integer>,
        Slu4 -> Nullable<Integer>,
        Slu5 -> Nullable<Integer>,
        Slu6 -> Nullable<Integer>,
        Slu7 -> Nullable<Integer>,
        Slu8 -> Nullable<Integer>,
        Quantity -> Integer,
        AllergenClassObjNum -> Nullable<Integer>,
        #[max_length = 1024]
        ConsumerAdvisoryDesc -> Nullable<Varchar>,
        CapacityUsage -> Integer,
        ConsumerAdvDescID -> Nullable<Bigint>,
    }
}

diesel::table! {
    menu_item_definition_tag (MenuItemDefTagID) {
        MenuItemDefTagID -> Bigint,
        HierStrucID -> Bigint,
        MenuItemDefID -> Bigint,
        MenuItemTagObjNum -> Bigint,
        MenuItemObjNum -> Bigint,
        MenuItemDefSeqNum -> Integer,
    }
}

diesel::table! {
    menu_item_detail (MenuItemDtlID) {
        CheckDetailID -> Bigint,
        MenuItemDefID -> Bigint,
        MenuItemPriceID -> Nullable<Bigint>,
        EmployeeID -> Nullable<Bigint>,
        #[max_length = 128]
        OptionBits -> Varchar,
        NluIndex -> Nullable<Smallint>,
        NluNumber -> Nullable<Bigint>,
        #[max_length = 40]
        PrintOptionBits -> Varchar,
        MainMenuLvlIndex -> Smallint,
        SubMenuLvlIndex -> Smallint,
        DscntItmzrID -> Nullable<Integer>,
        SvcChgItmzrID -> Nullable<Integer>,
        SlsItmzrIndex -> Smallint,
        PrintGroup -> Smallint,
        PrivilegeLevel -> Nullable<Integer>,
        RecipeNameID -> Nullable<Integer>,
        SluIndex -> Nullable<Integer>,
        VoidReasonID -> Nullable<Integer>,
        PrepCost -> Nullable<Decimal>,
        Surcharge -> Nullable<Decimal>,
        Weight -> Nullable<Decimal>,
        PrepTime -> Nullable<Integer>,
        IsDefault -> Bit,
        RelativeCount -> Nullable<Decimal>,
        DefaultCount -> Nullable<Integer>,
        #[max_length = 64]
        TaxRates -> Nullable<Varchar>,
        CustomLevelObjNum1 -> Nullable<Unsigned<Tinyint>>,
        CustomLevel1 -> Nullable<Unsigned<Tinyint>>,
        CustomLevelObjNum2 -> Nullable<Unsigned<Tinyint>>,
        CustomLevel2 -> Nullable<Unsigned<Tinyint>>,
        CustomLevelObjNum3 -> Nullable<Unsigned<Tinyint>>,
        CustomLevel3 -> Nullable<Unsigned<Tinyint>>,
        CustomLevelObjNum4 -> Nullable<Unsigned<Tinyint>>,
        CustomLevel4 -> Nullable<Unsigned<Tinyint>>,
        CustomLevelObjNum5 -> Nullable<Unsigned<Tinyint>>,
        CustomLevel5 -> Nullable<Unsigned<Tinyint>>,
        CustomLevelObjNum6 -> Nullable<Unsigned<Tinyint>>,
        CustomLevel6 -> Nullable<Unsigned<Tinyint>>,
        CustomLevelObjNum7 -> Nullable<Unsigned<Tinyint>>,
        CustomLevel7 -> Nullable<Unsigned<Tinyint>>,
        CustomLevelObjNum8 -> Nullable<Unsigned<Tinyint>>,
        CustomLevel8 -> Nullable<Unsigned<Tinyint>>,
        HasMoreCustomeLevels -> Nullable<Unsigned<Tinyint>>,
        MenuItemDtlID -> Bigint,
        ComboGroupObjNum -> Nullable<Integer>,
        ComboNum -> Nullable<Smallint>,
        ComboSideNum -> Nullable<Smallint>,
        ComboMealSize -> Nullable<Smallint>,
        ComboSideID -> Nullable<Integer>,
        ComboGroupSideObjNum -> Nullable<Integer>,
        CondimentPrefixType -> Nullable<Smallint>,
        OrderTypeId -> Nullable<Integer>,
        TareWeight -> Nullable<Decimal>,
        RefillDetailID -> Nullable<Integer>,
        DefSequenceNum -> Nullable<Integer>,
        AutoFireTime -> Nullable<Datetime>,
        OrderDeviceSentTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    menu_item_dtl_menu_level (MenuItemDtlMenuLevelID) {
        MenuItemDtlMenuLevelID -> Bigint,
        MenuLvlNumber -> Smallint,
        MenuLvlIndex -> Smallint,
        MenuItemDtlID -> Bigint,
    }
}

diesel::table! {
    menu_item_group (MenuItemGroupID) {
        MenuItemGroupID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        MenuItemGroupComment -> Nullable<Longtext>,
        Threshold -> Nullable<Integer>,
        TaxClassObjNum -> Nullable<Integer>,
        GroupType -> Integer,
    }
}

diesel::table! {
    menu_item_group_detail (MenuItemGroupDetailID) {
        MenuItemGroupDetailID -> Integer,
        HierStrucID -> Bigint,
        MenuItemGroupID -> Integer,
        GroupType -> Nullable<Integer>,
        Exclude -> Bit,
        StartObjectNumber -> Nullable<Integer>,
        EndObjectNumber -> Nullable<Integer>,
        PromotionPrice -> Nullable<Decimal>,
        SeqNo -> Nullable<Smallint>,
    }
}

diesel::table! {
    menu_item_master (MenuItemMasterID) {
        MenuItemMasterID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        ReportGroup -> Nullable<Integer>,
        #[max_length = 8]
        Status -> Varchar,
        RecipeLinkID -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        MenuItemMasterPostingTime -> Nullable<Datetime>,
        TempConfiguration -> Nullable<Longtext>,
        FamGrpObjNum -> Nullable<Integer>,
        MajGrpObjNum -> Nullable<Integer>,
        MasterGrpObjNum -> Nullable<Integer>,
        Name2ID -> Nullable<Bigint>,
    }
}

diesel::table! {
    menu_item_master_eff (MenuItemMasterEffID) {
        MenuItemMasterEffID -> Integer,
        HierStrucID -> Bigint,
        MenuItemMasterID -> Integer,
        MenuItemMasterObjNum -> Nullable<Integer>,
        ChangeSetObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    menu_item_master_group (MenuItemMasterGroupID) {
        MenuItemMasterGroupID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        TempConfiguration -> Nullable<Longtext>,
        NameID -> Nullable<Bigint>,
        ObjectNumber -> Nullable<Integer>,
        HierStrucID -> Bigint,
        SluIndex -> Nullable<Integer>,
    }
}

diesel::table! {
    menu_item_master_tag (MenuItemMasterTagId) {
        MenuItemMasterTagId -> Bigint,
        HierStrucID -> Bigint,
        MenuItemMasterId -> Integer,
        MenuItemObjNum -> Bigint,
        MenuItemTagObjNum -> Bigint,
    }
}

diesel::table! {
    menu_item_menu_level_entry (MenuItemMenuLevelEntryID) {
        MenuItemMenuLevelEntryID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        HierStrucID -> Bigint,
        MenuItemDefID -> Bigint,
        MenuLvlEntryIndex -> Integer,
        MenuLevelObjNum -> Integer,
    }
}

diesel::table! {
    menu_item_nutrient_set (MenuItemNutrientSetId) {
        MenuItemNutrientSetId -> Bigint,
        NutrientSetObjNum -> Nullable<Integer>,
        HierStrucID -> Bigint,
        MenuItemDefId -> Bigint,
    }
}

diesel::table! {
    menu_item_price (MenuItemPriceID) {
        MenuItemPriceID -> Bigint,
        HierStrucID -> Bigint,
        MenuItemDefID -> Bigint,
        SequenceNum -> Integer,
        MenuLvlIndex -> Nullable<Integer>,
        #[max_length = 8]
        OptionBits -> Varchar,
        Price -> Nullable<Decimal>,
        PrepCost -> Nullable<Decimal>,
        RecipeNameID -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        MenuItemPricePostingTime -> Nullable<Datetime>,
        PriceGroupID -> Nullable<Integer>,
        TempConfiguration -> Nullable<Longtext>,
        TaxClassObjNum -> Nullable<Integer>,
        ChangeSetObjNum -> Nullable<Integer>,
        PosRef -> Nullable<Bigint>,
        ServiceChargeGroupObjNum -> Nullable<Integer>,
        ParentTaxClassOvrdObjNmbr -> Nullable<Integer>,
    }
}

diesel::table! {
    menu_item_production_item (MenuItemProdItemID) {
        MenuItemProdItemID -> Bigint,
        HierStrucID -> Bigint,
        MenuItemDefID -> Bigint,
        ProductionItemObjNum -> Integer,
        ProductionCount -> Nullable<Decimal>,
        MenuItemObjNum -> Integer,
        MenuItemDefSeqNum -> Integer,
    }
}

diesel::table! {
    menu_level (MenuLevelID) {
        MenuLevelID -> Bigint,
        ObjectNumber -> Integer,
        MenuLevelType -> Nullable<Smallint>,
        #[max_length = 8]
        OptionBits -> Varchar,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        HierStrucID -> Bigint,
        NameID -> Nullable<Bigint>,
        #[max_length = 50]
        TempConfiguration -> Nullable<Varchar>,
        DefaultMasterGroupObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    menu_level_entry (MenuLevelEntryID) {
        MenuLevelEntryID -> Integer,
        MenuLvlIndex -> Integer,
        PrefixID -> Nullable<Bigint>,
        SuffixID -> Nullable<Bigint>,
        EntryType -> Nullable<Smallint>,
        #[max_length = 8]
        OptionBits -> Varchar,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        HierStrucID -> Bigint,
        MenuLevelID -> Bigint,
        NameID -> Nullable<Bigint>,
        #[max_length = 50]
        TempConfiguration -> Nullable<Varchar>,
    }
}

diesel::table! {
    menuitmcondimntprptme (PrepTimeOverrideID) {
        PrepTimeOverrideID -> Bigint,
        HierStrucID -> Bigint,
        MenuItemObjNum -> Integer,
        MenuItemDefSeqNum -> Integer,
        MenuItemDefID -> Bigint,
        CondimentObjNum -> Integer,
        CondimentDefSeqNum -> Integer,
        CondimentDefID -> Bigint,
        PrepTime -> Integer,
    }
}

diesel::table! {
    mrequest_data (RID) {
        #[max_length = 64]
        RID -> Varchar,
        ReqDataTime -> Nullable<Datetime>,
        CheckID -> Nullable<Bigint>,
        Data1 -> Nullable<Bigint>,
        ReqData -> Nullable<Longblob>,
        #[max_length = 40]
        DataGuid -> Nullable<Varchar>,
        ID -> Nullable<Bigint>,
        HierStrucId -> Nullable<Bigint>,
        OrganizationID -> Nullable<Bigint>,
        RecordType -> Nullable<Integer>,
    }
}

diesel::table! {
    mrequest_response (RID) {
        #[max_length = 64]
        RID -> Varchar,
        RespTime -> Nullable<Datetime>,
        RespData -> Nullable<Longblob>,
        ID -> Nullable<Bigint>,
    }
}

diesel::table! {
    mrequests (ID) {
        ID -> Bigint,
        #[max_length = 64]
        RID -> Varchar,
        ReqTime -> Datetime,
        ReqState -> Unsigned<Tinyint>,
        RecordType -> Integer,
        Data1 -> Nullable<Bigint>,
        ServiceID -> Nullable<Integer>,
        FirstRequestTime -> Nullable<Datetime>,
        OfflinePosting -> Nullable<Bit>,
        #[max_length = 80]
        ServiceHostInfo -> Nullable<Varchar>,
        #[max_length = 1000]
        TelemetryInfo -> Nullable<Varchar>,
        PostedToChannelManagement -> Nullable<Bit>,
    }
}

diesel::table! {
    mrequests_bak (ID) {
        ID -> Bigint,
        RecordType -> Integer,
        #[max_length = 64]
        RID -> Varchar,
        ReqTime -> Datetime,
        CheckID -> Nullable<Bigint>,
        Data1 -> Nullable<Bigint>,
        #[max_length = 40]
        DataGuid -> Nullable<Varchar>,
        ReqData -> Nullable<Longblob>,
        ServiceID -> Nullable<Integer>,
        FirstRequestTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    mrequests_bak_send (LastSentID) {
        LastSentID -> Bigint,
    }
}

diesel::table! {
    multimedia (MediaID) {
        MediaID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        MediaType -> Smallint,
    }
}

diesel::table! {
    multimedia_data (MediaDataID) {
        MediaDataID -> Integer,
        MediaID -> Integer,
        HierStrucID -> Bigint,
        LangID -> Integer,
        MediaData -> Nullable<Longblob>,
    }
}

diesel::table! {
    netvupoint_config (NetvupointConfigId) {
        NetvupointConfigId -> Integer,
        HierStrucId -> Bigint,
        MonthsToSaveData -> Integer,
        LocationId -> Integer,
        OrganizationId -> Integer,
        LanguageId -> Integer,
        NextTransNumber -> Nullable<Bigint>,
        MaxJournalRecords -> Nullable<Integer>,
        #[max_length = 20]
        LocRef -> Nullable<Varchar>,
    }
}

diesel::table! {
    number_lookup (NluID) {
        NluID -> Integer,
        HierStrucID -> Bigint,
        NluIndex -> Smallint,
        NameID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        LastPostingTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    nutrient_set (NutrientSetId) {
        NutrientSetId -> Bigint,
        HierStrucID -> Bigint,
        NameID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    nutrient_set_nutrient (NutrientSetNutrientId) {
        NutrientSetNutrientId -> Bigint,
        NutrientSetId -> Bigint,
        HierStrucID -> Bigint,
        NutritionObjNumber -> Nullable<Bigint>,
        UnitOfMeasure -> Nullable<Integer>,
        Quantity -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    nutrition (NutritionID) {
        NutritionID -> Bigint,
        HierStrucID -> Bigint,
        NutritionIndex -> Integer,
        NameID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        LastPostingTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    oidc_conf_client_info (ConfClientID) {
        ConfClientID -> Integer,
        #[max_length = 255]
        ClientName -> Varchar,
        #[max_length = 255]
        ClientID -> Varchar,
        ClientSecret -> Longblob,
        ClientScope -> Nullable<Integer>,
        IssuedOn -> Nullable<Datetime>,
        ServiceHostID -> Nullable<Integer>,
        HierStrucID -> Nullable<Bigint>,
        EncryptionKeyID -> Nullable<Bigint>,
        AuthZRole -> Nullable<Integer>,
        RegistrationAccessToken -> Nullable<Longblob>,
        LastRotatedOn -> Nullable<Datetime>,
        ClientSecretExpiresAt -> Nullable<Datetime>,
    }
}

diesel::table! {
    open_client_access_detail (AccessID) {
        AccessID -> Integer,
        OpenClientUID -> Integer,
        AccessType -> Integer,
        #[max_length = 20]
        ReferenceID -> Nullable<Varchar>,
        HierStrucID -> Bigint,
        IsDisabled -> Bit,
        CreatedOn -> Nullable<Datetime>,
        UpdatedOn -> Nullable<Datetime>,
    }
}

diesel::table! {
    open_client_user_info (OpenClientUID) {
        OpenClientUID -> Integer,
        #[max_length = 255]
        UserUID -> Varchar,
        #[max_length = 255]
        ClientName -> Varchar,
        #[max_length = 255]
        ClientID -> Varchar,
        ClientScope -> Integer,
        IsUserDisabled -> Bit,
        IsClientDisabled -> Bit,
        #[max_length = 255]
        TenantID -> Varchar,
        CreatedOn -> Nullable<Datetime>,
        UpdatedOn -> Nullable<Datetime>,
        #[max_length = 8]
        OrgShortName -> Varchar,
        HierStrucID -> Nullable<Bigint>,
        AuthZRole -> Nullable<Integer>,
        IsTerminated -> Bit,
    }
}

diesel::table! {
    operator (OperatorID) {
        OperatorID -> Bigint,
        HierStrucID -> Bigint,
        EmployeeID -> Bigint,
        #[max_length = 32]
        OptionBits -> Varchar,
        CashierID -> Nullable<Integer>,
        TrkGrpID -> Nullable<Integer>,
        TableCount -> Nullable<Integer>,
        CashDrawer -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        OverrideEmpClassOptions -> Bit,
        EmployeeColor -> Nullable<Integer>,
        CoverCount -> Nullable<Integer>,
        CheckCount -> Nullable<Integer>,
        LastPartyAssignment -> Nullable<Datetime>,
        ServerEfficiency -> Nullable<Integer>,
        ServerNextAvailableTime -> Nullable<Datetime>,
        CMAccountingMethodID -> Nullable<Integer>,
        ServerBankingTemplateObjNum -> Nullable<Integer>,
        GroupEventDefDtlID -> Nullable<Bigint>,
    }
}

diesel::table! {
    operator_touchscreen (OperTouchscrnID) {
        OperTouchscrnID -> Bigint,
        HierStrucID -> Bigint,
        OperatorID -> Bigint,
        DeviceType -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        TouchscreenObjNum -> Integer,
    }
}

diesel::table! {
    order_channel (OrdChannelID) {
        OrdChannelID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        LastPostingTime -> Nullable<Datetime>,
        IsActive -> Bit,
    }
}

diesel::table! {
    order_channel_config (OrdChannelConfigID) {
        OrdChannelConfigID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        OrdChannelID -> Bigint,
        #[max_length = 32]
        OrderDeviceMask -> Varchar,
        KdsHighlightSchemeObjNum -> Integer,
        ServiceLevelTime -> Nullable<Smallint>,
        ServiceChargeObjNum -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        IsActive -> Bit,
        #[max_length = 32]
        OptionBits -> Varchar,
    }
}

diesel::table! {
    order_device (OrderDeviceID) {
        OrderDeviceID -> Integer,
        HierStrucID -> Bigint,
        OrdDvcIndex -> Smallint,
        HeaderID -> Bigint,
        OrdDvcType -> Smallint,
        SortType -> Nullable<Smallint>,
        MaxChitLines -> Nullable<Smallint>,
        #[max_length = 48]
        OptionBits -> Varchar,
        DeviceID -> Nullable<Bigint>,
        BackupDeviceID -> Nullable<Bigint>,
        RedirectOrderDeviceID -> Nullable<Integer>,
        VduScreenConfig -> Nullable<Smallint>,
        VduOrderTimeout -> Nullable<Integer>,
        #[max_length = 8]
        VduOptionBits -> Varchar,
        LangID -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        KdsOrderDeviceParamsID -> Nullable<Bigint>,
        PrimaryType -> Nullable<Smallint>,
        PrimaryID -> Nullable<Bigint>,
        BackupType -> Nullable<Smallint>,
        BackupID -> Nullable<Bigint>,
        LastPostingTime -> Nullable<Datetime>,
        LineFeedsBeforeOrder -> Nullable<Integer>,
        LineFeedsAfterOrder -> Nullable<Integer>,
        DOMType -> Nullable<Smallint>,
        #[max_length = 256]
        CustomName -> Nullable<Varchar>,
        PmcRedirectOrderDeviceID -> Nullable<Integer>,
        #[max_length = 8]
        PmcOptionBits -> Varchar,
        Lang2ID -> Nullable<Integer>,
        Lang3ID -> Nullable<Integer>,
        SecondaryBackupID -> Nullable<Bigint>,
        CondimentSortType -> Integer,
        MenuItemPrintingType -> Integer,
    }
}

diesel::table! {
    order_type (OrdTypeID) {
        OrdTypeID -> Integer,
        HierStrucID -> Bigint,
        OrdTypeIndex -> Smallint,
        NameID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        OrderTypePostingTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    order_type_parameter (OrdTypParamID) {
        OrdTypParamID -> Integer,
        HierStrucID -> Bigint,
        #[max_length = 16]
        OptionBits -> Varchar,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        #[max_length = 64]
        TaxMask -> Varchar,
        OrdTypeIndex -> Integer,
        OtIsActive -> Bit,
        #[max_length = 32]
        OrderDeviceMask -> Varchar,
        KdsHighlightSchemeID -> Integer,
        OrderMethodObjNum -> Integer,
        OverrideQuoteTime -> Nullable<Integer>,
        ServiceLevelTime -> Nullable<Smallint>,
        TipPercent1 -> Smallint,
        TipPercent2 -> Smallint,
        TipPercent3 -> Smallint,
        TipAmount1 -> Nullable<Decimal>,
        TipAmount2 -> Nullable<Decimal>,
        TipAmount3 -> Nullable<Decimal>,
        OrdChannelObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    organization (OrganizationID) {
        OrganizationID -> Bigint,
        #[max_length = 32]
        OrganizationName -> Varchar,
        #[max_length = 16]
        ReportingWSLogin -> Nullable<Varchar>,
        #[max_length = 16]
        ReportingWSPassword -> Nullable<Varchar>,
        #[max_length = 8]
        OrganizationShortName -> Varchar,
        LangID -> Integer,
        #[max_length = 1]
        IsTemplate -> Nullable<Varchar>,
        #[max_length = 32]
        HMCUserName -> Nullable<Varchar>,
        HMCPassword -> Nullable<Longblob>,
        SuperOrganization -> Nullable<Bit>,
        REPORTWSPASSENC -> Nullable<Longblob>,
        EncryptionKeyID -> Nullable<Bigint>,
        IsDeleted -> Nullable<Bit>,
        #[max_length = 255]
        TenantID -> Nullable<Varchar>,
        IsSuperLite -> Bit,
        EnableCnCAPI -> Bit,
        IsGFInstance -> Bit,
        EnablePMIntegration -> Bit,
    }
}

diesel::table! {
    page (PageID) {
        PageID -> Integer,
        ObjectNumber -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        HierStrucID -> Nullable<Bigint>,
        NameID -> Nullable<Bigint>,
        PageTemplateID -> Nullable<Integer>,
        ChangeSetObjNum -> Nullable<Integer>,
        TemplateType -> Integer,
        #[max_length = 256]
        InternalTemplate -> Nullable<Varchar>,
        TemplateConfiguration -> Nullable<Longtext>,
        PageTemplateNum -> Nullable<Integer>,
    }
}

diesel::table! {
    page_assignment (PageAssignmentID) {
        PageAssignmentID -> Integer,
        HierStrucID -> Nullable<Bigint>,
        DefaultSignInPageObjNum -> Nullable<Integer>,
        DefaultTransactionPageObjNum -> Nullable<Integer>,
        DefaultTrainingPageObjNum -> Nullable<Integer>,
        DefaultInTransactionPageObjNum -> Nullable<Integer>,
        DefaultWelcomePageObjNum -> Nullable<Integer>,
        DefaultHubPageObjNum -> Nullable<Integer>,
        DefaultTrainingTransPageObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    page_assignment_condition (PageAssignmentCondID) {
        PageAssignmentCondID -> Integer,
        HierStrucID -> Bigint,
        StateType -> Nullable<Integer>,
        SortingIndex -> Integer,
        #[max_length = 256]
        ConditionField -> Nullable<Varchar>,
        #[max_length = 256]
        ConditionValue -> Nullable<Varchar>,
        PageNum -> Nullable<Integer>,
    }
}

diesel::table! {
    page_content_area (PageContentAreaID) {
        PageContentAreaID -> Integer,
        #[max_length = 200]
        DynamicAreaKey -> Nullable<Varchar>,
        ContentDataID -> Nullable<Bigint>,
        HierStrucID -> Bigint,
        PageID -> Nullable<Integer>,
        DescriptionID -> Nullable<Bigint>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        ChangeSetObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    page_template (PageTemplateID) {
        PageTemplateID -> Integer,
        ObjectNumber -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        HierStrucID -> Nullable<Bigint>,
        ContentDataID -> Nullable<Bigint>,
        NameID -> Nullable<Bigint>,
        IsDefault -> Bit,
        #[max_length = 8]
        OptionBits -> Varchar,
    }
}

diesel::table! {
    pay_at_table_conf_payment (PayAtTableConfPaymentID) {
        PayAtTableConfPaymentID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        #[max_length = 8]
        OptionBits -> Varchar,
        PaymentType -> Unsigned<Tinyint>,
        PaymentCommand -> Nullable<Longtext>,
    }
}

diesel::table! {
    pay_at_table_config (PayAtTableConfigID) {
        PayAtTableConfigID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        #[max_length = 8]
        OptionBits -> Varchar,
        TipPercent1 -> Smallint,
        TipPercent2 -> Smallint,
        TipPercent3 -> Smallint,
    }
}

diesel::table! {
    pay_rate (PayRateID) {
        PayRateID -> Bigint,
        HierStrucID -> Bigint,
        EmployeeID -> Bigint,
        RateIndex -> Integer,
        JobCodeID -> Nullable<Integer>,
        RegularPay -> Nullable<Decimal>,
        OvertimePay -> Nullable<Decimal>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        EffectiveFrom -> Nullable<Datetime>,
        EffectiveTo -> Nullable<Datetime>,
    }
}

diesel::table! {
    payment_tender (PaymentTenderID) {
        PaymentTenderID -> Integer,
        HierStrucID -> Bigint,
        NameID -> Bigint,
        TenderObjNum -> Nullable<Integer>,
        Arguments -> Nullable<Longtext>,
        SortPriority -> Nullable<Integer>,
        SluIndex -> Nullable<Integer>,
        IsPrimary -> Bit,
        ObjectNumber -> Nullable<Integer>,
    }
}

diesel::table! {
    period (PeriodID) {
        PeriodID -> Integer,
        HierStrucID -> Bigint,
        NameID -> Nullable<Bigint>,
        PeriodType -> Integer,
        ScheduleData -> Nullable<Longtext>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        LastPostingTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    period_instance (PeriodInstID) {
        PeriodInstID -> Bigint,
        HierStrucID -> Bigint,
        PeriodID -> Integer,
        StartTime -> Nullable<Datetime>,
        EndTime -> Nullable<Datetime>,
        BusinessDate -> Nullable<Datetime>,
        LocalStartTime -> Nullable<Datetime>,
        LocalEndTime -> Nullable<Datetime>,
        PrevPeriodInstID -> Nullable<Bigint>,
    }
}

diesel::table! {
    pms_total_detail (PmsTtlDtlID) {
        PmsTtlDtlID -> Bigint,
        CheckDetailID -> Bigint,
        PmsTtlIndex -> Smallint,
        Total -> Decimal,
    }
}

diesel::table! {
    pos_journal_log (posJournalLogId) {
        posJournalLogId -> Bigint,
        journalId -> Integer,
        revenueCenter -> Integer,
        checkNum -> Integer,
        transDateTime -> Datetime,
        chkOpenDateTime -> Datetime,
        #[sql_name = "type"]
        type_ -> Unsigned<Tinyint>,
        employee -> Bigint,
        #[max_length = 8]
        status -> Varchar,
        uws -> Integer,
        journalText -> Longtext,
        #[max_length = 40]
        guid -> Varchar,
    }
}

diesel::table! {
    poskeyboard (POSKeyboardID) {
        POSKeyboardID -> Integer,
        HierStrucID -> Bigint,
    }
}

diesel::table! {
    poskeyboard_assignment (POSKeyboardAssignmentID) {
        POSKeyboardAssignmentID -> Integer,
        POSAlphaNumKbdID -> Integer,
        HierStrucID -> Bigint,
        SortOrder -> Integer,
    }
}

diesel::table! {
    posting_parameter (PostParamID) {
        PostParamID -> Integer,
        HierStrucID -> Bigint,
        #[max_length = 16]
        OptionBits -> Varchar,
        AutoSvcChgGuests -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        CarryOverDays -> Nullable<Integer>,
    }
}

diesel::table! {
    print_class (PrintClassID) {
        PrintClassID -> Bigint,
        HierStrucID -> Bigint,
        NameID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        #[max_length = 8]
        OptionBits -> Varchar,
        #[max_length = 32]
        OrderDeviceOutput -> Varchar,
        RoutingGroupObjNum -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        #[max_length = 32]
        OrderDeviceDisabled -> Nullable<Varchar>,
    }
}

diesel::table! {
    printer (PrinterID) {
        PrinterID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        #[max_length = 256]
        ConnectionString -> Nullable<Varchar>,
        #[max_length = 256]
        ConfigurationString -> Nullable<Varchar>,
        ServiceID -> Nullable<Integer>,
        LineFeedsPerFormFeed -> Nullable<Smallint>,
        #[max_length = 8]
        OptionBits -> Varchar,
        #[max_length = 8]
        LocalOptionBits -> Varchar,
        KdsClientID -> Nullable<Bigint>,
        TrailingLinefeeds -> Smallint,
    }
}

diesel::table! {
    printer_group (PrinterGroupID) {
        PrinterGroupID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        #[max_length = 8]
        OptionBits -> Varchar,
    }
}

diesel::table! {
    printer_group_detail (PrinterGroupDetailID) {
        PrinterGroupDetailID -> Bigint,
        HierStrucID -> Bigint,
        PrinterGroupID -> Bigint,
        PrinterID -> Integer,
    }
}

diesel::table! {
    production_item (ProductionItemID) {
        ProductionItemID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        KdsHighlightSchemeObjNum -> Nullable<Integer>,
        ShelfLife -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    property (PropertyID) {
        PropertyID -> Integer,
        TestProperty -> Bit,
        #[max_length = 64]
        PropertyGuid -> Nullable<Varchar>,
        TZIndex -> Nullable<Integer>,
        PropertyComment -> Nullable<Longtext>,
        LocaleInfoID -> Nullable<Integer>,
        SimphonyPlatform -> Integer,
        ConsumerFacingName -> Nullable<Bigint>,
        #[max_length = 20]
        PhoneNumber -> Nullable<Varchar>,
        #[max_length = 250]
        Address1 -> Nullable<Varchar>,
        #[max_length = 250]
        Address2 -> Nullable<Varchar>,
        #[max_length = 40]
        City -> Nullable<Varchar>,
        #[max_length = 40]
        StateOrRegion -> Nullable<Varchar>,
        #[max_length = 50]
        Country -> Nullable<Varchar>,
        #[max_length = 15]
        Latitude -> Nullable<Varchar>,
        #[max_length = 15]
        Longitude -> Nullable<Varchar>,
        #[max_length = 20]
        PostalCode -> Nullable<Varchar>,
        #[max_length = 250]
        Address3 -> Nullable<Varchar>,
        #[max_length = 6]
        CountryCode -> Nullable<Varchar>,
        #[max_length = 6]
        StateOrRegionCode -> Nullable<Varchar>,
        #[max_length = 4]
        MerchantCategoryCode -> Nullable<Varchar>,
        PendingDelete -> Nullable<Integer>,
        MccLocked -> Nullable<Bit>,
        #[max_length = 2]
        PhoneCountryCode -> Nullable<Varchar>,
    }
}

diesel::table! {
    qr_pay_config (QrPayConfigId) {
        QrPayConfigId -> Bigint,
        HierStrucId -> Bigint,
        #[max_length = 4]
        QrPayOrgShortCode -> Nullable<Varchar>,
        #[max_length = 200]
        QrPayPaymentBaseUrl -> Nullable<Varchar>,
        #[max_length = 200]
        OrdsUrl -> Nullable<Varchar>,
        #[max_length = 200]
        IdGuid -> Nullable<Varchar>,
        #[max_length = 50]
        AdyenStoreId -> Nullable<Varchar>,
        #[max_length = 50]
        MerchantAccountCode -> Nullable<Varchar>,
        QrPayEnabledEmc -> Nullable<Bit>,
        QrPayEnabledPaymentApp -> Nullable<Bit>,
        QrPayEmcDateLastModified -> Nullable<Datetime>,
        QrPayLastUpdateFromPaymentApp -> Nullable<Datetime>,
        OrganizationId -> Nullable<Bigint>,
    }
}

diesel::table! {
    quoting_rule_link (QuotingRuleLinkID) {
        QuotingRuleLinkID -> Bigint,
        HierStrucID -> Bigint,
        QuotingRuleID -> Bigint,
        OrderMethodObjNum -> Integer,
    }
}

diesel::table! {
    recipe_name (RecipeNameID) {
        RecipeNameID -> Integer,
        HierStrucID -> Bigint,
        RecipeLinkID -> Integer,
        RecipeIndex -> Smallint,
        NameID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    report_group (RptGrpID) {
        RptGrpID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        RptGrpType -> Smallint,
        #[max_length = 16]
        OptionBits -> Varchar,
        LastPostingTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    report_parameter (RptParamID) {
        RptParamID -> Integer,
        HierStrucID -> Bigint,
        #[max_length = 32]
        OptionBits -> Varchar,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    required_condiment (ReqdCndmntID) {
        ReqdCndmntID -> Integer,
        HierStrucID -> Bigint,
        MenuItemClassID -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        SluIndex -> Nullable<Integer>,
        Threshold1 -> Nullable<Smallint>,
        Threshold1Level -> Nullable<Smallint>,
        Threshold2 -> Nullable<Smallint>,
        Threshold2Level -> Nullable<Smallint>,
        Passthrough -> Nullable<Bit>,
        MinimumValue -> Smallint,
        MaximumValue -> Smallint,
    }
}

diesel::table! {
    revenue_center (RevCtrID) {
        RevCtrID -> Integer,
        ObjectNumber -> Nullable<Integer>,
        IsActive -> Bit,
        IsLdsActive -> Bit,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        RevenueCenterPostingTime -> Nullable<Datetime>,
        #[max_length = 32]
        RvcGroupMask -> Varchar,
        IsTransLocked -> Nullable<Datetime>,
        ConsumerFacingName -> Nullable<Bigint>,
        #[max_length = 20]
        PhoneNumber -> Nullable<Varchar>,
        #[max_length = 250]
        Address1 -> Nullable<Varchar>,
        #[max_length = 250]
        Address2 -> Nullable<Varchar>,
        #[max_length = 250]
        Address3 -> Nullable<Varchar>,
        #[max_length = 40]
        City -> Nullable<Varchar>,
        #[max_length = 40]
        StateOrRegion -> Nullable<Varchar>,
        #[max_length = 50]
        Country -> Nullable<Varchar>,
        #[max_length = 15]
        Latitude -> Nullable<Varchar>,
        #[max_length = 15]
        Longitude -> Nullable<Varchar>,
        #[max_length = 20]
        PostalCode -> Nullable<Varchar>,
        #[max_length = 64]
        Floor -> Nullable<Varchar>,
        #[max_length = 6]
        CountryCode -> Nullable<Varchar>,
        #[max_length = 6]
        StateOrRegionCode -> Nullable<Varchar>,
        UsePropertyAddress -> Bit,
        #[max_length = 4]
        MerchantCategoryCode -> Nullable<Varchar>,
        MccLocked -> Nullable<Bit>,
        #[max_length = 2]
        PhoneCountryCode -> Nullable<Varchar>,
    }
}

diesel::table! {
    revenue_center_group (RvcGroupID) {
        RvcGroupID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        RvcGroupComment -> Nullable<Longtext>,
    }
}

diesel::table! {
    revenue_center_group_rvc (RvcGroupRvcID) {
        RvcGroupRvcID -> Integer,
        HierStrucID -> Bigint,
        RvcGroupID -> Integer,
        RevCtrID -> Integer,
    }
}

diesel::table! {
    role (RoleID) {
        RoleID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        RoleType -> Integer,
        RoleComment -> Nullable<Longtext>,
        LastPostingTime -> Nullable<Datetime>,
        RoleLevel -> Nullable<Integer>,
    }
}

diesel::table! {
    role_employee (RoleEmployeeID) {
        RoleEmployeeID -> Bigint,
        RoleID -> Bigint,
        EmployeeID -> Bigint,
        HierStrucID -> Bigint,
    }
}

diesel::table! {
    role_privilege (RolePrivilegeID) {
        RolePrivilegeID -> Bigint,
        RoleID -> Bigint,
        PrivilegeType -> Smallint,
        PrivilegeNumber -> Smallint,
        PrivilegeAccess -> Smallint,
    }
}

diesel::table! {
    role_visibility (RoleVisibilityID) {
        RoleVisibilityID -> Bigint,
        RoleID -> Bigint,
        HierStrucID -> Bigint,
        VisibleForChildren -> Bit,
    }
}

diesel::table! {
    routing_group (RoutingGroupID) {
        RoutingGroupID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Nullable<Bigint>,
    }
}

diesel::table! {
    sales_itemizer (SlsItmzrID) {
        SlsItmzrID -> Integer,
        HierStrucID -> Bigint,
        SlsItmzrIndex -> Smallint,
        NameID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    screen_lookup (SluID) {
        SluID -> Integer,
        HierStrucID -> Bigint,
        SluType -> Integer,
        DeviceType -> Integer,
        SluIndex -> Integer,
        NameID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        LastPostingTime -> Nullable<Datetime>,
        PosRef -> Nullable<Bigint>,
    }
}

diesel::table! {
    sec_integrity_pub_keys (IntegrityKeyID) {
        IntegrityKeyID -> Integer,
        KeyData -> Longblob,
        HierStrucID -> Bigint,
        LastUpdatedOn -> Nullable<Datetime>,
    }
}

diesel::table! {
    secure_detail (SecureDetailID) {
        SecureDetailID -> Bigint,
        CheckDetailID -> Bigint,
        #[max_length = 256]
        PlainData -> Nullable<Varchar>,
        SecureData -> Longblob,
        EncryptionKeyID -> Nullable<Integer>,
    }
}

diesel::table! {
    serial_number (SerNumID) {
        SerNumID -> Integer,
        HierStrucID -> Bigint,
        SerialIndex -> Integer,
        MinVal -> Bigint,
        MaxVal -> Bigint,
        CurVal -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    service (ServiceID) {
        ServiceID -> Integer,
        HierStrucID -> Bigint,
        ServiceHostID -> Nullable<Integer>,
        #[max_length = 16]
        Protocol -> Nullable<Varchar>,
        Port -> Nullable<Integer>,
        #[max_length = 256]
        URL -> Nullable<Varchar>,
        ServiceType -> Smallint,
        #[max_length = 50]
        Description -> Nullable<Varchar>,
        SecAuthCurrentKeyID -> Nullable<Bigint>,
        SecAuthOldKeyID -> Nullable<Bigint>,
        ClearTotalsTime -> Nullable<Datetime>,
        DbUpdateFrequency -> Nullable<Integer>,
        IsPendingDbReload -> Bit,
        SecurePort -> Integer,
    }
}

diesel::table! {
    service_charge (SvcChgID) {
        SvcChgID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        #[max_length = 48]
        OptionBits -> Nullable<Varchar>,
        #[max_length = 8]
        PrintOptionBits -> Nullable<Varchar>,
        Nlu -> Nullable<Integer>,
        TransDfltMain -> Bit,
        MainMenuLvlIndex -> Nullable<Integer>,
        TransDfltSub -> Bit,
        SubMenuLvlIndex -> Nullable<Integer>,
        Percentage -> Nullable<Decimal>,
        Amount -> Nullable<Decimal>,
        TipsPaidTendMedNumber -> Nullable<Integer>,
        PercentTipsPaid -> Nullable<Decimal>,
        PrivilegeGrp -> Nullable<Integer>,
        IconNumber -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        ServiceChargePostingTime -> Nullable<Datetime>,
        Halo -> Nullable<Decimal>,
        TaxClassObjNum -> Nullable<Integer>,
        SluIndex -> Nullable<Integer>,
        HhtSluIndex -> Nullable<Integer>,
        ChangeSetObjNum -> Nullable<Integer>,
        SluGroupNum -> Nullable<Integer>,
        EffectivityID -> Nullable<Bigint>,
        RptGrpObjNum -> Nullable<Integer>,
        PrintClassObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    service_charge_detail (SvcChgDtlID) {
        SvcChgDtlID -> Bigint,
        CheckDetailID -> Bigint,
        SvcChgID -> Integer,
        #[max_length = 48]
        OptionBits -> Varchar,
        Percentage -> Nullable<Decimal>,
        EmployeeID -> Nullable<Bigint>,
        #[max_length = 40]
        PrintOptionBits -> Varchar,
        PrivilegeLevel -> Nullable<Integer>,
        VoidReasonID -> Nullable<Integer>,
        TillDetailID -> Nullable<Integer>,
        #[max_length = 64]
        TaxRates -> Nullable<Varchar>,
        TillSessionID -> Nullable<Integer>,
    }
}

diesel::table! {
    service_charge_group (ServiceChargeGroupID) {
        ServiceChargeGroupID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Integer,
        NameID -> Bigint,
    }
}

diesel::table! {
    service_charge_group_detail (ServiceChargeGroupDetailID) {
        ServiceChargeGroupDetailID -> Integer,
        HierStrucID -> Bigint,
        ServiceChargeGroupID -> Integer,
        ServiceChargeObjNum -> Integer,
    }
}

diesel::table! {
    service_charge_itemizer (SvcChgItmzrID) {
        SvcChgItmzrID -> Integer,
        HierStrucID -> Bigint,
        SvcChgItmzrIndex -> Smallint,
        NameID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    service_charge_main_menu_level (SvcChgMainMenuLvlID) {
        SvcChgMainMenuLvlID -> Integer,
        HierStrucID -> Bigint,
        SvcChgID -> Integer,
        MenuLvlIndex -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    service_charge_sub_menu_level (SvcChgSubMenuLvlID) {
        SvcChgSubMenuLvlID -> Integer,
        HierStrucID -> Bigint,
        SvcChgID -> Integer,
        MenuLvlIndex -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    service_chg_itmzr_service_chg (SvcChgItmzrSvcChgID) {
        SvcChgItmzrSvcChgID -> Integer,
        HierStrucID -> Bigint,
        SvcChgID -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        SvcChgItmzrIndex -> Nullable<Smallint>,
    }
}

diesel::table! {
    service_host (ServiceHostID) {
        ServiceHostID -> Integer,
        HierStrucID -> Bigint,
        NameID -> Bigint,
        ServiceType -> Integer,
        IsConnectionless -> Nullable<Integer>,
        #[max_length = 256]
        DefaultGateway -> Nullable<Varchar>,
        #[max_length = 256]
        NetMask -> Nullable<Varchar>,
        #[max_length = 50]
        HostName -> Nullable<Varchar>,
        #[max_length = 8]
        OptionBits -> Varchar,
        SimphonyPlatform -> Integer,
        #[max_length = 50]
        Version -> Nullable<Varchar>,
        SecRecAuthKeyId -> Nullable<Bigint>,
    }
}

diesel::table! {
    serving_period (ServingPeriodID) {
        ServingPeriodID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        PeriodID -> Integer,
        TrkGrpID -> Nullable<Integer>,
        TableCount -> Nullable<Integer>,
        #[max_length = 8]
        OptionBits -> Varchar,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        #[max_length = 64]
        TaxMask -> Varchar,
        MainLevelIndex -> Nullable<Integer>,
        SubLevelIndex -> Nullable<Integer>,
    }
}

diesel::table! {
    serving_period_touchscreen (SrvPerTouchscrnID) {
        SrvPerTouchscrnID -> Integer,
        HierStrucID -> Bigint,
        ServingPeriodID -> Integer,
        DeviceType -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        TouchscreenObjNum -> Nullable<Integer>,
        OrderingTsObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    shift_status (ShiftType, TypeID) {
        ShiftType -> Unsigned<Tinyint>,
        TypeID -> Bigint,
        ShiftNumber -> Nullable<Integer>,
        RevCtrID -> Nullable<Integer>,
        JobID -> Nullable<Integer>,
        LastIncUTC -> Nullable<Datetime>,
        PrevIncUTC -> Nullable<Datetime>,
    }
}

diesel::table! {
    status_event (StatusEventId) {
        StatusEventId -> Bigint,
        EventType -> Integer,
        #[max_length = 64]
        EventName -> Varchar,
        #[max_length = 128]
        Vendor -> Nullable<Varchar>,
        #[max_length = 40]
        CheckGuid -> Nullable<Varchar>,
        EmployeeID -> Nullable<Bigint>,
        BinVal -> Nullable<Longblob>,
        LongVal -> Nullable<Bigint>,
        #[max_length = 512]
        StringVal -> Nullable<Varchar>,
        #[max_length = 32]
        Flags -> Nullable<Varchar>,
        UtcTimeStamp -> Datetime,
    }
}

diesel::table! {
    stored_value_card (StoredValueCardID) {
        StoredValueCardID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        #[max_length = 16]
        OptionBits -> Varchar,
        InterfaceID -> Nullable<Integer>,
        IssueType -> Nullable<Smallint>,
        IssueItem -> Nullable<Bigint>,
        IssuePointsType -> Nullable<Smallint>,
        IssuePointsItem -> Nullable<Bigint>,
        IssueReceipts -> Integer,
        ActivateType -> Nullable<Smallint>,
        ActivateItem -> Nullable<Bigint>,
        ActivateReceipts -> Integer,
        ReloadType -> Nullable<Smallint>,
        ReloadItem -> Nullable<Bigint>,
        ReloadReceipts -> Integer,
        RedeemItem -> Nullable<Bigint>,
        RedeemPointsItem -> Nullable<Bigint>,
        RedeemReceipts -> Integer,
        RedeemAuthReceipts -> Integer,
        CashOutItem -> Nullable<Bigint>,
        CouponType -> Nullable<Smallint>,
        CouponItem -> Nullable<Bigint>,
        OtherType -> Nullable<Smallint>,
        IssueOtherItem -> Nullable<Bigint>,
        ActivateOtherItem -> Nullable<Bigint>,
        ReloadOtherItem -> Nullable<Bigint>,
        OtherReceipts -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    stored_value_card_descriptor (StoredValueCardDescID) {
        StoredValueCardDescID -> Bigint,
        StoredValueCardID -> Integer,
        DescType -> Integer,
        LineNumber -> Integer,
        StringNumberID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    stored_value_config (StoredValueConfigID) {
        StoredValueConfigID -> Bigint,
        HierStrucID -> Nullable<Bigint>,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        #[max_length = 64]
        OptionBits -> Varchar,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    string_table (StringID) {
        StringID -> Bigint,
        StringNumberID -> Bigint,
        LangID -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        HierStrucID -> Nullable<Bigint>,
        PosRef -> Nullable<Bigint>,
        #[max_length = 128]
        StringText -> Nullable<Varchar>,
    }
}

diesel::table! {
    sub_menu_level (SubMenuLvlID) {
        SubMenuLvlID -> Integer,
        HierStrucID -> Bigint,
        MenuLvlIndex -> Smallint,
        PrefixID -> Bigint,
        NameID -> Bigint,
        SuffixID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        LastPostingTime -> Nullable<Datetime>,
        EntryType -> Nullable<Smallint>,
        #[max_length = 8]
        OptionBits -> Varchar,
    }
}

diesel::table! {
    sync_anchors (Anchor) {
        #[max_length = 128]
        FileName -> Nullable<Varchar>,
        HierStrucID -> Nullable<Bigint>,
        #[max_length = 8]
        Anchor -> Binary,
    }
}

diesel::table! {
    system_template (SystemTemplateID) {
        SystemTemplateID -> Integer,
        Priority -> Integer,
        #[max_length = 100]
        SystemTemplateType -> Nullable<Varchar>,
        #[max_length = 200]
        Description -> Nullable<Varchar>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        HierStrucID -> Nullable<Bigint>,
        ContentDataID -> Nullable<Bigint>,
    }
}

diesel::table! {
    tag_group (TagGroupId) {
        TagGroupId -> Bigint,
        HierStrucID -> Bigint,
        #[max_length = 256]
        TagGroupKey -> Varchar,
        SpecialUsage -> Smallint,
        ObjectNumber -> Nullable<Integer>,
    }
}

diesel::table! {
    tag_item (TagItemID) {
        TagItemID -> Bigint,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Bigint>,
        #[max_length = 256]
        TagName -> Varchar,
        IsDeleted -> Bit,
        TagGroupId -> Nullable<Bigint>,
    }
}

diesel::table! {
    taiwan_gui (TaiwanGuiID) {
        TaiwanGuiID -> Integer,
        HierStrucID -> Bigint,
        #[max_length = 2]
        Prefix -> Nullable<Varchar>,
        Threshold -> Smallint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    tax (TaxID) {
        TaxID -> Integer,
        HierStrucID -> Bigint,
        TaxIndex -> Smallint,
        NameID -> Bigint,
        TaxType -> Smallint,
        Percentage -> Nullable<Decimal>,
        Amount -> Nullable<Decimal>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        TaxPostingTime -> Nullable<Datetime>,
        ChangeSetObjNum -> Nullable<Integer>,
        ReportGroup -> Nullable<Integer>,
        #[max_length = 16]
        TaxCodes -> Nullable<Varchar>,
    }
}

diesel::table! {
    tax_breakpoint (TaxBrkPtID) {
        TaxBrkPtID -> Integer,
        HierStrucID -> Bigint,
        TaxID -> Integer,
        BrkPtIndex -> Integer,
        Breakpoint -> Integer,
        RepeatTaxBrkPtID -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        LastPostingTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    tax_class (TaxClassID) {
        TaxClassID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        LastPostingTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    tax_class_tax (TaxClassTaxID) {
        TaxClassTaxID -> Integer,
        HierStrucID -> Bigint,
        TaxClassID -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        TaxIndex -> Nullable<Smallint>,
    }
}

diesel::table! {
    tax_parameter (TaxParamID) {
        TaxParamID -> Integer,
        HierStrucID -> Bigint,
        #[max_length = 16]
        OptionBits -> Varchar,
        #[max_length = 32]
        ForeignOptionBits -> Varchar,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        #[max_length = 64]
        VatPrintOptionBits -> Varchar,
    }
}

diesel::table! {
    team_def (TeamID) {
        TeamID -> Integer,
        HierStrucID -> Bigint,
        TeamNumber -> Integer,
        #[max_length = 40]
        TeamName -> Nullable<Varchar>,
        ObjectNumber -> Nullable<Integer>,
    }
}

diesel::table! {
    team_detail (TeamDtlID) {
        TeamDtlID -> Bigint,
        CheckDetailID -> Bigint,
        TeamEmpIndex -> Smallint,
        EmployeeID -> Nullable<Bigint>,
        RoleCode -> Nullable<Integer>,
    }
}

diesel::table! {
    team_member_def (TeamMemberDefID) {
        TeamID -> Integer,
        EmployeeID -> Bigint,
        TipPercentage -> Decimal,
        TeamMemberDefID -> Integer,
        ObjectNumber -> Nullable<Integer>,
    }
}

diesel::table! {
    tender_media (TendMedID) {
        TendMedID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Bigint,
        TendMedType -> Smallint,
        #[max_length = 8]
        Preamble -> Nullable<Varchar>,
        #[max_length = 128]
        OptionBits -> Varchar,
        #[max_length = 8]
        PrintOptionBits -> Nullable<Varchar>,
        Nlu -> Nullable<Integer>,
        TransDfltMain -> Bit,
        MainMenuLvlIndex -> Nullable<Integer>,
        TransDfltSub -> Bit,
        SubMenuLvlIndex -> Nullable<Integer>,
        ChargedTipSvcChgNumber -> Nullable<Integer>,
        Halo -> Nullable<Integer>,
        PrivilegeGrp -> Nullable<Integer>,
        InterfaceIndex -> Nullable<Integer>,
        EstimatedTip -> Nullable<Decimal>,
        SecondaryFloorPcnt -> Nullable<Decimal>,
        BaseFloor -> Nullable<Decimal>,
        SecondaryFloor -> Nullable<Decimal>,
        InitialAuth -> Nullable<Decimal>,
        DefaultTipPcnt -> Nullable<Smallint>,
        IconNumber -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        QuickServiceLimit -> Nullable<Decimal>,
        TenderMediaPostingTime -> Nullable<Datetime>,
        OfflineEstimatedTip -> Nullable<Decimal>,
        MaxUnauthAmount -> Nullable<Decimal>,
        OfflineLimit -> Nullable<Decimal>,
        AltVoucherTrailerLimit -> Nullable<Decimal>,
        TrServicesServNameID -> Nullable<Integer>,
        RptGrpObjNum -> Nullable<Integer>,
        SluIndex -> Nullable<Integer>,
        HhtSluIndex -> Nullable<Integer>,
        ChangeSetObjNum -> Nullable<Integer>,
        #[max_length = 200]
        ExtensionApplicationKey -> Nullable<Varchar>,
        SluGroupNum -> Nullable<Integer>,
        SRMPayType -> Nullable<Integer>,
        InsignificantDigits -> Nullable<Smallint>,
        PrintClassObjNum -> Nullable<Integer>,
        AMTTHRESHOLDPRINTCLASSOBJNUM -> Nullable<Integer>,
        LIKEITEMPRINTCLASSOBJNUM -> Nullable<Integer>,
    }
}

diesel::table! {
    tender_media_detail (TendMedDtlID) {
        TendMedDtlID -> Bigint,
        CheckDetailID -> Bigint,
        TendMedID -> Integer,
        EmployeeID -> Nullable<Bigint>,
        CashierID -> Nullable<Integer>,
        ChargeTip -> Decimal,
        #[max_length = 128]
        OptionBits -> Varchar,
        #[max_length = 40]
        PrintOptionBits -> Varchar,
        CurrencyID -> Nullable<Integer>,
        PrivilegeLevel -> Nullable<Integer>,
        InterfaceIndex -> Nullable<Integer>,
        #[max_length = 40]
        SignatureGuid -> Nullable<Varchar>,
        Deposit -> Nullable<Decimal>,
        ServingPeriodID -> Nullable<Bigint>,
        TillDetailID -> Nullable<Integer>,
        #[max_length = 64]
        TaxExemptRates -> Nullable<Varchar>,
        CurrencyAmount -> Nullable<Decimal>,
        TillSessionID -> Nullable<Integer>,
        ChargeTipSvcChgNum -> Nullable<Integer>,
    }
}

diesel::table! {
    tender_media_main_menu_level (TendMedMainMenuLvlID) {
        TendMedMainMenuLvlID -> Integer,
        HierStrucID -> Bigint,
        TendMedID -> Integer,
        MenuLvlIndex -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    tender_media_preamble (TenderMediaPreambleID) {
        TenderMediaPreambleID -> Integer,
        HierStrucID -> Bigint,
        TendMedID -> Integer,
        #[max_length = 16]
        StartPreamble -> Nullable<Varchar>,
        #[max_length = 16]
        EndPreamble -> Nullable<Varchar>,
        PreambleLength -> Nullable<Integer>,
        AutoOnly -> Nullable<Bit>,
    }
}

diesel::table! {
    tender_media_sub_menu_level (TendMedSubMenuLvlID) {
        TendMedSubMenuLvlID -> Integer,
        HierStrucID -> Bigint,
        TendMedID -> Integer,
        MenuLvlIndex -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    tender_media_tax_exempt (TendMedTaxExmptID) {
        TendMedTaxExmptID -> Integer,
        HierStrucID -> Bigint,
        TendMedID -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        TaxIndex -> Nullable<Smallint>,
    }
}

diesel::table! {
    text_detail (TextDtlID) {
        TextDtlID -> Bigint,
        CheckDetailID -> Bigint,
        #[max_length = 88]
        Text2 -> Nullable<Varchar>,
        LangID -> Integer,
    }
}

diesel::table! {
    time_period (TimePeriodID) {
        TimePeriodID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        PeriodID -> Integer,
        NoOverhead -> Bit,
        TrkGrpID -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    time_zone (TzIndex) {
        TzIndex -> Bigint,
        #[max_length = 100]
        TimeZone -> Varchar,
        #[max_length = 100]
        DisplayName -> Nullable<Varchar>,
        MinuteDiff -> Smallint,
    }
}

diesel::table! {
    timecard (TimecardID) {
        TimecardID -> Bigint,
        HierStrucID -> Bigint,
        EmployeeID -> Bigint,
        #[max_length = 8]
        Status -> Varchar,
        ActiveRate -> Integer,
        BreakClockOut -> Nullable<Datetime>,
        PrintTime -> Nullable<Datetime>,
        PrintVersion -> Integer,
        LineFind -> Integer,
        Page -> Integer,
        ClockStatus -> Integer,
        JobCodeID -> Nullable<Integer>,
    }
}

diesel::table! {
    timeclock_parameter (TmClkParmID) {
        TmClkParmID -> Integer,
        HierStrucID -> Bigint,
        TimeClockEnabled -> Bit,
        #[max_length = 24]
        OptionBits -> Varchar,
        EarlyIn -> Nullable<Smallint>,
        LateIn -> Nullable<Smallint>,
        EarlyOut -> Nullable<Smallint>,
        LateOut -> Nullable<Smallint>,
        MinorUnpaidMin -> Nullable<Smallint>,
        MinorUnpaidMax -> Nullable<Smallint>,
        MinorPaidMin -> Nullable<Smallint>,
        MinorPaidMax -> Nullable<Smallint>,
        UnpaidMin -> Nullable<Smallint>,
        UnpaidMax -> Nullable<Smallint>,
        PaidMin -> Nullable<Smallint>,
        PaidMax -> Nullable<Smallint>,
        StartOfDay -> Nullable<Smallint>,
        StartOfWeek -> Nullable<Unsigned<Tinyint>>,
        LinesPerCard -> Nullable<Smallint>,
        LineFeeds -> Nullable<Smallint>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    tms_parameter (TmsParamID) {
        TmsParamID -> Integer,
        HierStrucID -> Bigint,
        InterfaceID -> Nullable<Integer>,
        #[max_length = 8]
        OptionBits -> Varchar,
        OperatorID -> Nullable<Bigint>,
        WorkstationID -> Nullable<Integer>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    totals (TransID, RevCtrID) {
        TransID -> Bigint,
        PostingTime -> Datetime,
        PostingWeekday -> Unsigned<Tinyint>,
        PostingMinute -> Smallint,
        TransactionTime -> Datetime,
        TransactionWeekday -> Unsigned<Tinyint>,
        TransactionMinute -> Smallint,
        TtlType -> Integer,
        RevCtrID -> Integer,
        OrdTypeID -> Nullable<Integer>,
        DiningTableID -> Nullable<Integer>,
        EmployeeID -> Bigint,
        CashierID -> Nullable<Integer>,
        JobCodeID -> Nullable<Integer>,
        WorkstationID -> Nullable<Integer>,
        ServingPeriodID -> Nullable<Integer>,
        CheckID -> Nullable<Bigint>,
        Data1 -> Nullable<Bigint>,
        Data2 -> Nullable<Bigint>,
        Data3 -> Nullable<Bigint>,
        Data4 -> Nullable<Bigint>,
        Data5 -> Nullable<Bigint>,
        Data6 -> Nullable<Bigint>,
        Data7 -> Nullable<Bigint>,
        Flags -> Integer,
        ItemCount -> Integer,
        Amount1 -> Nullable<Decimal>,
        Amount2 -> Nullable<Decimal>,
        Count1 -> Nullable<Smallint>,
        Count2 -> Nullable<Smallint>,
        RoundNumber -> Nullable<Smallint>,
        Amount3 -> Nullable<Decimal>,
        Amount4 -> Nullable<Decimal>,
        EmployeeShiftNumber -> Nullable<Integer>,
        CashierShiftNumber -> Nullable<Integer>,
        OrdChannelID -> Nullable<Bigint>,
    }
}

diesel::table! {
    totals_compact (TransID, RevCtrID) {
        TransID -> Bigint,
        PostingTime -> Datetime,
        PostingWeekday -> Unsigned<Tinyint>,
        PostingMinute -> Smallint,
        TransactionTime -> Datetime,
        TransactionWeekday -> Unsigned<Tinyint>,
        TransactionMinute -> Smallint,
        TtlType -> Integer,
        RevCtrID -> Integer,
        OrdTypeID -> Nullable<Integer>,
        DiningTableID -> Nullable<Integer>,
        EmployeeID -> Bigint,
        CashierID -> Nullable<Integer>,
        JobCodeID -> Nullable<Integer>,
        WorkstationID -> Nullable<Integer>,
        ServingPeriodID -> Nullable<Integer>,
        CheckID -> Nullable<Bigint>,
        Data1 -> Nullable<Bigint>,
        Data2 -> Nullable<Bigint>,
        Data3 -> Nullable<Bigint>,
        Data4 -> Nullable<Bigint>,
        Data5 -> Nullable<Bigint>,
        Data6 -> Nullable<Bigint>,
        Data7 -> Nullable<Bigint>,
        Flags -> Integer,
        ItemCount -> Integer,
        Amount1 -> Nullable<Decimal>,
        Amount2 -> Nullable<Decimal>,
        Count1 -> Nullable<Smallint>,
        Count2 -> Nullable<Smallint>,
        RoundNumber -> Nullable<Smallint>,
        Amount3 -> Nullable<Decimal>,
        Amount4 -> Nullable<Decimal>,
        TotalsData -> Nullable<Longblob>,
        EmployeeShiftNumber -> Nullable<Integer>,
        CashierShiftNumber -> Nullable<Integer>,
        OrdChannelID -> Nullable<Bigint>,
    }
}

diesel::table! {
    totals_compact_processed (LastProcessedID) {
        LastProcessedID -> Bigint,
    }
}

diesel::table! {
    user_experience_assignment (UserExpAssignmentID) {
        UserExpAssignmentID -> Bigint,
        HierStrucID -> Bigint,
        DefaultUserExpObjectNumber -> Nullable<Integer>,
        DefaultKdsUserExpObjectNumber -> Integer,
    }
}

diesel::table! {
    v_hier_alias (HierStrucID, AliasHierStrucID) {
        HierStrucID -> Bigint,
        HierUnitID -> Nullable<Integer>,
        ChangeTime -> Nullable<Datetime>,
        AliasHierStrucID -> Bigint,
    }
}

diesel::table! {
    v_hier_ancestors (HierStrucID, AncestorID) {
        HierStrucID -> Bigint,
        AncestorID -> Bigint,
        ChangeTime -> Nullable<Datetime>,
        lvl -> Nullable<Integer>,
    }
}

diesel::table! {
    v_hier_definition_locations (HierStrucID, DefLocHierStrucID) {
        HierStrucID -> Bigint,
        DefLocHierStrucID -> Bigint,
        lvl -> Nullable<Integer>,
    }
}

diesel::table! {
    v_hier_testators (TestatorHierStrucID, SystemHierStrucID) {
        HierUnitID -> Nullable<Integer>,
        PropertyID -> Nullable<Integer>,
        RevCtrID -> Nullable<Integer>,
        SystemHierStrucID -> Bigint,
        TestatorHierStrucID -> Bigint,
        AncestorLevel -> Nullable<Integer>,
    }
}

diesel::table! {
    v_hierarchy (HierStrucID) {
        HierStrucID -> Bigint,
        Parent1 -> Nullable<Bigint>,
        Parent2 -> Nullable<Bigint>,
        Parent3 -> Nullable<Bigint>,
        PropHierStrucID -> Nullable<Bigint>,
        PropertyID -> Nullable<Integer>,
        RevCtrID -> Nullable<Integer>,
        ObjectNumber -> Nullable<Integer>,
        NameID -> Nullable<Bigint>,
        #[max_length = 2000]
        HierName -> Nullable<Varchar>,
    }
}

diesel::table! {
    void_reason (VoidReasonID) {
        VoidReasonID -> Integer,
        HierStrucID -> Bigint,
        VoidReasonIndex -> Smallint,
        NameID -> Bigint,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        VoidReasonPostingTime -> Nullable<Datetime>,
    }
}

diesel::table! {
    workstation (WorkstationID) {
        WorkstationID -> Integer,
        HierStrucID -> Bigint,
        ObjectNumber -> Nullable<Integer>,
        DeviceID -> Nullable<Bigint>,
        NameID -> Nullable<Bigint>,
        WkstaType -> Smallint,
        WkstaSubType -> Nullable<Smallint>,
        MaxCheckDetail -> Nullable<Integer>,
        NextTransNum -> Integer,
        #[max_length = 35]
        ThaiTaxRdNum -> Nullable<Varchar>,
        CashierNumber -> Nullable<Integer>,
        #[max_length = 25]
        NameInternal -> Nullable<Varchar>,
        #[max_length = 12]
        PhysicalID -> Nullable<Varchar>,
        ErrorWorkstationNumber -> Nullable<Integer>,
        #[max_length = 16]
        HhtOptionBits -> Varchar,
        ExtendedCharSet -> Bit,
        KeyboardNumber -> Nullable<Integer>,
        #[max_length = 256]
        KeyboardFile -> Nullable<Varchar>,
        CashDrawers -> Nullable<Integer>,
        CashDrwrEmpl1ID -> Nullable<Bigint>,
        CashDrwrEmpl2ID -> Nullable<Bigint>,
        #[max_length = 40]
        UwsOptionBits -> Varchar,
        #[max_length = 50]
        PcwsAddress -> Nullable<Varchar>,
        SarChkNumMin -> Integer,
        SarChkNumMax -> Integer,
        PosapiEmployeeID -> Nullable<Bigint>,
        LocationID -> Nullable<Bigint>,
        LangID -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        WorkstationPostingTime -> Nullable<Datetime>,
        DbUpdateFrequency -> Nullable<Integer>,
        #[max_length = 72]
        OptionBits -> Varchar,
        WorkstationThemeID -> Nullable<Integer>,
        WSPubKey -> Nullable<Longblob>,
        WSPrivKey -> Nullable<Longblob>,
        Configuration -> Nullable<Longtext>,
        InactivityTimeout -> Nullable<Integer>,
        InactivityDialogTimeout -> Nullable<Integer>,
        AutoOnlineTransLimit -> Nullable<Integer>,
        CashDrwrBeepTimeout -> Nullable<Integer>,
        CashDrwrNotifyTimeout -> Nullable<Integer>,
        LogVerbosity -> Nullable<Integer>,
        LineFeedsBeforeFormFeed -> Nullable<Integer>,
        ResolutionRows -> Nullable<Integer>,
        ResolutionColumns -> Nullable<Integer>,
        CharacterSet -> Nullable<Integer>,
        DisplayMode -> Nullable<Integer>,
        MacroLoopCount -> Nullable<Integer>,
        ReportTimeout -> Nullable<Integer>,
        Platform -> Nullable<Integer>,
        SecAuthKeyID -> Nullable<Bigint>,
        ServiceID -> Nullable<Integer>,
        DrawerOneTillID -> Nullable<Integer>,
        DrawerTwoTillID -> Nullable<Integer>,
        #[max_length = 50]
        PcwsGateway -> Nullable<Varchar>,
        #[max_length = 50]
        PcwsNetmask -> Nullable<Varchar>,
        OrdTypeIndex -> Nullable<Integer>,
        SecAuthOldKeyID -> Nullable<Bigint>,
        BarcodeFormatSetObjNum -> Nullable<Integer>,
        WorkstationClassNum -> Nullable<Integer>,
        #[max_length = 32]
        LogModules -> Nullable<Varchar>,
        #[max_length = 256]
        LogUrl -> Nullable<Varchar>,
        ArchiveLogs -> Bit,
        PostMsgStats -> Bit,
        PostMsgStatsFreq -> Nullable<Integer>,
        MaxMsgStatsBakFileSize -> Nullable<Integer>,
        LogMinDiskFreeSpace -> Nullable<Integer>,
        OverrideDefaultRevCtrID -> Nullable<Integer>,
        #[max_length = 40]
        DrawerOneTillGuid -> Nullable<Varchar>,
        #[max_length = 40]
        DrawerTwoTillGuid -> Nullable<Varchar>,
        IsLocked -> Nullable<Datetime>,
        IsTransLocked -> Nullable<Datetime>,
        LocationFromTop -> Nullable<Integer>,
        LocationFromLeft -> Nullable<Integer>,
        #[max_length = 50]
        AdyenSerialNumber -> Nullable<Varchar>,
        #[max_length = 100]
        AdyenStoreName -> Nullable<Varchar>,
        #[max_length = 100]
        AppVersionName -> Nullable<Varchar>,
        #[max_length = 100]
        AndroidAppID -> Nullable<Varchar>,
        OrdChannelObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    workstation_device (WorkstationDeviceID) {
        WorkstationDeviceID -> Integer,
        HierStrucID -> Bigint,
        NameID -> Nullable<Bigint>,
        WorkstationID -> Integer,
        DeviceIndex -> Smallint,
        DeviceType -> Integer,
        DeviceSource -> Integer,
        DeviceConnection -> Integer,
        #[max_length = 256]
        ProgID -> Varchar,
        Configuration -> Longtext,
    }
}

diesel::table! {
    workstation_notification (NotificationType, ReceiveWksID, RecID) {
        NotificationType -> Smallint,
        ReceiveWksID -> Integer,
        SendWksID -> Nullable<Integer>,
        RecID -> Bigint,
        Date1 -> Nullable<Datetime>,
        Date2 -> Nullable<Datetime>,
        SentTime -> Datetime,
        AcceptTime -> Nullable<Datetime>,
        #[max_length = 40]
        RecLogicalID -> Nullable<Varchar>,
    }
}

diesel::table! {
    workstation_order_device (WkstaOrdDvcID) {
        WkstaOrdDvcID -> Integer,
        HierStrucID -> Bigint,
        WorkstationID -> Integer,
        OrdDvcIndex -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
    }
}

diesel::table! {
    workstation_parameter (WkstaParamID) {
        WkstaParamID -> Integer,
        HierStrucID -> Bigint,
        MaxCheckDetail -> Integer,
        LinesPerPage -> Nullable<Integer>,
        #[max_length = 256]
        KeyboardFile -> Nullable<Varchar>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        DbUpdateFrequency -> Nullable<Integer>,
        AutoOnlineTransLimit -> Nullable<Integer>,
        ReplayMode -> Nullable<Smallint>,
        #[max_length = 64]
        DBUserName -> Nullable<Varchar>,
        #[max_length = 64]
        DbPassword -> Nullable<Varchar>,
        OnDemandReplayFrequencyCheck -> Nullable<Integer>,
        StatisticsPeriodicUpdateFreq -> Nullable<Integer>,
        StatisticsInitialUpdateDelay -> Nullable<Integer>,
        #[max_length = 64]
        SAPassword -> Nullable<Varchar>,
    }
}

diesel::table! {
    workstation_printer (WkstaPrtID) {
        WkstaPrtID -> Integer,
        HierStrucID -> Bigint,
        WorkstationID -> Integer,
        PrinterType -> Integer,
        DeviceID -> Nullable<Bigint>,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        PrinterID -> Nullable<Integer>,
        PrinterGroupID -> Nullable<Bigint>,
    }
}

diesel::table! {
    workstation_rev_ctr_touchscrn (WkstaRvcTouchscrnID) {
        WkstaRvcTouchscrnID -> Integer,
        HierStrucID -> Bigint,
        WorkstationID -> Integer,
        WkstaRvcTscrnIndex -> Smallint,
        RevCtrID -> Integer,
        IsVisible -> Bit,
        IsDeleted -> Bit,
        TouchscreenObjNum -> Nullable<Integer>,
    }
}

diesel::table! {
    workstation_routing_group (WkstnRoutingGroupID) {
        WkstnRoutingGroupID -> Integer,
        WorkstationID -> Integer,
        HierStrucID -> Bigint,
        RoutingGroupObjNum -> Integer,
        #[max_length = 32]
        OrderDeviceBitMask -> Varchar,
    }
}

diesel::table! {
    ws_heu_alg_config (ConfigID) {
        ConfigID -> Integer,
        HierStrucID -> Integer,
        WorkstationID -> Nullable<Integer>,
        #[max_length = 50]
        ConfigName -> Varchar,
        ConfigValue -> Integer,
    }
}

diesel::allow_tables_to_appear_in_same_query!(
    active_kds_theme,
    add_transfer_revenue_center,
    allergen,
    allergen_class,
    alphanumeric_keyboard,
    application_text,
    assembly_config,
    auto_menu_level,
    autofire_parameter,
    barcode,
    barcode_format,
    barcode_format_set,
    browser_allowed_url,
    canadian_gst,
    canadian_pst,
    cashier,
    change_set,
    change_set_timetable,
    changeset_eff_status,
    channel_mgmt_post_data,
    charge_tender_parameter,
    check_detail,
    check_detail_order_device,
    check_detail_tax,
    check_number_parameter,
    checks,
    clear_totals,
    cm_account,
    cm_cash_count_threshold,
    cm_cash_count_thrshld_cls,
    cm_cash_pull_threshold,
    cm_cash_pull_threshold_level,
    cm_change_order,
    cm_change_order_items,
    cm_count_detail,
    cm_count_detail_classes,
    cm_count_detail_items,
    cm_countsheet,
    cm_countsheet_group,
    cm_countsheet_group_detail,
    cm_countsheet_page,
    cm_employee_till_assignment,
    cm_item,
    cm_item_behavior,
    cm_item_pos_items,
    cm_item_units,
    cm_par_level,
    cm_par_level_item,
    cm_parameter,
    cm_receptacle,
    cm_receptacle_detail,
    cm_receptacle_template,
    cm_template_class,
    cm_template_class_exclude,
    cm_template_par_level,
    cm_till_session,
    cm_transaction_detail,
    cm_vendor,
    combo,
    combo_group,
    combo_group_detail,
    combo_group_detail_price,
    combo_group_price,
    combo_group_substitutions,
    combo_side,
    component,
    component_condiment,
    condiment_set,
    condiment_set_condiment,
    confirm_parameter,
    consent_definition,
    consent_detail,
    content,
    content_data,
    content_group,
    content_group_data,
    content_type,
    credit_driver_instance,
    credit_parameter,
    currency,
    currency_conversion,
    currency_instance,
    currency_parameter,
    custom_report,
    data_dist_local_revs,
    data_dist_revs,
    db_schema,
    deposit_info_detail,
    descriptors,
    dining_course,
    dining_course_alerts,
    dining_table,
    dining_table_class,
    dining_table_states,
    dining_table_status,
    dining_table_status_def,
    dining_table_status_def_set,
    discount,
    discount_alloc_detail,
    discount_award_group,
    discount_detail,
    discount_itemizer,
    discount_itemizer_discount,
    discount_main_menu_level,
    discount_sub_menu_level,
    discount_trigger_group,
    distribution_group,
    dscnt_itmzr_dscnt_dtl,
    dto_order_method_setting,
    dto_parameter,
    dto_quoting_rule,
    effectivity,
    employee,
    employee_class,
    employee_class_operator,
    employee_class_touchscreen,
    employee_instance,
    enabled_by_order_channel,
    event_schedule,
    event_schedule_instance,
    extension_application,
    extension_application_content,
    extension_data_property,
    extension_data_value,
    family_group,
    fcr_customer_data,
    fcr_invoice_control,
    fcr_invoice_data,
    fcr_ttl_data,
    financial_calendar,
    financial_calendar_hist,
    financial_calendar_hist_off,
    format_parameter,
    giftcard_provider,
    global_parameter,
    gms_acceptance_limit,
    gms_check_alert,
    gms_occupancy_limit,
    gms_parameter,
    gms_reason,
    gms_reservation_period,
    gms_seating_limit,
    gms_section,
    gms_section_layout,
    gms_section_layout_tbl,
    gms_section_template,
    gms_section_template_tbl,
    gms_service_alert,
    gms_suggestion_factor,
    gms_target_turn_time,
    gms_tbl_mergeable_assign,
    gms_tbl_pref_assign,
    gms_tbl_pref_attr_def,
    gms_tbl_pref_cat_def,
    gms_tbl_pref_request,
    gms_tbl_request_detail,
    gms_wait_quote_time,
    group_event_area,
    group_event_def,
    group_event_def_dtl,
    group_event_status,
    group_event_sub_type,
    group_event_type,
    guest_information_detail,
    help_screen,
    hierarchy,
    hierarchy_parameter,
    hierarchy_structure,
    hierarchy_unit,
    interface,
    interface_link,
    job_code,
    kds_bumpbar_button,
    kds_bumpbar_style,
    kds_client,
    kds_client_production_item,
    kds_controller,
    kds_detail,
    kds_detail_suborder,
    kds_highlight_scheme,
    kds_layout_element,
    kds_layout_style,
    kds_linked_order_devices,
    kds_order_device_parameters,
    kds_order_distribution_state,
    kds_rvchier,
    kds_theme,
    kds_theme_kds_client,
    kds_theme_order_device,
    kds_theme_order_type,
    kds_theme_period,
    kds_theme_ws_order_device,
    kds_toolbar_button,
    kds_toolbar_style,
    key_db_info,
    labor_data,
    labor_punches,
    language_information,
    language_information_text,
    language_property,
    locale_information,
    loyalty_config,
    loyalty_provider,
    macro_,
    macro_step,
    main_menu_level,
    major_group,
    menu_item_class,
    menu_item_component,
    menu_item_default_condiment,
    menu_item_definition,
    menu_item_definition_tag,
    menu_item_detail,
    menu_item_dtl_menu_level,
    menu_item_group,
    menu_item_group_detail,
    menu_item_master,
    menu_item_master_eff,
    menu_item_master_group,
    menu_item_master_tag,
    menu_item_menu_level_entry,
    menu_item_nutrient_set,
    menu_item_price,
    menu_item_production_item,
    menu_level,
    menu_level_entry,
    menuitmcondimntprptme,
    mrequest_data,
    mrequest_response,
    mrequests,
    mrequests_bak,
    mrequests_bak_send,
    multimedia,
    multimedia_data,
    netvupoint_config,
    number_lookup,
    nutrient_set,
    nutrient_set_nutrient,
    nutrition,
    oidc_conf_client_info,
    open_client_access_detail,
    open_client_user_info,
    operator,
    operator_touchscreen,
    order_channel,
    order_channel_config,
    order_device,
    order_type,
    order_type_parameter,
    organization,
    page,
    page_assignment,
    page_assignment_condition,
    page_content_area,
    page_template,
    pay_at_table_conf_payment,
    pay_at_table_config,
    pay_rate,
    payment_tender,
    period,
    period_instance,
    pms_total_detail,
    pos_journal_log,
    poskeyboard,
    poskeyboard_assignment,
    posting_parameter,
    print_class,
    printer,
    printer_group,
    printer_group_detail,
    production_item,
    property,
    qr_pay_config,
    quoting_rule_link,
    recipe_name,
    report_group,
    report_parameter,
    required_condiment,
    revenue_center,
    revenue_center_group,
    revenue_center_group_rvc,
    role,
    role_employee,
    role_privilege,
    role_visibility,
    routing_group,
    sales_itemizer,
    screen_lookup,
    sec_integrity_pub_keys,
    secure_detail,
    serial_number,
    service,
    service_charge,
    service_charge_detail,
    service_charge_group,
    service_charge_group_detail,
    service_charge_itemizer,
    service_charge_main_menu_level,
    service_charge_sub_menu_level,
    service_chg_itmzr_service_chg,
    service_host,
    serving_period,
    serving_period_touchscreen,
    shift_status,
    status_event,
    stored_value_card,
    stored_value_card_descriptor,
    stored_value_config,
    string_table,
    sub_menu_level,
    sync_anchors,
    system_template,
    tag_group,
    tag_item,
    taiwan_gui,
    tax,
    tax_breakpoint,
    tax_class,
    tax_class_tax,
    tax_parameter,
    team_def,
    team_detail,
    team_member_def,
    tender_media,
    tender_media_detail,
    tender_media_main_menu_level,
    tender_media_preamble,
    tender_media_sub_menu_level,
    tender_media_tax_exempt,
    text_detail,
    time_period,
    time_zone,
    timecard,
    timeclock_parameter,
    tms_parameter,
    totals,
    totals_compact,
    totals_compact_processed,
    user_experience_assignment,
    v_hier_alias,
    v_hier_ancestors,
    v_hier_definition_locations,
    v_hier_testators,
    v_hierarchy,
    void_reason,
    workstation,
    workstation_device,
    workstation_notification,
    workstation_order_device,
    workstation_parameter,
    workstation_printer,
    workstation_rev_ctr_touchscrn,
    workstation_routing_group,
    ws_heu_alg_config,
);
