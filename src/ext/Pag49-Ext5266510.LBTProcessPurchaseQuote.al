pageextension 5266510 "LBT Process PurchaseQuote" extends "Purchase Quote"//49
{
    layout
    {
        addlast(General)        
        {
            field("Process No."; "LBT Process No.")
            {
                ApplicationArea=ALL;    
            }
        }
        // Add changes to page layout here
    }
   
}