pageextension 5266538 "LBT Process PostedReturnRcpt" extends "Posted Return Receipt"//6660
{
    layout
    {
        addlast(General)        
        {
            field("LBT Process No."; "LBT Process No.")
            {
                ToolTip = 'The process number is stored in this field.', comment = 'DEU="In diesem Feld ist die Vorgangsnummer hinterlegt."';
                ApplicationArea=ALL; 
                Editable= true;   
            }
        }
        // Add changes to page layout here
    }
   
}