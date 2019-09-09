tableextension 5266538  "LBT Process RetReceiptLine" extends "Return Receipt Line"//6661
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