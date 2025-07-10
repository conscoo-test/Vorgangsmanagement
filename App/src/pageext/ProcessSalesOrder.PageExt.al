pageextension 5266507 "lbt Process SalesOrder" extends "Sales Order"//42
{
    layout
    {
        addlast(General)
        {
            field("lbt Process No."; Rec."lbt Process No.")
            {
                ApplicationArea = All;
                ToolTip = 'Here you select the process number.', Comment = 'DEU="Hier wählen Sie die Vorgangsnummer aus."';

                trigger OnAssistEdit()
                var
                    LBTProcess: Record "lbt Process";
                begin
                    LBTProcess.newProcess(Rec."lbt Process No.");
                end;
            }
        }
        // Add changes to page layout here
    }
}