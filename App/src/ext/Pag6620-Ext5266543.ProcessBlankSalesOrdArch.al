pageextension 5266543 "lbt Process BlankSalesOrd.Arch" extends "Blanket Sales Order Archive"//6620
{
    layout
    {
        addlast(General)
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