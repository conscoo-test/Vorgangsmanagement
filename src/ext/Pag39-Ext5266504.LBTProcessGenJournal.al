pageextension 5266504 "LBT Process GenJournal" extends "general Journal"//39
{
    layout
    {
        addlast(Control1)        
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