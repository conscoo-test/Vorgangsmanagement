tableextension 5266507 "lbt Process Purchase Line" extends "Purchase Line"//39
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