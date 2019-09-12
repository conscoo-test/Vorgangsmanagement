tableextension 5266522 "LBT Process JobLedgerEntry" extends "Job Ledger Entry"//169
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