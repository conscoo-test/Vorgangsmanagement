tableextension 5266523  "LBT Process InteractLogEntry" extends "Interaction Log Entry"//5065
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