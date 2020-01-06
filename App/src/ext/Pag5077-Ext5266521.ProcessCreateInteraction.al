pageextension 5266521 "lbt Process CreateInteraction" extends "Create Interaction"//5077
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