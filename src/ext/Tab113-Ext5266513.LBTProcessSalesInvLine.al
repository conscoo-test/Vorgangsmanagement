tableextension 5266513 "LBT Process SalesInvLine" extends "Sales Invoice Line"//113
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