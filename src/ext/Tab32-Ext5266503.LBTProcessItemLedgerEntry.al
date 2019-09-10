tableextension 5266503 "LBT Process Item Ledger Entry" extends "Item Ledger Entry"//32
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