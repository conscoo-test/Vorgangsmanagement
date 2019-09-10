pageextension 5266513 "LBT Process PurchaseCreditmemo" extends "Purchase Credit Memo"//52
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