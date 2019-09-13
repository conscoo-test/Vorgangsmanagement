tableextension 5266539 "LBT Process VAT Entry" extends "VAT Entry"//254
{
    fields
    {
        field(5266500; "LBT Process No."; Code[20])
        {
            Caption = 'Process No.', comment = 'DEU="Prozessnr."';
            DataClassification = CustomerContent;
            TableRelation = "LBT Process";

        }
        // Add changes to table fields here
    }

}