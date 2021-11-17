codeunit 50109 MyCodeunitNew
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, database::"Sales Header", 'OnAfterCopySellToCustomerAddressFieldsFromCustomer', '', False, false)]
    local procedure OnAfterCopySellToCustomerAddressFieldsFromCustomer(var SalesHeader: Record "Sales Header"; SellToCustomer: Record Customer; CurrentFieldNo: Integer)
    var
        SalesHeader1: Record "Sales Header";
    begin
        SalesHeader.Validate("Sell-to Address", SellToCustomer."Address 2");
    end;

    var
        myInt: Integer;
}