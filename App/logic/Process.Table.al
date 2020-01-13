table 5266501 "lbt Process"
{
    DataClassification = ToBeClassified;
    LookupPageId = "lbt process list";
    DrillDownPageId = "lbt process list";


    fields
    {
        field(1; "No."; code[20])
        {
            Caption = 'Process No.', comment = 'DEU="Prozessnr."';
            DataClassification = CustomerContent;

        }
        field(5; Description; text[100])
        {
            Caption = 'Description', comment = 'DEU="Beschreibung"';
            DataClassification = CustomerContent;
        }
        field(10; "Record ID"; recordid)
        {
            Caption = 'Record ID', comment = 'DEU="Record ID"';
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(PK; "no.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        ProcessSetup: Record "lbt Process Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        ProcessSetup.get();
        if "no." = '' then begin
            ProcessSetup.TestField(ProcessSetup."Process Nos.");
            NoSeriesMgt.InitSeries(ProcessSetup."Process Nos.", '0', 0D, "No.", ProcessSetup."Process Nos.");
        end;
    end;

    procedure Navigate()
    var
        NavigatePage: Page Navigate;
    begin
        NavigatePage.SetProcessNo("No.");
        navigatePage.FindProcess();
        navigatePage.run();
    end;

    procedure newProcess(var ProcessNo: Code[20])
    var
        Text001Msg: Label 'Do you really want to get a new process number and overwrite the old process number?', Comment = 'DEU="Wollen Sie wirklich eine neue Vorgangsnummer ziehen und die alte Vorgangsnummer überschreiben?"';
    begin
        if ProcessNo <> '' then
            if not Confirm(Text001Msg) then
                exit;
        Init();
        "No." := '';
        Insert(true);
        ProcessNo := "No.";
    end;
}