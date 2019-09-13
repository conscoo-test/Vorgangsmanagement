pageextension 5266503 "LBT Process ItemLedgEntries" extends "item ledger entries"//38
{
    layout
    {
        addlast(Control1)        
        {
            field("LBT Process No."; "LBT Process No.")
            {
                ToolTip = 'The process number is stored in this field.', comment = 'DEU="In diesem Feld ist die Vorgangsnummer hinterlegt."';
                ApplicationArea=ALL;  
                Editable= false;   
            }
        }
        // Add changes to page layout here
    }
   
}