pageextension 5266500 "LBT Process GenLedgEntries" extends "general ledger entries"//20
{
    layout
    {
        addlast(Control1)        
        {
            field("LBT Process No."; "LBT Process No.")
            {
                ToolTip = 'The process number is stored in this field.', comment = 'DEU="In diesem Feld ist die Vorgangsnummer hinterlegt."';
                ApplicationArea=ALL;    
            }
        }
        // Add changes to page layout here
    }
   
}