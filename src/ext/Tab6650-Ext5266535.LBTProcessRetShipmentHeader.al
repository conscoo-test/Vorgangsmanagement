tableextension 5266535  "LBT Process RetShipmentHeader" extends "Return Shipment Header"//6650
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