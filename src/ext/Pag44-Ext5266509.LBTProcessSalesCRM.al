pageextension 5266509 "LBT Process SalesCRM" extends "Sales Credit Memo"//44
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