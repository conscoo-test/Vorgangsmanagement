table 5266500 "LBT Process Setup"
{
    ///NAVIGATE: SetupTable
    
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification= CustomerContent;
        }
        field(2; "Process Nos."; code[20])
        {
            TableRelation="No. Series";
            DataClassification=CustomerContent;
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
        if not Get() then 
        
            Init();
            Insert(true);
        
    end;


}