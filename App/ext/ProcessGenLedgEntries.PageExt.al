pageextension 5266500 "lbt Process GenLedgEntries" extends "general ledger entries"//20
{
    layout
    {
        addlast(Control1)
        {
            field("lbt Process No."; "lbt Process No.")
            {
                ToolTip = 'The process number is stored in this field.', comment = 'DEU="In diesem Feld ist die Vorgangsnummer hinterlegt."';
                ApplicationArea = ALL;
                Editable = false;
            }
        }
        // Add changes to page layout here
    }

}