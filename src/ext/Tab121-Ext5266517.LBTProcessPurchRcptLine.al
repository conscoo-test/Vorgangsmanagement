tableextension 5266517 "LBT Process PurchRcptLine" extends "Purch. Rcpt. Line"//121
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