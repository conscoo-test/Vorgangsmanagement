pageextension 5266512 "LBT Process PurchaseInvoices" extends "Purchase Invoices"//51
{
    layout
    {
        addlast(Control1)        
        {
            field("Process No."; "LBT Process No.")
            {
                ApplicationArea=ALL;    
            }
        }
        // Add changes to page layout here
    }
   
}