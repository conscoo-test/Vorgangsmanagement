pageextension 5266511 "LBT Process PurchaseOrder" extends "purchase Order"//50
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