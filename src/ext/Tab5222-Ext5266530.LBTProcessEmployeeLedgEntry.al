tableextension 5266530  "LBT Process EmployeeLedgEntry" extends "Employee Ledger Entry"//5222
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