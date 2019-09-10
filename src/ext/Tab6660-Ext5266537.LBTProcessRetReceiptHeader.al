tableextension 5266537  "LBT Process RetReceiptHeader" extends "Return Receipt Header"//6660
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