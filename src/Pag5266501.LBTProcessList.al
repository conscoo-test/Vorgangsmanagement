page 5266501 "LBT Process List"
{
    
    PageType = List;
    SourceTable = "LBT Process";
    Caption = 'Process';
    ApplicationArea = All;
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
