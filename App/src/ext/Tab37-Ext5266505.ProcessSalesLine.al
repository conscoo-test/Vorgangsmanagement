tableextension 5266505 "lbt Process Sales Line" extends "Sales Line"//37
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