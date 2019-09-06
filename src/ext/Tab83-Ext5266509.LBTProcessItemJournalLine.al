tableextension 5266509 "LBT Process Item Journal Line" extends "Item Journal Line"//83
{
    fields
    {
        field(5266500; "LBT Process No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "LBT Process";
        }
    }
    
}