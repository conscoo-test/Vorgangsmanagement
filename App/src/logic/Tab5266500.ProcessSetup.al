table 5266500 "lbt Process Setup"
{
    ///NAVIGATE: SetupTable

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key', comment = 'DEU="Primärschlüssel"';
            DataClassification = CustomerContent;
        }
        field(2; "Process Nos."; code[20])
        {
            Caption = 'Process Nos.', comment = 'DEU="Prozess Nummernserie"';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
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