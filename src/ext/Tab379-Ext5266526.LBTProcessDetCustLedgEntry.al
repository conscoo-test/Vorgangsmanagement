tableextension 5266526 "LBT Process DetCustLedgEntry" extends "Detailed Cust. Ledg. Entry"//379
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