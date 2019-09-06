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
                field("Process Nos."; "Process Nos.")
                {
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
