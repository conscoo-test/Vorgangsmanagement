pageextension 5266507 "LBT Process SalesOrder" extends "Sales Order"//42
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