pageextension 5266538 "LBT Process PostedReturnRcpt" extends "Posted Return Receipt"//6660
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