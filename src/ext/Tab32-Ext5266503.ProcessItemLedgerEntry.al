tableextension 5266503 "lbt Process Item Ledger Entry" extends "Item Ledger Entry"//32
{
    fields
    {
        field(5266500; "lbt Process No."; Code[20])
        {

            Caption = 'Process No.', comment = 'DEU="Prozessnr."';
            DataClassification = CustomerContent;
            TableRelation = "lbt Process";
        }
    }

}