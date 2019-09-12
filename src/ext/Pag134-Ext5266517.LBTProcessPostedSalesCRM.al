pageextension 5266517 "LBT Process PostedSalesCRM" extends "Posted Sales Credit Memo"//134
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