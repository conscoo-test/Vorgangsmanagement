table 5266500 "lbt Process Setup"
{
    ///NAVIGATE: SetupTable
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key', Comment = 'DEU="Primärschlüssel"';
        }
        field(2; "Process Nos."; Code[20])
        {
            Caption = 'Process Nos.', Comment = 'DEU="Prozess Nummernserie"';
            TableRelation = "No. Series";
        }

        //You might want to add fields here
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    procedure InsertIfNotExists()
    var
    begin
        Reset();
        if not Get() then begin

            Init();
            Insert(true);
        end;
    end;
}