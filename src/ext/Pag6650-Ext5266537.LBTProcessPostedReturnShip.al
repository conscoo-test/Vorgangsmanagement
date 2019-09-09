pageextension 5266537 "LBT Process PostedReturnShip" extends "Posted return Shipment"//6650
{
    layout
    {
        addlast(General)        
        {
            field("LBT Process No."; "LBT Process No.")
            {
                ApplicationArea=ALL;    
            }
        }
        // Add changes to page layout here
    }
   
}