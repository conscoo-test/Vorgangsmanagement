pageextension 5266502 "lbt Process VendLedgEntries" extends "vendor ledger entries"//29
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