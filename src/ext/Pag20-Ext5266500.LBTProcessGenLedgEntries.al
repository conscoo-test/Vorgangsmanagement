pageextension 5266500 "LBT Process GenLedgEntries" extends "general ledger entries"//20
{
    layout
    {
        addlast(Control1)        
        {
            field("LBT Process No."; "LBT Process No.")
            {
                ToolTip = 'Here you select the process number.', comment = 'DEU="Hier wählen Sie die Vorgangsnummer aus."';
                ApplicationArea=ALL;    
            }
        }
        // Add changes to page layout here
    }
   
}