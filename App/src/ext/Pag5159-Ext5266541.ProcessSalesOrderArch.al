pageextension 5266541 "lbt Process Sales Order Arch." extends "Sales Order Archive"//5159
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