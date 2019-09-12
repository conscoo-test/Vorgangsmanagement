codeunit 5266500 "LBT Process Mgt."
{
    trigger OnRun()
    begin
        
    end;
    
    procedure CreateSalesProcess(var SalesHdr: Record "Sales Header")
    var
        ProcessSetup: Record "LBT Process Setup";
        Process: Record "LBT Process";
    begin
        ProcessSetup.TestField("Process Nos.");
        if not process.get(SalesHdr."LBT Process No.") then begin
            Process.init();
            process."No." := '';
            Process."Record ID" := SalesHdr.RecordId();
            Process.Description := SalesHdr."Posting Description";
            process.insert(true);
        end; 
    end; 
    procedure CreatePurchProcess(var PurchHdr: Record "Purchase Header")
    var
        ProcessSetup: Record "LBT Process Setup";
        Process: Record "LBT Process";
    begin
        ProcessSetup.TestField("Process Nos.");
        if not process.get(PurchHdr."LBT Process No.") then begin
            Process.init();
            process."No." := '';
            Process."Record ID" := PurchHdr.RecordId();
            Process.Description := PurchHdr."Posting Description";
            process.insert(true);
        end; 
    end;
    ///NAVIGATE:Eventsubscriber
    //General Journal Line
    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal line", 'OnAfterCopyGenJnlLineFromPurchHeader', '', true,true)]
    local procedure extSalesGenJnlLine(PurchaseHeader: Record "Purchase Header";var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."LBT Process No." := PurchaseHeader."LBT Process No.";
    end;
    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', true,true)]
    local procedure extPurchGenJnlLine(SalesHeader: Record "Sales Header";var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."LBT Process No." := SalesHeader."LBT Process No.";
    end;
    
    //G/LEntry
    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]
    local procedure extGLEntry(var GenJournalLine: Record "Gen. Journal Line";var GLEntry: Record "G/L Entry")
    begin
        GLEntry."LBT Process No." := GenJournalLine."LBT Process No.";    
    end;
    //Cust ledg Entry
    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure extCustledgEntry(GenJournalLine: Record "Gen. Journal Line";var CustLedgerEntry: Record "Cust. Ledger Entry")
    begin
        CustLedgerEntry."LBT Process No." := GenJournalLine."LBT Process No.";    
    end;
    //Vendor Ledger Entry
    [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", 'OnAfterCopyVendLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure extVendLedgEntry(GenJournalLine: Record "Gen. Journal Line";var VendorLedgerEntry: Record "Vendor Ledger Entry")
    begin
        VendorLedgerEntry."LBT Process No." := GenJournalLine."LBT Process No.";
    end;
    //Employee ledger Entry
    [EventSubscriber(ObjectType::Table, Database::"Employee Ledger Entry", 'OnAfterCopyEmployeeLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure extEmployeeledgEntry(GenJournalLine: Record "Gen. Journal Line";var EmployeeLedgerEntry: Record "Employee Ledger Entry")
    begin
        EmployeeLedgerEntry."LBT Process No." := GenJournalLine."LBT Process No.";
    end;
    [EventSubscriber(ObjectType::Codeunit, codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertItemLedgEntry', '', true, true)]
    //ItemLedgerEntry
    local procedure extItemLedgEntry(ItemJournalLine: Record "Item Journal Line";var ItemLedgerEntry: Record "Item Ledger Entry")
    begin
        ItemLedgerEntry."LBT Process No." := ItemJournalLine."LBT Process No.";
    end;
    [EventSubscriber(ObjectType::Table, Database::"Res. Journal Line", 'OnAfterCopyResJnlLineFromSalesLine', '', true, true)]
    local procedure extResJnlLine(var SalesLine: Record "Sales Line";var ResJnlLine: Record "Res. Journal Line")
    begin
        ResJnlLine."LBT Process No." := SalesLine."LBT Process No.";
    end;
    [EventSubscriber(ObjectType::Table, Database::"Res. Ledger Entry", 'OnAfterCopyFromResJnlLine', '', true, true)]
    local procedure extResEntry(ResJournalLine: Record "Res. Journal Line";var ResLedgerEntry: Record "Res. Ledger Entry")
    begin
        ResLedgerEntry."LBT Process No." := ResJournalLine."LBT Process No.";
    end;
    ///JOB
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Transfer Line", 'OnAfterFromGenJnlLineToJnlLine', '', true, true)]
    local procedure extJobjnlLinefromGenjnlLine(GenJnlLine: Record "Gen. Journal Line";var JobJnlLine: Record "Job Journal Line")
    begin
        JobJnlLine."LBT Process No." := GenJnlLine."LBT Process No.";
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Transfer Line", 'OnAfterFromJnlLineToLedgEntry', '', true, true)]
    local procedure extJobjnlLineToEntry(JobJournalLine: Record "Job Journal Line";var JobLedgerEntry: Record "Job Ledger Entry")
    begin
        JobLedgerEntry."LBT Process No." := JobJournalLine."LBT Process No.";
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Transfer Line", 'OnAfterFromPurchaseLineToJnlLine', '', true, true)]
    local procedure extJobPurchLineToJnlLine(PurchLine: Record "Purchase Line";var JobJnlLine: Record "Job Journal Line")
    begin
        JobJnlLine."LBT Process No." := PurchLine."LBT Process No.";
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Transfer Line", 'OnAfterFromPlanningSalesLineToJnlLine', '', true, true)]
    local procedure extJobSalesLineTojnlLine(SalesLine: Record "Sales Line";var JobJnlLine: Record "Job Journal Line")
    begin
        JobJnlLine."LBT Process No." := JobJnlLine."LBT Process No.";
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Transfer Line", 'OnAfterFromJobLedgEntryToPlanningLine', '', true, true)]
    local procedure extJobJobLedgEntryToJobPlanningLine(JobLedgEntry: Record "Job Ledger Entry";var JobPlanningLine: Record "Job Planning Line")
    begin
        JobPlanningLine."lbt process No." := JobLedgEntry."LBT Process No.";
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Transfer Line", 'OnAfterFromPlanningLineToJnlLine', '', true, true)]
    local procedure extJobPlanningLineTojnlLine(JobPlanningLine: Record "Job Planning Line";var JobJournalLine: Record "Job Journal Line")
    begin
        JobJournalLine."LBT Process No." := JobPlanningLine."LBT Process No.";
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Jnl.-Post Line", 'OnBeforeJobLedgEntryInsert', '', true, true)]
    local procedure onBeforeInsertJobLedgerEntry(JobJournalLine: Record "Job Journal Line";var JobLedgerEntry: Record "Job Ledger Entry")
    begin
        JobLedgerEntry."LBT Process No." := JobJournalLine."LBT Process No.";    
    end;
    ///CU 80
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeUpdateSalesLineBeforePost', '', true, true)]
    local procedure extSalesLineBeforePost(var SalesHeader: Record "Sales Header";var SalesLine: Record "Sales Line")
    begin
        if salesline."LBT Process No." = '' then
            if salesheader."LBT Process No." <> '' then
                SalesLine."LBT Process No." := Salesheader."LBT Process No.";
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post",'OnPostItemJnlLineOnAfterCopyDocumentFields', '', true,true)]
    local procedure extSalesOnPostItemJnlLIne(SalesLine: Record "Sales Line";var ItemJournalLine: Record "Item Journal Line")
    begin
        ItemJournalLine."LBT Process No." := SalesLine."LBT Process No.";
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterFillInvoicePostBuffer', '', true, true)]
    local procedure extSalesFillInvBuffer(SalesLine: Record "Sales Line";var InvoicePostBuffer: Record "Invoice Post. Buffer")
    begin
        InvoicePostBuffer."LBT Process No." := SalesLine."LBT Process No.";
    end;
    
    ///CU90
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post" , 'OnBeforeUpdatePurchLineBeforePost', '', true, true)]
    local procedure extPurchLineBeforePost(var PurchaseLine: Record "Purchase Line";var PurchaseHeader: Record "Purchase Header")
    begin
        if purchaseline."LBT Process No." = '' then
            if purchaseheader."LBT Process No." <> '' then
                purchaseLine."LBT Process No." := purchaseHeader."LBT Process No.";
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post",'OnPostItemJnlLineOnAfterCopyDocumentFields', '', true,true)]
    local procedure extPurchOnPostItemJnlLIne(PurchaseLine: Record "Purchase Line";var ItemJournalLine: Record "Item Journal Line")
    begin
        ItemJournalLine."LBT Process No." := PurchaseLine."LBT Process No.";
    end;
    
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterFillInvoicePostBuffer', '', true, true)]
    local procedure extPurchFillInvBuffer(PurchLine: Record "Purchase Line";var InvoicePostBuffer: Record "Invoice Post. Buffer")
    begin
        InvoicePostBuffer."LBT Process No." := PurchLine."LBT Process No.";
    end;
    ///InvoicePostBuffer
    [EventSubscriber(ObjectType::table, database::"Invoice Post. Buffer", 'OnAfterInvPostBufferPrepareSales', '', true, true)]
    local procedure extSalesPrepareInvBuffer(var SalesLine: Record "Sales Line";var InvoicePostBuffer: Record "Invoice Post. Buffer")
    begin
        InvoicePostBuffer."LBT Process No." := SalesLine."LBT Process No.";
    end;
        [EventSubscriber(ObjectType::table, database::"Invoice Post. Buffer", 'OnAfterInvPostBufferPreparePurchase', '', true, true)]
    local procedure extPurchPrepareInvBuffer(var PurchaseLine: Record "Purchase Line";var InvoicePostBuffer: Record "Invoice Post. Buffer")
    begin
        InvoicePostBuffer."LBT Process No." := purchaseLine."LBT Process No.";
    end;
    [EventSubscriber(ObjectType::Table, Database::"Detailed CV Ledg. Entry Buffer", 'OnAfterCopyFromGenJnlLine', '', true, true)]
    local procedure extCVLedgEntry(GenJnlLine: Record "Gen. Journal Line";var DtldCVLedgEntryBuffer: Record "Detailed CV Ledg. Entry Buffer")
    begin
        DtldCVLedgEntryBuffer."LBT Process No." := GenJnlLine."LBT Process No.";
    end;
    ///InteractionLogentry
    [EventSubscriber(ObjectType::Table, Database::"Interaction Log Entry", 'OnAfterCopyFromSegment', '', true, true)]
    local procedure extOnAfterCopyFromSeg(SegmentLine: Record "Segment Line";var InteractionLogEntry: Record "Interaction Log Entry")
    begin
        InteractionLogEntry."LBT Process No." := SegmentLine."LBT Process No.";
    end;

    [EventSubscriber(ObjectType::Table, Database::"VAT Entry", 'OnAfterCopyFromGenJnlLine', '', true, true)]
    local procedure extOnAfterCopyFromVATEntry(GenJournalLine: Record "Gen. Journal Line";var VATEntry: Record "VAT Entry")
    begin
        VATEntry."LBT Process No." := GenJournalLine."LBT Process No.";
    end;
    
    ///NAVIGATE: Show event
    [EventSubscriber(ObjectType::Page, Page::Navigate, 'OnBeforeNavigateShowRecords', '', True, True)]
    local procedure OnBeforeNavigateShowRecords(TableID: Integer;var TempDocumentEntry: Record "Document Entry";var IsHandled: Boolean)
    var
        PageMgt: Codeunit "Page Management";
        RecRef:recordref;
        fref:FieldRef;
        vari:Variant;
    begin
        if isHandled then
            exit;
        if TempDocumentEntry."LBT Process No." = '' then
            exit;
        
        recref.open(TempDocumentEntry."Table ID");
        fref := recref.Field(5266500);
        fref.setfilter(TempDocumentEntry."LBT Process No.");
        if TempDocumentEntry."Table ID" in [database::"Sales Header",database::"Purchase Header"] then begin
            fref := recref.field(1);
            fref.setrange(TempDocumentEntry."Document Type");
            recref.findfirst();
        end;
        //pagemgt.PageRun(recref);

        if recref.count() = 1 then begin
            vari := RecRef;
            page.run(PageMgt.GetDefaultCardPageID(RecRef.Number()),vari);
        end else 
            pagemgt.PageRun(recref);
        
        isHandled := true;

    end;

}