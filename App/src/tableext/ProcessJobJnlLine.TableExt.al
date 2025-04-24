tableextension 5266533 "lbt Process JobJnlLine" extends "Job Journal Line"//210
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