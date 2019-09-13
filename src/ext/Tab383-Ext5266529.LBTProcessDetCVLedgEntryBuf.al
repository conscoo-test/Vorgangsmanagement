tableextension 5266529 "LBT Process DetCVLedgEntryBuf" extends "Detailed CV Ledg. Entry Buffer"//383
{
    fields
    {
        field(5266500; "LBT Process No."; Code[20])
        {
            Caption = 'Process No.', comment = 'DEU="Prozessnr."';
            DataClassification = CustomerContent;
            TableRelation = "LBT Process";
        }
    }
    
}