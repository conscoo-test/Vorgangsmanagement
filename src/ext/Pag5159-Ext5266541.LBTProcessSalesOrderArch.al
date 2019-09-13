pageextension 5266541 "LBT Process Sales Order Arch." extends "Sales Order Archive"//5159
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