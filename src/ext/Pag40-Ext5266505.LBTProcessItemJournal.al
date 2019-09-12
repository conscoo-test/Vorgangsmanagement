pageextension 5266505 "LBT Process ItemJournal" extends "item Journal"//40
{
    layout
    {
        addlast(Control1)
        {
            field("LBT Process No."; "LBT Process No.")
            {
                ToolTip = 'Here you select the process number.', comment = 'DEU="Hier wählen Sie die Vorgangsnummer aus."';
                ApplicationArea = ALL;

                trigger OnAssistEdit()
                var
                    LBTProcess: Record "LBT Process";
                begin
                    LBTProcess.newProcess("LBT Process No.");
                end;

            }
        }
        // Add changes to page layout here
    }

}