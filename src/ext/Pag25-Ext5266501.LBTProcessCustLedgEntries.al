pageextension 5266501 "LBT Process CustLedgEntries" extends "customer ledger entries"//25
{
    layout
    {
        addlast(control1)
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