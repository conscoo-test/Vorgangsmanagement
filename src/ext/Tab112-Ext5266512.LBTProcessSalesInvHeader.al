tableextension 5266512 "LBT Process SalesInvHeader" extends "Sales Invoice Header"//112
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