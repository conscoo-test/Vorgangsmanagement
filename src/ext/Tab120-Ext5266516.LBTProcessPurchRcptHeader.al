tableextension 5266516 "LBT Process PurchRcptHeader" extends "Purch. Rcpt. Header"//120
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