tableextension 5266521 "LBT Process PurchCRMLine" extends "Purch. Cr. Memo Line"//125
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