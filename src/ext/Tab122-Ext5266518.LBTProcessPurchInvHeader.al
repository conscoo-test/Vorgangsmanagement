tableextension 5266518 "LBT Process PurchInvHeader" extends "Purch. Inv. Header"//122
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