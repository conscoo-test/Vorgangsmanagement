pageextension 5266543 "lbt Process BlankSalesOrd.Arch" extends "Blanket Sales Order Archive"//6620
{
    layout
    {
        addlast(General)
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