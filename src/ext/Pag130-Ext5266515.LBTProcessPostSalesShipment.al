pageextension 5266515 "LBT Process PostSalesShipment" extends "Posted Sales Shipment"//130
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