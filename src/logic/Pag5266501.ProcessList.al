page 5266501 "lbt Process List"
{

    PageType = List;
    SourceTable = "lbt Process";
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
                    ToolTip = 'This column is filled automatically or manually with the process number.', comment = 'DEU="Diese Spalte wird mit der Vorgangsnummer automatisch oder manuell befüllt."';
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ToolTip = 'Here is the description of the process.', comment = 'DEU="Hier steht die Beschreibung des Vorgangs."';
                    ApplicationArea = All;
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
                ToolTip = 'The entries belonging to the transaction are counted.', comment = 'DEU="Die zugehörigen Posten zu dem Vorgang werden gezählt."';
                ApplicationArea = all;
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                PromotedIsBig = true;


                trigger OnAction()
                begin
                    Rec.Navigate();
                end;
            }
        }
    }

}
