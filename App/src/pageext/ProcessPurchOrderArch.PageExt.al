pageextension 5266544 "lbt Process Purch. Order Arch." extends "Purchase Order Archive"//5167
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