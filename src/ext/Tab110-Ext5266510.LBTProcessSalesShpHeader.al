tableextension 5266510 "LBT Process SalesShpHeader" extends "Sales Shipment Header"//110
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