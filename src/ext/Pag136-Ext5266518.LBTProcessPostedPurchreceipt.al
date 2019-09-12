pageextension 5266518 "LBT Process PostedPurchreceipt" extends "Posted Purchase Receipt"//136
{
    layout
    {
        addlast(General)        
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