tableextension 5266514 "lbt Process SalesCRMHeader" extends "Sales Cr.Memo Header"//114
{
    fields
    {
        field(5266500; "lbt Process No."; Code[20])
        {
            Caption = 'Process No.', Comment = 'DEU="Prozessnr."';
            DataClassification = CustomerContent;
            TableRelation = "lbt Process";
        }
    }
}