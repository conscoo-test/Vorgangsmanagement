pageextension 5266506 "LBT Process SalesQuote" extends "Sales Quote"//41
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