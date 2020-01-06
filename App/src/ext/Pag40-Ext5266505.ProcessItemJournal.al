pageextension 5266505 "lbt Process ItemJournal" extends "item Journal"//40
{
    layout
    {
        addlast(Control1)
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