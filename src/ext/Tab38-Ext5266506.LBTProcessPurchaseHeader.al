tableextension 5266506 "LBT Process Purchase Header" extends "Purchase Header"//38
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