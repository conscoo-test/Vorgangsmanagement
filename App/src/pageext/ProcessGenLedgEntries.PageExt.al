pageextension 5266500 "lbt Process GenLedgEntries" extends "General Ledger Entries"//20
{
    layout
    {
        addlast(Control1)
        {
            field("lbt Process No."; Rec."lbt Process No.")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'The process number is stored in this field.', Comment = 'DEU="In diesem Feld ist die Vorgangsnummer hinterlegt."';
            }
        }
        // Add changes to page layout here
    }
}