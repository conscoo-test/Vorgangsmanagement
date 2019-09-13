pageextension 5266501 "LBT Process CustLedgEntries" extends "customer ledger entries"//25
{
    layout
    {
        addlast(control1)
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