codeunit 5266501 "lbt Process Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        ProcessSetup: Record "lbt Process Setup";
    begin
        ProcessSetup.InsertIfNotExists();
    end;
}