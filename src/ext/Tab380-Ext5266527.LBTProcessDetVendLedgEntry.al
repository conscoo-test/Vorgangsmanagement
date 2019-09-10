tableextension 5266527 "LBT Process DetVendLedgEntry" extends "Detailed Vendor Ledg. Entry"//380
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