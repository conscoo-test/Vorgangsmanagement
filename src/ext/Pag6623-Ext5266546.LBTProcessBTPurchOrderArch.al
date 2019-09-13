pageextension 5266546 "LBT Process BTPurch Order Arch" extends "Blanket Purchase Order Archive"//6623
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