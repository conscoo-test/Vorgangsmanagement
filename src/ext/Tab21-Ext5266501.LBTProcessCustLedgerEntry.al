tableextension 5266501 "LBT Process Cust. Ledger Entry" extends "Cust. Ledger Entry"//21
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