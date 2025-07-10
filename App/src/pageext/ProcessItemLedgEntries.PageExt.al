pageextension 5266503 "lbt Process ItemLedgEntries" extends "Item Ledger Entries"//38
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