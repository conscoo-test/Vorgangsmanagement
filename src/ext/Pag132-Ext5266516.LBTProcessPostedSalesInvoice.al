pageextension 5266516 "LBT Process PostedSalesInvoice" extends "Posted Sales Invoice"//132
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