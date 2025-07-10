pageextension 5266549 "lbt ProcessNavigate" extends Navigate//344
{
    layout
    {
        addlast(Document)
        {
            field("lbt Process No."; lbtProcessNoFilter)
            {
                ApplicationArea = All;
                Caption = 'Process No.', Comment = 'DEU="Prozessnr."';
                TableRelation = "lbt Process";
                ToolTip = 'Here you select the process number.', Comment = 'DEU="Hier wählen Sie die Vorgangsnummer aus."';

                trigger OnValidate()
                begin
                    "lbtProcessNo" := lbtProcessNoFilter;
                    Rec.SetFilter("lbt Process No.", lbtProcessNoFilter);

                    //ClearTrackingInfo()

                    //ClearContactInfo()
                    ContactType := ContactType::" ";
                    ContactNo := '';
                    if Rec."lbt Process No." <> '' then
                        FindProcess();

                    //ClearSourceInfo()

                    //FilterSelectionChanged()
                end;
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        addlast(Process)
        {
            action("lbt Navigate Process No.")
            {
                ApplicationArea = All;
                Caption = 'Navigate Process No.', Comment = 'DEU="Navigate Prozessnr."';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Display entries corresponding to the process number.', Comment = 'DEU="Zugehörige Posten der Vorgangsnummer anzeigen."';
                Visible = false;

                trigger OnAction()
                begin
                    if "lbtProcessNo" <> '' then
                        FindProcess();
                end;
            }
        }
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    begin
        if "lbtProcessNo" <> '' then
            FindProcess();
    end;

    protected var
        [Obsolete('Use "lbtProcessNo" instead.', '2025-07-10')]
        ProcessNo: code[50];
        [Obsolete('Use "lbtProcessNoFilter" instead.', '2025-07-10')]
        ProcessNoFilter: Text;

        "lbtProcessNo": Code[50];
        lbtProcessNoFilter: Text;

    var
        ArchivedLbl: Label 'Archived %1', Comment = 'DEU="Archivierte(r) %1"';
    //NAVIGATE:Collect Records
    procedure FindProcess()
    var
        window: Dialog;
        Text002Msg: Label 'Search';
    begin
        window.Open(Text002Msg);
        Rec.Reset();
        Rec.DeleteAll();
        Rec."Entry No." := 0;
        //foundRecords := False;
        FindUnpostedPurchDocs();
        findPostedPurchDocs();
        FindUnpostedSalesDocs();
        findPostedSalesDocs();
        FindArchivSalesDocs();
        lbtFindArchivPurchDocs();
        FindEntries();
        onAfterInsertDocEntries(Rec, "lbtProcessNo");
        Rec.ModifyAll("lbt Process No.", "lbtProcessNo");
        //DocExists := FINDFIRST;

        //UpdateFormAfterFindRecords;
        //FoundRecords := DocExists;

        //IF NOT FoundRecords THEN BEGIN
        //SetSource(0D,'','',0,'');
        //MESSAGE(LBText025);
        //END;
        window.Close();
    end;

    procedure lbtOnAfterSetSource()
    begin
        Rec.SetRange("lbt Process No.", "lbtProcessNo");
        lbtProcessNoFilter := Rec.GetFilter("lbt Process No.")
    end;

    [Obsolete('Use lbtSetProcessNo instead.', '2025-07-10')]
    procedure SetProcessNo(p_ProcessNo: Code[50])
    begin
        ProcessNo := p_ProcessNo;
        lbtSetProcessNo(p_ProcessNo);
    end;

    procedure lbtSetProcessNo(p_ProcessNo: Code[50])
    begin
        "lbtProcessNo" := p_ProcessNo;
    end;

    local procedure lbtFindArchivPurchDocs()
    var
        PurchHdrArchiv: Record "Purchase Header Archive";
        PurchHdrArchiv2: Record "Purchase Header Archive";

        i: Integer;
        DocTableName: Text[1024];
    begin
        if not PurchHdrArchiv.ReadPermission() then
            exit;
        PurchHdrArchiv.SetCurrentKey("Document Type", "lbt Process No.");
        PurchHdrArchiv.SetFilter("lbt Process No.", "lbtProcessNo");
        for i := 1 to 6 do begin
            case i of
                1:
                    PurchHdrArchiv2."Document Type" := PurchHdrArchiv2."Document Type"::Quote;
                2:
                    PurchHdrArchiv2."Document Type" := PurchHdrArchiv2."Document Type"::Order;
                3:
                    PurchHdrArchiv2."Document Type" := PurchHdrArchiv2."Document Type"::Invoice;
                4:
                    PurchHdrArchiv2."Document Type" := PurchHdrArchiv2."Document Type"::"Credit Memo";
                5:
                    PurchHdrArchiv2."Document Type" := PurchHdrArchiv2."Document Type"::"Return Order";
                6:
                    PurchHdrArchiv2."Document Type" := PurchHdrArchiv2."Document Type"::"Blanket Order";
            end;
            DocTableName := StrSubstNo(ArchivedLbl, PurchHdrArchiv2."Document Type");
            PurchHdrArchiv.SetRange("Document Type", PurchHdrArchiv2."Document Type");
            //InsertIntoDocEntry(rec, database::"Purchase Header Archive", PurchHdrArchiv2."Document Type", DocTableName, PurchHdrArchiv.count());
            Rec.InsertIntoDocEntry(Database::"Purchase Header Archive", PurchHdrArchiv2."Document Type", DocTableName, PurchHdrArchiv.Count());
        end;
    end;

    local procedure FindArchivSalesDocs()
    var
        SalesHdrArchiv: Record "Sales Header Archive";
        SalesHdrArchiv2: Record "Sales Header Archive";
        i: Integer;
        DocTableName: Text[1024];
    begin
        if not SalesHdrArchiv.ReadPermission() then
            exit;
        SalesHdrArchiv.SetCurrentKey("Document Type", "lbt Process No.");
        SalesHdrArchiv.SetFilter("lbt Process No.", "lbtProcessNo");
        for i := 1 to 6 do begin
            case i of
                1:
                    SalesHdrArchiv2."Document Type" := SalesHdrArchiv2."Document Type"::Quote;
                2:
                    SalesHdrArchiv2."Document Type" := SalesHdrArchiv2."Document Type"::Order;
                3:
                    SalesHdrArchiv2."Document Type" := SalesHdrArchiv2."Document Type"::Invoice;
                4:
                    SalesHdrArchiv2."Document Type" := SalesHdrArchiv2."Document Type"::"Credit Memo";
                5:
                    SalesHdrArchiv2."Document Type" := SalesHdrArchiv2."Document Type"::"Return Order";
                6:
                    SalesHdrArchiv2."Document Type" := SalesHdrArchiv2."Document Type"::"Blanket Order";
            end;
            SalesHdrArchiv.SetRange("Document Type", SalesHdrArchiv2."Document Type");
            DocTableName := StrSubstNo(ArchivedLbl, SalesHdrArchiv2."Document Type");
            //InsertIntoDocEntry(rec, database::"Sales Header Archive", SalesHdrArchiv2."Document Type", DocTableName, SalesHdrArchiv.count());
            Rec.InsertIntoDocEntry(Database::"Sales Header Archive", SalesHdrArchiv2."Document Type", DocTableName, SalesHdrArchiv.Count());
        end;
    end;

    local procedure FindEntries()
    var
        CustLedgEntry: Record "Cust. Ledger Entry";
        EmployeeLedgEntry: Record "Employee Ledger Entry";
        GLEntry: Record "G/L Entry";
        InteractLogEntry: Record "Interaction Log Entry";
        ItemLedgEntry: Record "Item Ledger Entry";
        JobLedgEntry: Record "Job Ledger Entry";
        ResLedgEntry: Record "Res. Ledger Entry";
        VATEntry: Record "VAT Entry";
        VendLedgEntry: Record "Vendor Ledger Entry";

    begin
        if GLEntry.ReadPermission() then begin
            GLEntry.Reset();
            GLEntry.SetCurrentKey("lbt Process No.");
            GLEntry.SetFilter("lbt Process No.", "lbtProcessNo");
            //IF PostingDateFilter <> '' THEN
            //GLEntry.SETFILTER("Posting Date",PostingDateFilter);
            //InsertIntoDocEntry(Rec, DATABASE::"G/L Entry", 0, CopyStr(GLEntry.TABLECAPTION(), 1, 1024), GLEntry.COUNT());
            Rec.InsertIntoDocEntry(Database::"G/L Entry", enum::"Document Entry Document Type"::" ", CopyStr(GLEntry.TableCaption(), 1, 1024), GLEntry.Count());
        end;

        if VendLedgEntry.ReadPermission() then begin
            VendLedgEntry.Reset();
            VendLedgEntry.SetCurrentKey("lbt Process No.");
            VendLedgEntry.SetFilter("lbt Process No.", "lbtProcessNo");
            //IF PostingDateFilter <> '' THEN
            //VendLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
            //InsertIntoDocEntry(Rec, DATABASE::"Vendor Ledger Entry", 0, CopyStr(VendLedgEntry.TABLECAPTION(), 1, 1024), VendLedgEntry.COUNT());
            Rec.InsertIntoDocEntry(Database::"Vendor Ledger Entry", enum::"Document Entry Document Type"::" ", CopyStr(VendLedgEntry.TableCaption(), 1, 1024), VendLedgEntry.Count());
        end;

        if CustLedgEntry.ReadPermission() then begin
            CustLedgEntry.Reset();
            CustLedgEntry.SetCurrentKey("lbt Process No.");
            CustLedgEntry.SetFilter("lbt Process No.", "lbtProcessNo");
            //IF PostingDateFilter <> '' THEN
            //CustLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
            //InsertIntoDocEntry(Rec, DATABASE::"Cust. Ledger Entry", 0, CopyStr(CustLedgEntry.TABLECAPTION(), 1, 1024), CustLedgEntry.COUNT());
            Rec.InsertIntoDocEntry(Database::"Cust. Ledger Entry", enum::"Document Entry Document Type"::" ", CopyStr(CustLedgEntry.TableCaption(), 1, 1024), CustLedgEntry.Count());
        end;
        if EmployeeLedgEntry.ReadPermission() then begin
            EmployeeLedgEntry.Reset();
            EmployeeLedgEntry.SetCurrentKey("lbt Process No.");
            EmployeeLedgEntry.SetFilter("lbt Process No.", "lbtProcessNo");
            //IF PostingDateFilter <> '' THEN
            //CustLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
            //InsertIntoDocEntry(Rec, DATABASE::"employee Ledger Entry", 0, CopyStr(employeeLedgEntry.TABLECAPTION(), 1, 1024), employeeLedgEntry.COUNT());
            Rec.InsertIntoDocEntry(Database::"Employee Ledger Entry", enum::"Document Entry Document Type"::" ", CopyStr(EmployeeLedgEntry.TableCaption(), 1, 1024), EmployeeLedgEntry.Count());
        end;
        if ItemLedgEntry.ReadPermission() then begin
            ItemLedgEntry.Reset();
            ItemLedgEntry.SetCurrentKey("lbt Process No.");
            ItemLedgEntry.SetFilter("lbt Process No.", "lbtProcessNo");
            //IF PostingDateFilter <> '' THEN
            //CustLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
            //InsertIntoDocEntry(Rec, DATABASE::"item Ledger Entry", 0, CopyStr(itemLedgEntry.TABLECAPTION(), 1, 1024), itemLedgEntry.COUNT());
            Rec.InsertIntoDocEntry(Database::"Item Ledger Entry", enum::"Document Entry Document Type"::" ", CopyStr(ItemLedgEntry.TableCaption(), 1, 1024), ItemLedgEntry.Count());
        end;
        if JobLedgEntry.ReadPermission() then begin
            JobLedgEntry.Reset();
            JobLedgEntry.SetCurrentKey("lbt Process No.");
            JobLedgEntry.SetFilter("lbt Process No.", "lbtProcessNo");
            //IF PostingDateFilter <> '' THEN
            //CustLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
            //InsertIntoDocEntry(Rec, DATABASE::"job Ledger Entry", 0, CopyStr(jobLedgEntry.TABLECAPTION(), 1, 1024), jobLedgEntry.COUNT());
            Rec.InsertIntoDocEntry(Database::"Job Ledger Entry", enum::"Document Entry Document Type"::" ", CopyStr(JobLedgEntry.TableCaption(), 1, 1024), JobLedgEntry.Count());
        end;
        if ResLedgEntry.ReadPermission() then begin
            ResLedgEntry.Reset();
            ResLedgEntry.SetCurrentKey("lbt Process No.");
            ResLedgEntry.SetFilter("lbt Process No.", "lbtProcessNo");
            //IF PostingDateFilter <> '' THEN
            //CustLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
            //InsertIntoDocEntry(Rec, DATABASE::"res. Ledger Entry", 0, CopyStr(resLedgEntry.TABLECAPTION(), 1, 1024), resLedgEntry.COUNT());
            Rec.InsertIntoDocEntry(Database::"Res. Ledger Entry", enum::"Document Entry Document Type"::" ", CopyStr(ResLedgEntry.TableCaption(), 1, 1024), ResLedgEntry.Count());
        end;
        if InteractLogEntry.ReadPermission() then begin
            InteractLogEntry.Reset();
            InteractLogEntry.SetCurrentKey("lbt Process No.");
            InteractLogEntry.SetFilter("lbt Process No.", "lbtProcessNo");
            //IF PostingDateFilter <> '' THEN
            //CustLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
            //InsertIntoDocEntry(Rec, DATABASE::"Interaction Log Entry", 0, CopyStr(InteractLogEntry.TABLECAPTION(), 1, 1024), InteractLogEntry.COUNT());
            Rec.InsertIntoDocEntry(Database::"Interaction Log Entry", enum::"Document Entry Document Type"::" ", CopyStr(InteractLogEntry.TableCaption(), 1, 1024), InteractLogEntry.Count());
        end;
        if VATEntry.ReadPermission() then begin
            VATEntry.Reset();
            VATEntry.SetCurrentKey("lbt Process No.");
            VATEntry.SetFilter("lbt Process No.", "lbtProcessNo");
            //IF PostingDateFilter <> '' THEN
            //CustLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
            //InsertIntoDocEntry(Rec, DATABASE::"VAT Entry", 0, CopyStr(VATEntry.TABLECAPTION(), 1, 1024), VATEntry.COUNT());
            Rec.InsertIntoDocEntry(Database::"VAT Entry", enum::"Document Entry Document Type"::" ", CopyStr(VATEntry.TableCaption(), 1, 1024), VATEntry.Count());
        end;
    end;

    local procedure findPostedPurchDocs()
    var
        PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
        PurchInvHdr: Record "Purch. Inv. Header";
        PurchRcptHdr: Record "Purch. Rcpt. Header";
        ReturnRcptHdr: Record "Return Receipt Header";
    begin
        if PurchInvHdr.ReadPermission() then begin
            PurchInvHdr.Reset();
            PurchInvHdr.SetCurrentKey("lbt Process No.");
            PurchInvHdr.SetFilter("lbt Process No.", "lbtProcessNo");
            //IF PostingDateFilter <> '' THEN
            //    PurchInvHeader.SETFILTER("Posting Date",PostingDateFilter);
            //InsertIntoDocEntry(Rec, DATABASE::"Purch. Inv. Header", 0, CopyStr(PurchInvHdr.TableCaption(), 1, 1024), PurchInvHdr.COUNT());
            Rec.InsertIntoDocEntry(Database::"Purch. Inv. Header", enum::"Document Entry Document Type"::" ", CopyStr(PurchInvHdr.TableCaption(), 1, 1024), PurchInvHdr.Count());
        end;

        if PurchCrMemoHdr.ReadPermission() then begin
            PurchCrMemoHdr.Reset();
            PurchCrMemoHdr.SetCurrentKey("lbt Process No.");
            PurchCrMemoHdr.SetFilter("lbt Process No.", "lbtProcessNo");
            //IF PostingDateFilter <> '' THEN
            //    PurchCrMemoHeader.SETFILTER("Posting Date",PostingDateFilter);
            //InsertIntoDocEntry(Rec, DATABASE::"Purch. Cr. Memo Hdr.", 0, CopyStr(PurchCrMemoHdr.TableCaption(), 1, 1024), PurchCrMemoHdr.COUNT());
            Rec.InsertIntoDocEntry(Database::"Purch. Cr. Memo Hdr.", enum::"Document Entry Document Type"::" ", CopyStr(PurchCrMemoHdr.TableCaption(), 1, 1024), PurchCrMemoHdr.Count());
        end;
        if PurchRcptHdr.ReadPermission() then begin
            PurchRcptHdr.Reset();
            PurchRcptHdr.SetCurrentKey("lbt Process No.");
            PurchRcptHdr.SetFilter("lbt Process No.", "lbtProcessNo");
            //IF PostingDateFilter <> '' THEN
            //    PurchCrMemoHeader.SETFILTER("Posting Date",PostingDateFilter);
            //InsertIntoDocEntry(Rec, DATABASE::"Purch. Rcpt. Header", 0, CopyStr(PurchrcptHdr.TableCaption(), 1, 1024), PurchrcptHdr.COUNT());
            Rec.InsertIntoDocEntry(Database::"Purch. Rcpt. Header", enum::"Document Entry Document Type"::" ", CopyStr(PurchRcptHdr.TableCaption(), 1, 1024), PurchRcptHdr.Count());
        end;
        if ReturnRcptHdr.ReadPermission() then begin
            ReturnRcptHdr.Reset();
            ReturnRcptHdr.SetCurrentKey("lbt Process No.");
            ReturnRcptHdr.SetFilter("lbt Process No.", "lbtProcessNo");
            //IF PostingDateFilter <> '' THEN
            //    PurchCrMemoHeader.SETFILTER("Posting Date",PostingDateFilter);
            //InsertIntoDocEntry(Rec, DATABASE::"return Receipt Header", 0, CopyStr(ReturnRcptHdr.TableCaption(), 1, 1024), PurchrcptHdr.COUNT());
            Rec.InsertIntoDocEntry(Database::"Return Receipt Header", enum::"Document Entry Document Type"::" ", CopyStr(ReturnRcptHdr.TableCaption(), 1, 1024), PurchRcptHdr.Count());
        end;
    end;

    local procedure findPostedSalesDocs()
    var
        ReturnShptHdr: Record "Return Shipment Header";
        SalesCrMemoHdr: Record "Sales Cr.Memo Header";
        SalesInvHdr: Record "Sales Invoice Header";
        SalesShptHdr: Record "Sales Shipment Header";

    begin
        if SalesInvHdr.ReadPermission() then begin
            SalesInvHdr.Reset();
            SalesInvHdr.SetCurrentKey("lbt Process No.");
            SalesInvHdr.SetFilter("lbt Process No.", "lbtProcessNo");
            //IF PostingDateFilter <> '' THEN
            //    PurchInvHeader.SETFILTER("Posting Date",PostingDateFilter);
            //InsertIntoDocEntry(Rec, DATABASE::"Sales Invoice Header", 0, CopyStr(SalesInvHdr.TableCaption(), 1, 1024), SalesInvHdr.COUNT());
            Rec.InsertIntoDocEntry(Database::"Sales Invoice Header", enum::"Document Entry Document Type"::" ", CopyStr(SalesInvHdr.TableCaption(), 1, 1024), SalesInvHdr.Count());
        end;

        if SalesCrMemoHdr.ReadPermission() then begin
            SalesCrMemoHdr.Reset();
            SalesCrMemoHdr.SetCurrentKey("lbt Process No.");
            SalesCrMemoHdr.SetFilter("lbt Process No.", "lbtProcessNo");
            //IF PostingDateFilter <> '' THEN
            //    PurchCrMemoHeader.SETFILTER("Posting Date",PostingDateFilter);
            //InsertIntoDocEntry(Rec, DATABASE::"Sales Cr.Memo Header", 0, CopyStr(SalesCrMemoHdr.TableCaption(), 1, 1024), SalesCrMemoHdr.COUNT());
            Rec.InsertIntoDocEntry(Database::"Sales Cr.Memo Header", enum::"Document Entry Document Type"::" ", CopyStr(SalesCrMemoHdr.TableCaption(), 1, 1024), SalesCrMemoHdr.Count());
        end;
        if SalesShptHdr.ReadPermission() then begin
            SalesShptHdr.Reset();
            SalesShptHdr.SetCurrentKey("lbt Process No.");
            SalesShptHdr.SetFilter("lbt Process No.", "lbtProcessNo");
            //IF PostingDateFilter <> '' THEN
            //    PurchCrMemoHeader.SETFILTER("Posting Date",PostingDateFilter);
            //InsertIntoDocEntry(Rec, DATABASE::"sales shipment Header", 0, CopyStr(SalesShptHdr.TableCaption(), 1, 1024), SalesShptHdr.COUNT());
            Rec.InsertIntoDocEntry(Database::"Sales Shipment Header", enum::"Document Entry Document Type"::" ", CopyStr(SalesShptHdr.TableCaption(), 1, 1024), SalesShptHdr.Count());
        end;
        if ReturnShptHdr.ReadPermission() then begin
            ReturnShptHdr.Reset();
            ReturnShptHdr.SetCurrentKey("lbt Process No.");
            ReturnShptHdr.SetFilter("lbt Process No.", "lbtProcessNo");
            //IF PostingDateFilter <> '' THEN
            //    PurchCrMemoHeader.SETFILTER("Posting Date",PostingDateFilter);
            //InsertIntoDocEntry(Rec, DATABASE::"return shipment Header", 0, CopyStr(ReturnShptHdr.TableCaption(), 1, 1024), ReturnShptHdr.COUNT());
            Rec.InsertIntoDocEntry(Database::"Return Shipment Header", enum::"Document Entry Document Type"::" ", CopyStr(ReturnShptHdr.TableCaption(), 1, 1024), ReturnShptHdr.Count());
        end;
    end;

    local procedure FindUnpostedPurchDocs()
    var
        PurchHdr: Record "Purchase Header";
        PurchHdr2: Record "Purchase Header";

        i: Integer;
    begin
        if not PurchHdr.ReadPermission() then
            exit;
        PurchHdr.SetCurrentKey("Document Type", "lbt Process No.");
        PurchHdr.SetFilter("lbt Process No.", "lbtProcessNo");
        for i := 1 to 6 do begin
            case i of
                1:
                    PurchHdr2."Document Type" := PurchHdr2."Document Type"::Quote;
                2:
                    PurchHdr2."Document Type" := PurchHdr2."Document Type"::Order;
                3:
                    PurchHdr2."Document Type" := PurchHdr2."Document Type"::Invoice;
                4:
                    PurchHdr2."Document Type" := PurchHdr2."Document Type"::"Credit Memo";
                5:
                    PurchHdr2."Document Type" := PurchHdr2."Document Type"::"Return Order";
                6:
                    PurchHdr2."Document Type" := PurchHdr2."Document Type"::"Blanket Order";
            end;
            PurchHdr.SetRange("Document Type", PurchHdr2."Document Type");
            //InsertIntoDocEntry(rec, database::"Purchase Header", PurchHdr2."Document Type", format(PurchHdr2."Document Type"), PurchHdr.count());
            Rec.InsertIntoDocEntry(Database::"Purchase Header", PurchHdr2."Document Type", Format(PurchHdr2."Document Type"), PurchHdr.Count());
        end;
    end;

    local procedure FindUnpostedSalesDocs()
    var
        SalesHdr: Record "Sales Header";
        SalesHdr2: Record "Sales Header";

        i: Integer;
    begin
        if not SalesHdr.ReadPermission() then
            exit;
        SalesHdr.SetCurrentKey("Document Type", "lbt Process No.");
        SalesHdr.SetFilter("lbt Process No.", "lbtProcessNo");
        for i := 1 to 6 do begin
            case i of
                1:
                    SalesHdr2."Document Type" := SalesHdr2."Document Type"::Quote;
                2:
                    SalesHdr2."Document Type" := SalesHdr2."Document Type"::Order;
                3:
                    SalesHdr2."Document Type" := SalesHdr2."Document Type"::Invoice;
                4:
                    SalesHdr2."Document Type" := SalesHdr2."Document Type"::"Credit Memo";
                5:
                    SalesHdr2."Document Type" := SalesHdr2."Document Type"::"Return Order";
                6:
                    SalesHdr2."Document Type" := SalesHdr2."Document Type"::"Blanket Order";
            end;
            SalesHdr.SetRange("Document Type", SalesHdr2."Document Type");
            //InsertIntoDocEntry(rec, database::"Sales Header", SalesHdr2."Document Type", format(SalesHdr2."Document Type"), SalesHdr.count());
            Rec.InsertIntoDocEntry(Database::"Sales Header", SalesHdr2."Document Type", Format(SalesHdr2."Document Type"), SalesHdr.Count());
        end;
    end;

    [BusinessEvent(true)]
    local procedure onAfterInsertDocEntries(var DocEntry: Record "Document Entry"; ProcessNo: Code[50])
    begin
    end;
}
