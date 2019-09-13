pageextension 5266544 "LBT Process Purch. Order Arch." extends "Purchase Order Archive"//5167
{
    layout
    {
        addlast(General)        
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