tableextension 5266502 "LBT ProcessVendorLedgerEntry" extends "Vendor Ledger Entry"//25
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