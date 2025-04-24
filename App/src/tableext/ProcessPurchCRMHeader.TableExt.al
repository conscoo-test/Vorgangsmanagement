tableextension 5266520 "lbt Process PurchCRMHeader" extends "Purch. Cr. Memo Hdr."//124
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