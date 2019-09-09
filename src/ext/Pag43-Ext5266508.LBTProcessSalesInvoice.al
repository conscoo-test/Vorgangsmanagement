pageextension 5266508 "LBT Process SalesInvoice" extends "Sales Invoice"//43
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