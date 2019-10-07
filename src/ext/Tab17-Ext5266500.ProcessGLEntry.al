tableextension 5266500 "lbt Process G/L Entry" extends "G/L Entry"//17
{
    fields
    {
        field(5266500; "lbt Process No."; Code[20])
        {
            Caption = 'Process No.', comment = 'DEU="Prozessnr."';
            DataClassification = CustomerContent;
            TableRelation = "lbt Process";
        }
        // Add changes to table fields here
    }

}