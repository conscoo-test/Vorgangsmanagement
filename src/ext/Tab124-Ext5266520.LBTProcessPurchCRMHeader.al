tableextension 5266520 "LBT Process PurchCRMHeader" extends "Purch. Cr. Memo Hdr."//124
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