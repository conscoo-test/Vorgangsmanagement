tableextension 5266536  "LBT Process RetShipmentLine" extends "Return Shipment Line"//6651
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