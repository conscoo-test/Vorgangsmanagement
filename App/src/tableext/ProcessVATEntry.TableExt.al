tableextension 5266539 "lbt Process VAT Entry" extends "VAT Entry"//254
{
    fields
    {
        field(5266500; "lbt Process No."; Code[20])
        {
            Caption = 'Process No.', Comment = 'DEU="Prozessnr."';
            DataClassification = CustomerContent;
            TableRelation = "lbt Process";
        }
        // Add changes to table fields here
    }
}