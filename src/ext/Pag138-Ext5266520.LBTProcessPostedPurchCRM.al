pageextension 5266520 "LBT Process PostedPurchCRM" extends "Posted Purchase Credit Memo"//138
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