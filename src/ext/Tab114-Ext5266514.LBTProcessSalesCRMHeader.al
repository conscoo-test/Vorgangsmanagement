tableextension 5266514 "LBT Process SalesCRMHeader" extends "Sales Cr.Memo Header"//114
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