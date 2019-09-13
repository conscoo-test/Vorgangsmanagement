pageextension 5266513 "LBT Process PurchaseCreditmemo" extends "Purchase Credit Memo"//52
{
    layout
    {
        addlast(General)        
        {
            field("LBT Process No."; "LBT Process No.")
            {
                ToolTip = 'Here you select the process number.', comment = 'DEU="Hier wählen Sie die Vorgangsnummer aus."';
                ApplicationArea=ALL;  

                trigger OnAssistEdit()
                var 
                LBTProcess: Record "LBT Process";
                begin
                    LBTProcess.newProcess("LBT Process No.");        
                end;  
            }
        }
        // Add changes to page layout here
    }
   
}