pageextension 5266540 "LBT Process Sales Quote Arch." extends "Sales Quote Archive"//5162
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