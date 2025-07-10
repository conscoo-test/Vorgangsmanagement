tableextension 5266528 "lbt Process CVLedgEntryBuffer" extends "CV Ledger Entry Buffer"//382
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