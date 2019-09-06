tableextension 5266505 "LBT Process Sales Line" extends "Sales Line"//37
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