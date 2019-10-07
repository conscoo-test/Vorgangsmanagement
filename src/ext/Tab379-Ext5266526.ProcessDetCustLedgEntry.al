tableextension 5266526 "lbt Process DetCustLedgEntry" extends "Detailed Cust. Ledg. Entry"//379
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