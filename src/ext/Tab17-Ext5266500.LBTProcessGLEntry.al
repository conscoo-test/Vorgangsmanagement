tableextension 5266500 "LBT Process G/L Entry" extends "G/L Entry"//17
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