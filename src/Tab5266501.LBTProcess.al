table 5266501 "LBT Process"
{
    DataClassification = ToBeClassified;
    LookupPageId = "lbt process list";
    DrillDownPageId = "lbt process list";

    
    fields
    {
        field(1; "No."; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(5; Description; text[80])
        {
            DataClassification=ToBeClassified;
        }
        field(10;"Record ID";recordid)
        {
            DataClassification=ToBeClassified;
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
        ProcessSetup.get;
        if "no." = '' then begin
            ProcessSetup.TestField(ProcessSetup."Process Nos.");
            NoSeriesMgt.InitSeries(ProcessSetup."Process Nos.",'0',0D,"No.",ProcessSetup."Process Nos.");
        end;
    end;
}