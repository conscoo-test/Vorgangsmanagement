tableextension 5266508 "LBT Process Gen. Journal Line" extends "Gen. Journal Line"//81
{
    fields
    {
        field(5266500; "LBT Process No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "LBT Process";
        }
    }
    
}