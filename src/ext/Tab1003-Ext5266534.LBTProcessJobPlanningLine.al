tableextension 5266534 "LBT Process JobPlanningLine" extends "Job Planning Line"//1003
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