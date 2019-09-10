pageextension 5266518 "LBT Process PostedPurchreceipt" extends "Posted Purchase Receipt"//136
{
    layout
    {
        addlast(General)        
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