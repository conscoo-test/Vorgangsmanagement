pageextension 5266523 "LBT Process ResourceJournal" extends "resource Journal"//207
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