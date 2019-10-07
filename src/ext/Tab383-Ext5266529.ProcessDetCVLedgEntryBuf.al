tableextension 5266529 "lbt Process DetCVLedgEntryBuf" extends "Detailed CV Ledg. Entry Buffer"//383
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