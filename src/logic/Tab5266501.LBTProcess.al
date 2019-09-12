table 5266501 "LBT Process"
{
    DataClassification = ToBeClassified;
    LookupPageId = "lbt process list";
    DrillDownPageId = "lbt process list";


    fields
    {
        field(1; "No."; code[20])
        {
            DataClassification = CustomerContent;

        }
        field(5; Description; text[80])
        {
            DataClassification = CustomerContent;
        }
        field(10; "Record ID"; recordid)
        {
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
        ProcessSetup: Record "LBT Process Setup";
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
        Navigate: Page Navigate;
    begin
        Navigate.SetProcessNo("No.");
        navigate.FindProcess();
        navigate.run();
    end;

    procedure newProcess(var ProcessNo: Code[20])
    begin

        if ProcessNo <> '' then
            if not Confirm('Neuer Vorgangs???') then
                exit;
        Init();
        "No." := '';
        Insert(true);
        ProcessNo := "No.";
    end;
}