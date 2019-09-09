pageextension 5266524 "LBT Process JobPlanningLines" extends "Job Planning Lines"//1007
{
    layout
    {
        addlast(Control1)        
        {
            field("LBT Process No."; "LBT Process No.")
            {
                ApplicationArea=ALL;    
            }
        }
        // Add changes to page layout here
    }
   
}