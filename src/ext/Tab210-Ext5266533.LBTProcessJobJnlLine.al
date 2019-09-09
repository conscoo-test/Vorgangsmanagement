tableextension 5266533  "LBT Process JobJnlLine" extends "Job Journal Line"//210
{
    fields
    {
        field(5266500; "LBT Process No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "LBT Process";
        }
    }
    
}