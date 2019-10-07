pageextension 5266548 "lbt Process Blank Sales Order" extends "Blanket Sales Order"//507
{
    layout
    {
        addlast(General)
        {
            field("lbt Process No."; "lbt Process No.")
            {
                ToolTip = 'Here you select the process number.', comment = 'DEU="Hier wählen Sie die Vorgangsnummer aus."';
                ApplicationArea = ALL;

                trigger OnAssistEdit()
                var
                    LBTProcess: Record "lbt Process";
                begin
                    LBTProcess.newProcess("lbt Process No.");
                end;
            }
        }
        // Add changes to page layout here
    }

}