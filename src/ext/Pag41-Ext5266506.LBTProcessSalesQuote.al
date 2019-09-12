pageextension 5266506 "LBT Process SalesQuote" extends "Sales Quote"//41
{
    layout
    {
        addlast(General)        
        {
            field("LBT Process No."; "LBT Process No.")
            {
                ToolTip = 'Here you select the process number.', comment = 'DEU="Hier wählen Sie die Vorgangsnummer aus."';
                ApplicationArea=ALL;  
                  
            }
        }
        // Add changes to page layout here
    }
   
}