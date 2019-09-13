pageextension 5266537 "LBT Process PostedReturnShip" extends "Posted return Shipment"//6650
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