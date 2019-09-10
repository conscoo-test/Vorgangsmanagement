page 5266500 "LBT Process Setup"
{
    
    PageType = Card;
    SourceTable = "LBT Process Setup";
    Caption = 'Process Setup';
    InsertAllowed=false;
    DeleteAllowed=false;
    UsageCategory=Administration;
    ApplicationArea=all;

    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General', comment = 'DEU="Allgemein"';
                field("Process Nos."; "Process Nos.")
                {
                    ToolTip = 'Here you select a process number series.', comment = 'DEU="Hier wählen Sie eine Vorgangsnummernserie aus."';
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        InsertIfNotExists();
    end;
    
}
