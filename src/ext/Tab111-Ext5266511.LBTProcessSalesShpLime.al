tableextension 5266511 "LBT Process SalesShpLime" extends "Sales Shipment Line"//111
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