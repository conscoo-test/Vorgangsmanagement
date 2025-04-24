pageextension 5266537 "lbt Process PostedReturnShip" extends "Posted Return Shipment"//6650
{
    layout
    {
        addlast(General)
        {
            field("lbt Process No."; Rec."lbt Process No.")
            {
                ApplicationArea = All;
                Editable = true;
                ToolTip = 'The process number is stored in this field.', Comment = 'DEU="In diesem Feld ist die Vorgangsnummer hinterlegt."';
            }
        }
        // Add changes to page layout here
    }
}