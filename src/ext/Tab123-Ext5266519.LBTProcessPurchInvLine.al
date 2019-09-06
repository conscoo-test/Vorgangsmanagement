tableextension 5266519 "LBT Process PurchInvLine" extends "Purch. Inv. Line"//123
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