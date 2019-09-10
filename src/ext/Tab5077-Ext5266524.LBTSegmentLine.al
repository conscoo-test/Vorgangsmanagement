tableextension 5266524 "LBT SegmentLine" extends "Segment Line"//5077
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