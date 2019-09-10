tableextension 5266515 "LBT Process SalesCRMLine" extends "Sales Cr.Memo Line"//115
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