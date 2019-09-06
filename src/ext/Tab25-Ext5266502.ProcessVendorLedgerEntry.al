tableextension 5266502 "Process Vendor Ledger Entry" extends "Vendor Ledger Entry"//25
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