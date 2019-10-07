tableextension 5266530 "lbt Process EmployeeLedgEntry" extends "Employee Ledger Entry"//5222
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