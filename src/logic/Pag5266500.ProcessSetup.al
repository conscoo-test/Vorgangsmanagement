page 5266500 "lbt Process Setup"
{

    PageType = Card;
    SourceTable = "lbt Process Setup";
    Caption = 'Process Setup', Comment = 'DEU="Einrichtung Prozessmanagement"';
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;
    ApplicationArea = all;


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
