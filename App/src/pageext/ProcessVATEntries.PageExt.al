pageextension 5266539 "lbt Process VAT Entries" extends "VAT Entries"//315
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