table 5266501 "lbt Process"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "lbt Process List";
    LookupPageId = "lbt Process List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Process No.', Comment = 'DEU="Prozessnr."';
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description', Comment = 'DEU="Beschreibung"';
        }
        field(10; "Record ID"; RecordId)
        {
            Caption = 'Record ID', Comment = 'DEU="Record ID"';
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        ProcessSetup: Record "lbt Process Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeries: Codeunit "No. Series";
    begin
        ProcessSetup.Get();
        if "No." = '' then begin
            ProcessSetup.TestField(ProcessSetup."Process Nos.");
            NoSeries.GetNextNo(ProcessSetup."Process Nos.", WorkDate());
            //NoSeriesMgt.InitSeries(ProcessSetup."Process Nos.", '0', 0D, "No.", ProcessSetup."Process Nos.");
        end;
    end;

    procedure Navigate()
    var
        NavigatePage: Page Navigate;
    begin
        NavigatePage.lbtSetProcessNo("No.");
        NavigatePage.FindProcess();
        NavigatePage.Run();
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