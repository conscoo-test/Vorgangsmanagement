page 5266500 "lbt Process Setup"
{
    ApplicationArea = All;
    Caption = 'Process Setup', Comment = 'DEU="Einrichtung Prozessmanagement"';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "lbt Process Setup";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General', Comment = 'DEU="Allgemein"';
                field("Process Nos."; Rec."Process Nos.")
                {
                    ToolTip = 'Here you select a process number series.', Comment = 'DEU="Hier wählen Sie eine Vorgangsnummernserie aus."';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExists();
    end;
}
