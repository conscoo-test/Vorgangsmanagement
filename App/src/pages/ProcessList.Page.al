page 5266501 "lbt Process List"
{
    ApplicationArea = All;

    Caption = 'Process', Comment = 'DEU="Prozess"';
    PageType = List;
    SourceTable = "lbt Process";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'This column is filled automatically or manually with the process number.', Comment = 'DEU="Diese Spalte wird mit der Vorgangsnummer automatisch oder manuell befüllt."';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Here is the description of the process.', Comment = 'DEU="Hier steht die Beschreibung des Vorgangs."';
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(Navigate)
            {
                ApplicationArea = All;
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'The entries belonging to the transaction are counted.', Comment = 'DEU="Die zugehörigen Posten zu dem Vorgang werden gezählt."';

                trigger OnAction()
                begin
                    Rec.Navigate();
                end;
            }
        }
    }
}
