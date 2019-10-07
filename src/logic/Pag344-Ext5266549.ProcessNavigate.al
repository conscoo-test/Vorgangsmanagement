pageextension 5266549 "lbt ProcessNavigate" extends "Navigate"//344
{
    layout
    {
        addlast(Document)
        {
            field("lbt lbt Process No."; ProcessNo)
            {
                ToolTip = 'Here you select the process number.', comment = 'DEU="Hier wählen Sie die Vorgangsnummer aus."';
                TableRelation = "lbt process";
                ApplicationArea = all;
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        addlast(Process)
        {
            action("lbt lbt Navigate Process No.")
            {
                ToolTip = 'Display entries corresponding to the process number.', comment = 'DEU="Zugehörige Posten der Vorgangsnummer anzeigen."';
                ApplicationArea = all;
                image = Navigate;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    if ProcessNo <> '' then
                        FindProcess();

                end;

            }
        }
        // Add changes to page actions here
    }

    var
        ProcessNo: code[50];

    procedure SetProcessNo(p_ProcessNo: Code[50])
    begin
        ProcessNo := p_ProcessNo;
    end;
    //NAVIGATE:Collect Records
    procedure FindProcess()
    var
        window: Dialog;
        Text002Msg: Label 'Search';
    begin
        window.Open(Text002Msg);
        reset();
        deleteall();
        "Entry No." := 0;
        //foundRecords := False;
        FindUnpostedPurchDocs();
        FindpostedPurchDocs();
        FindUnpostedSalesDocs();
        FindPostedSalesDocs();
        FindArchivSalesDocs();
        FindArchivPurchDocs();
        findEntries();
        rec.ModifyAll("lbt Process No.", ProcessNo);
        onAfterInsertDocEntries(Rec, ProcessNo);
        //DocExists := FINDFIRST;

        //UpdateFormAfterFindRecords;
        //FoundRecords := DocExists;

        //IF NOT FoundRecords THEN BEGIN
        //SetSource(0D,'','',0,'');
        //MESSAGE(LBText025);
        //END;
        Window.CLOSE();


    end;

    local procedure FindArchivSalesDocs()
    var
        SalesHdrArchiv: Record "Sales Header Archive";
        SalesHdrArchiv2: Record "Sales Header Archive";

        i: integer;
    begin
        if not SalesHdrArchiv.ReadPermission() then
            exit;
        SalesHdrArchiv.SetCurrentKey("Document Type", "lbt Process No.");
        SalesHdrArchiv.setfilter("lbt Process No.", ProcessNo);
        for i := 1 to 6 do begin
            case i of
                1:
                    SalesHdrArchiv2."Document Type" := SalesHdrArchiv2."Document Type"::Quote;
                2:
                    SalesHdrArchiv2."Document Type" := SalesHdrArchiv2."Document Type"::order;
                3:
                    SalesHdrArchiv2."Document Type" := SalesHdrArchiv2."Document Type"::invoice;
                4:
                    SalesHdrArchiv2."Document Type" := SalesHdrArchiv2."Document Type"::"Credit Memo";
                5:
                    SalesHdrArchiv2."Document Type" := SalesHdrArchiv2."Document Type"::"Return Order";
                6:
                    SalesHdrArchiv2."Document Type" := SalesHdrArchiv2."Document Type"::"Blanket Order";
            end;
            SalesHdrArchiv.setrange("Document Type", SalesHdrArchiv2."Document Type");
            InsertIntoDocEntry(rec, database::"Purchase Header", SalesHdrArchiv2."Document Type", format(SalesHdrArchiv2."Document Type"), SalesHdrArchiv.count());
        end;

    end;

    local procedure FindArchivPurchDocs()
    var
        PurchHdrArchiv: Record "Purchase Header Archive";
        PurchHdrArchiv2: Record "Purchase Header Archive";

        i: integer;
    begin
        if not PurchHdrArchiv.ReadPermission() then
            exit;
        PurchHdrArchiv.SetCurrentKey("Document Type", "lbt Process No.");
        PurchHdrArchiv.setfilter("lbt Process No.", ProcessNo);
        for i := 1 to 6 do begin
            case i of
                1:
                    PurchHdrArchiv2."Document Type" := PurchHdrArchiv2."Document Type"::Quote;
                2:
                    PurchHdrArchiv2."Document Type" := PurchHdrArchiv2."Document Type"::order;
                3:
                    PurchHdrArchiv2."Document Type" := PurchHdrArchiv2."Document Type"::invoice;
                4:
                    PurchHdrArchiv2."Document Type" := PurchHdrArchiv2."Document Type"::"Credit Memo";
                5:
                    PurchHdrArchiv2."Document Type" := PurchHdrArchiv2."Document Type"::"Return Order";
                6:
                    PurchHdrArchiv2."Document Type" := PurchHdrArchiv2."Document Type"::"Blanket Order";
            end;
            PurchHdrArchiv.setrange("Document Type", PurchHdrArchiv2."Document Type");
            InsertIntoDocEntry(rec, database::"Purchase Header", PurchHdrArchiv2."Document Type", format(PurchHdrArchiv2."Document Type"), PurchHdrArchiv.count());

        end;

    end;

    local procedure FindUnpostedPurchDocs()
    var
        PurchHdr: Record "Purchase Header";
        PurchHdr2: Record "Purchase Header";

        i: integer;
    begin
        if not PurchHdr.ReadPermission() then
            exit;
        PurchHdr.SetCurrentKey("Document Type", "lbt Process No.");
        PurchHdr.setfilter("lbt Process No.", ProcessNo);
        for i := 1 to 6 do begin
            case i of
                1:
                    PurchHdr2."Document Type" := PurchHdr2."Document Type"::Quote;
                2:
                    PurchHdr2."Document Type" := PurchHdr2."Document Type"::order;
                3:
                    PurchHdr2."Document Type" := PurchHdr2."Document Type"::invoice;
                4:
                    PurchHdr2."Document Type" := PurchHdr2."Document Type"::"Credit Memo";
                5:
                    PurchHdr2."Document Type" := PurchHdr2."Document Type"::"Return Order";
                6:
                    PurchHdr2."Document Type" := PurchHdr2."Document Type"::"Blanket Order";
            end;
            PurchHdr.setrange("Document Type", PurchHdr2."Document Type");
            InsertIntoDocEntry(rec, database::"Purchase Header", PurchHdr2."Document Type", format(PurchHdr2."Document Type"), PurchHdr.count());

        end;

    end;

    local procedure findPostedPurchDocs()
    var
        PurchInvHdr: Record "Purch. Inv. Header";
        PurchRcptHdr: Record "Purch. Rcpt. Header";
        PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
        PurchInvLn: Record "Purch. Inv. line";
        PurchRcptLn: Record "Purch. Rcpt. line";
        PurchCrMemoLn: Record "Purch. Cr. Memo line";
        ReturnRcptHdr: Record "Return Receipt Header";
    begin
        IF PurchInvHdr.READPERMISSION() THEN BEGIN
            PurchInvHdr.RESET();
            PurchInvHdr.SETCURRENTKEY("lbt Process No.");
            PurchInvHdr.SETFILTER("lbt Process No.", ProcessNo);
            //IF PostingDateFilter <> '' THEN
            //    PurchInvHeader.SETFILTER("Posting Date",PostingDateFilter);
            InsertIntoDocEntry(Rec, DATABASE::"Purch. Inv. Header", 0, PurchInvHdr.TableCaption(), PurchInvHdr.COUNT());
        END;

        IF PurchCrMemoHdr.READPERMISSION() THEN BEGIN
            PurchCrMemoHdr.RESET();
            PurchCrMemoHdr.SETCURRENTKEY("lbt Process No.");
            PurchCrMemoHdr.SETFILTER("lbt Process No.", ProcessNo);
            //IF PostingDateFilter <> '' THEN
            //    PurchCrMemoHeader.SETFILTER("Posting Date",PostingDateFilter);
            InsertIntoDocEntry(Rec, DATABASE::"Purch. Cr. Memo Hdr.", 0, PurchCrMemoHdr.TableCaption(), PurchCrMemoHdr.COUNT());
        END;
        IF PurchRcptHdr.READPERMISSION() THEN BEGIN
            PurchRcptHdr.RESET();
            PurchRcptHdr.SETCURRENTKEY("lbt Process No.");
            PurchRcptHdr.SETFILTER("lbt Process No.", ProcessNo);
            //IF PostingDateFilter <> '' THEN
            //    PurchCrMemoHeader.SETFILTER("Posting Date",PostingDateFilter);
            InsertIntoDocEntry(Rec, DATABASE::"Purch. Rcpt. Header", 0, PurchrcptHdr.TableCaption(), PurchrcptHdr.COUNT());
        END;
        IF ReturnRcptHdr.READPERMISSION() THEN BEGIN
            ReturnRcptHdr.RESET();
            ReturnRcptHdr.SETCURRENTKEY("lbt Process No.");
            ReturnRcptHdr.SETFILTER("lbt Process No.", ProcessNo);
            //IF PostingDateFilter <> '' THEN
            //    PurchCrMemoHeader.SETFILTER("Posting Date",PostingDateFilter);
            InsertIntoDocEntry(Rec, DATABASE::"return Receipt Header", 0, ReturnRcptHdr.TableCaption(), PurchrcptHdr.COUNT());
        END;
    end;

    local procedure FindUnpostedSalesDocs()
    var
        SalesHdr: Record "Sales Header";
        SalesHdr2: Record "Sales Header";

        i: integer;
    begin
        if not SalesHdr.ReadPermission() then
            exit;
        SalesHdr.SetCurrentKey("Document Type", "lbt Process No.");
        SalesHdr.setfilter("lbt Process No.", ProcessNo);
        for i := 1 to 6 do begin
            case i of
                1:
                    SalesHdr2."Document Type" := SalesHdr2."Document Type"::Quote;
                2:
                    SalesHdr2."Document Type" := SalesHdr2."Document Type"::order;
                3:
                    SalesHdr2."Document Type" := SalesHdr2."Document Type"::invoice;
                4:
                    SalesHdr2."Document Type" := SalesHdr2."Document Type"::"Credit Memo";
                5:
                    SalesHdr2."Document Type" := SalesHdr2."Document Type"::"Return Order";
                6:
                    SalesHdr2."Document Type" := SalesHdr2."Document Type"::"Blanket Order";
            end;
            SalesHdr.setrange("Document Type", SalesHdr2."Document Type");
            InsertIntoDocEntry(rec, database::"Sales Header", SalesHdr2."Document Type", format(SalesHdr2."Document Type"), SalesHdr.count());

        end;

    end;

    local procedure findPostedSalesDocs()
    var
        SalesInvHdr: Record "Sales Invoice Header";
        SalesShptHdr: Record "Sales Shipment Header";
        SalesCrMemoHdr: Record "Sales Cr.Memo Header";
        ReturnShptHdr: Record "Return Shipment Header";


    begin
        IF SalesInvHdr.READPERMISSION() THEN BEGIN
            SalesInvHdr.RESET();
            SalesInvHdr.SETCURRENTKEY("lbt Process No.");
            SalesInvHdr.SETFILTER("lbt Process No.", ProcessNo);
            //IF PostingDateFilter <> '' THEN
            //    PurchInvHeader.SETFILTER("Posting Date",PostingDateFilter);
            InsertIntoDocEntry(Rec, DATABASE::"Sales Invoice Header", 0, salesInvHdr.TableCaption(), salesInvHdr.COUNT());
        END;

        IF SalesCrMemoHdr.READPERMISSION() THEN BEGIN
            SalesCrMemoHdr.RESET();
            SalesCrMemoHdr.SETCURRENTKEY("lbt Process No.");
            SalesCrMemoHdr.SETFILTER("lbt Process No.", ProcessNo);
            //IF PostingDateFilter <> '' THEN
            //    PurchCrMemoHeader.SETFILTER("Posting Date",PostingDateFilter);
            InsertIntoDocEntry(Rec, DATABASE::"Sales Cr.Memo Header", 0, SalesCrMemoHdr.TableCaption(), salesCrMemoHdr.COUNT());
        END;
        IF SalesShptHdr.READPERMISSION() THEN BEGIN
            SalesShptHdr.RESET();
            SalesShptHdr.SETCURRENTKEY("lbt Process No.");
            SalesShptHdr.SETFILTER("lbt Process No.", ProcessNo);
            //IF PostingDateFilter <> '' THEN
            //    PurchCrMemoHeader.SETFILTER("Posting Date",PostingDateFilter);
            InsertIntoDocEntry(Rec, DATABASE::"sales shipment Header", 0, SalesShptHdr.TableCaption(), SalesShptHdr.COUNT());
        END;
        IF ReturnShptHdr.READPERMISSION() THEN BEGIN
            ReturnShptHdr.RESET();
            ReturnShptHdr.SETCURRENTKEY("lbt Process No.");
            ReturnShptHdr.SETFILTER("lbt Process No.", ProcessNo);
            //IF PostingDateFilter <> '' THEN
            //    PurchCrMemoHeader.SETFILTER("Posting Date",PostingDateFilter);
            InsertIntoDocEntry(Rec, DATABASE::"return shipment Header", 0, ReturnShptHdr.TableCaption(), SalesShptHdr.COUNT());
        END;
    end;

    local procedure FindEntries()
    var
        GLEntry: Record "G/L Entry";
        VendLedgEntry: Record "Vendor Ledger Entry";
        CustLedgEntry: Record "Cust. Ledger Entry";
        EmployeeLedgEntry: Record "Employee Ledger Entry";
        ItemLedgEntry: Record "Item Ledger Entry";
        InteractLogEntry: Record "Interaction Log Entry";
        ResLedgEntry: Record "Res. Ledger Entry";
        JobLedgEntry: Record "Job Ledger Entry";
        VATEntry: Record "VAT Entry";

    begin
        IF GLEntry.READPERMISSION() THEN BEGIN
            GLEntry.RESET();
            GLEntry.SETCURRENTKEY("lbt Process No.");
            GLEntry.SETFILTER("lbt Process No.", ProcessNo);
            //IF PostingDateFilter <> '' THEN
            //GLEntry.SETFILTER("Posting Date",PostingDateFilter);
            InsertIntoDocEntry(Rec, DATABASE::"G/L Entry", 0, GLEntry.TABLECAPTION(), GLEntry.COUNT());
        END;

        IF VendLedgEntry.READPERMISSION() THEN BEGIN
            VendLedgEntry.RESET();
            VendLedgEntry.SETCURRENTKEY("lbt Process No.");
            VendLedgEntry.SETFILTER("lbt Process No.", ProcessNo);
            //IF PostingDateFilter <> '' THEN
            //VendLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
            InsertIntoDocEntry(Rec, DATABASE::"Vendor Ledger Entry", 0, VendLedgEntry.TABLECAPTION(), VendLedgEntry.COUNT());
        END;

        IF CustLedgEntry.READPERMISSION() THEN BEGIN
            CustLedgEntry.RESET();
            CustLedgEntry.SETCURRENTKEY("lbt Process No.");
            CustLedgEntry.SETFILTER("lbt Process No.", ProcessNo);
            //IF PostingDateFilter <> '' THEN
            //CustLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
            InsertIntoDocEntry(Rec, DATABASE::"Cust. Ledger Entry", 0, CustLedgEntry.TABLECAPTION(), CustLedgEntry.COUNT());
        END;
        IF employeeLedgEntry.READPERMISSION() THEN BEGIN
            employeeLedgEntry.RESET();
            employeeLedgEntry.SETCURRENTKEY("lbt Process No.");
            employeeLedgEntry.SETFILTER("lbt Process No.", ProcessNo);
            //IF PostingDateFilter <> '' THEN
            //CustLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
            InsertIntoDocEntry(Rec, DATABASE::"employee Ledger Entry", 0, employeeLedgEntry.TABLECAPTION(), employeeLedgEntry.COUNT());
        END;
        IF itemLedgEntry.READPERMISSION() THEN BEGIN
            itemLedgEntry.RESET();
            itemLedgEntry.SETCURRENTKEY("lbt Process No.");
            itemLedgEntry.SETFILTER("lbt Process No.", ProcessNo);
            //IF PostingDateFilter <> '' THEN
            //CustLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
            InsertIntoDocEntry(Rec, DATABASE::"item Ledger Entry", 0, itemLedgEntry.TABLECAPTION(), itemLedgEntry.COUNT());
        END;
        IF jobLedgEntry.READPERMISSION() THEN BEGIN
            jobLedgEntry.RESET();
            jobLedgEntry.SETCURRENTKEY("lbt Process No.");
            jobLedgEntry.SETFILTER("lbt Process No.", ProcessNo);
            //IF PostingDateFilter <> '' THEN
            //CustLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
            InsertIntoDocEntry(Rec, DATABASE::"job Ledger Entry", 0, jobLedgEntry.TABLECAPTION(), jobLedgEntry.COUNT());
        END;
        IF resLedgEntry.READPERMISSION() THEN BEGIN
            resLedgEntry.RESET();
            resLedgEntry.SETCURRENTKEY("lbt Process No.");
            resLedgEntry.SETFILTER("lbt Process No.", ProcessNo);
            //IF PostingDateFilter <> '' THEN
            //CustLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
            InsertIntoDocEntry(Rec, DATABASE::"res. Ledger Entry", 0, resLedgEntry.TABLECAPTION(), resLedgEntry.COUNT());
        END;
        IF InteractLogEntry.READPERMISSION() THEN BEGIN
            InteractLogEntry.RESET();
            InteractLogEntry.SETCURRENTKEY("lbt Process No.");
            InteractLogEntry.SETFILTER("lbt Process No.", ProcessNo);
            //IF PostingDateFilter <> '' THEN
            //CustLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
            InsertIntoDocEntry(Rec, DATABASE::"Interaction Log Entry", 0, InteractLogEntry.TABLECAPTION(), InteractLogEntry.COUNT());
        END;
        IF VATEntry.READPERMISSION() THEN BEGIN
            VATEntry.RESET();
            VATEntry.SETCURRENTKEY("lbt Process No.");
            VATEntry.SETFILTER("lbt Process No.", ProcessNo);
            //IF PostingDateFilter <> '' THEN
            //CustLedgEntry.SETFILTER("Posting Date",PostingDateFilter);
            InsertIntoDocEntry(Rec, DATABASE::"VAT Entry", 0, VATEntry.TABLECAPTION(), VATEntry.COUNT());
        END;
    end;

    [BusinessEvent(true)]
    local procedure onAfterInsertDocEntries(DocEntry: Record "Document Entry"; ProcessNo: code[50])
    begin

    end;

}
