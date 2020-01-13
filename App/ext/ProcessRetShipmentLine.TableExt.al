tableextension 5266536 "lbt Process RetShipmentLine" extends "Return Shipment Line"//6651
{
    fields
    {
        field(5266500; "lbt Process No."; Code[20])
        {

            Caption = 'Process No.', comment = 'DEU="Prozessnr."';
            DataClassification = CustomerContent;
            TableRelation = "lbt Process";
        }
    }

}