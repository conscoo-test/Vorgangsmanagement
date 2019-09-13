pageextension 5266545 "LBT Process Purch. Quote Arch." extends "Purchase Quote Archive"//5164
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