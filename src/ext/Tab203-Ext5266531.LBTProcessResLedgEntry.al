tableextension 5266531  "LBT Process ResLedgEntry" extends "Res. ledger entry"//203
{
    fields
    {
        field(5266500; "LBT Process No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "LBT Process";
        }
    }
    
}