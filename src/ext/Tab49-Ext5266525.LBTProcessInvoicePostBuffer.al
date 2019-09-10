tableextension 5266525 "LBT Process InvoicePostBuffer" extends "Invoice Post. Buffer"//49
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