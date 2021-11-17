page 50101 StudentCard
{
    PageType = Card;
    UsageCategory = Administration;
    SourceTable = student;
    Caption = 'Student';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = All;

                }
                field(Name; rec.Name)
                {
                    ApplicationArea = All;

                }
                field(FirstName; rec.FirstName)
                {
                    ApplicationArea = All;

                }
                field(MiddleName; rec.MiddleName)
                {
                    ApplicationArea = All;

                }
                field(LastName; rec.LastName)
                {
                    ApplicationArea = All;

                }
                field(Address; rec.Address)
                {
                    ApplicationArea = All;

                }
                field(PostCode; rec.PostCode)
                {
                    ApplicationArea = All;

                }
                field("Country/RegionCode"; rec."Country/RegionCode")
                {
                    ApplicationArea = All;

                }
                field(IDProof; rec.IDProof)
                {
                    ApplicationArea = All;

                }
                field(AdmissionYear; rec.AdmissionYear)
                {
                    ApplicationArea = All;

                }
                field(AcademicYear; rec.AcademicYear)
                {
                    ApplicationArea = All;

                }
                field(year; rec.year)
                {
                    ApplicationArea = All;

                }
                field(coursecode; rec.coursecode)
                {
                    ApplicationArea = All;

                }
                field(Semester; rec.Semester)
                {
                    ApplicationArea = All;

                }
                field("Registration Amount"; rec."Registration Amount")
                {
                    ApplicationArea = All;

                }
                field("Fee Classification c"; rec."Fee Classification c")
                {
                    ApplicationArea = All;

                }
                field(CustomerNo; rec.CustomerNo)
                {
                    ApplicationArea = All;

                }
                field(Status; rec.Status)
                {
                    ApplicationArea = All;

                }

            }
            group(Communication)
            {
                field(MobileNo; rec.MobileNo)
                {
                    ApplicationArea = All;
                }
                field(AlternateNo; rec.AlternateNo)
                {
                    ApplicationArea = All;
                }
                field(EmaidId; rec.EmaidId)
                {
                    ApplicationArea = All;
                }

            }
            group(ParentDetail)
            {
                Caption = 'Parent "s" Detail';
                field(FatherName; rec.FatherName)
                {
                    ApplicationArea = All;
                }
                field(MothersName; rec.MothersName)
                {
                    ApplicationArea = All;
                }
                field(FathersOccupation; rec.FathersOccupation)
                {
                    ApplicationArea = All;
                }
                field("Permanent Address"; rec."Permanent Address")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(PrintRegistrationFeeReceipt)
            {
                ApplicationArea = All;
                Caption = 'Print Registration Fee Receipt';

                trigger OnAction()
                var
                    RecsalesHeader: Record "Sales Header";
                    recsalesLine: Record "Sales Line";
                    SalesLine: Record "Sales Line";
                    NextNo: Integer;
                    salesPostCU: Codeunit "Sales-Post";
                    RecGenJnlLine: Record "Gen. Journal Line";
                    RecsalesinvHeader: Record "Sales Invoice Header";
                    recGenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";

                begin
                    //Scenarios 

                    //1. Need to create  Sales Invoice if customer is not empty. If Empty means throw Error
                    //2. Sales  Invoice Creation(Header and Line with Doc Type : Invoice, Doc No : SalesRec Setup,Amount : Registration Amount, Item : StudentFee(HardCode))
                    //No:='';
                    //3. Posting the Invoice. //SalesPost Codeunit
                    //4.use the Posted  Document to Create Payment entry and post entry.
                    if rec.CustomerNo = '' then
                        Error('Please fill the customer no.')
                    else begin
                        RecsalesHeader.Init();
                        RecsalesHeader."Document Type" := RecsalesHeader."Document Type"::Invoice;
                        RecsalesHeader."No." := '';
                        RecsalesHeader.Validate("Sell-to Customer No.", rec.CustomerNo);
                        RecsalesHeader.Insert(true);

                        SalesLine.Reset();
                        SalesLine.SetRange("Document Type", RecsalesHeader."Document Type"::Invoice);
                        SalesLine.Setrange("Document No.", RecsalesHeader."No.");
                        if SalesLine.FindLast() then
                            NextNo := SalesLine."Line No." + 10000
                        else
                            NextNo := 10000;

                        recsalesLine.Init();
                        recsalesLine."Document Type" := recsalesLine."Document Type"::Invoice;
                        recsalesLine."Document No." := RecsalesHeader."No.";
                        recsalesLine."Line No." := NextNo;
                        recsalesLine.Insert(true);
                        recsalesLine.Type := recsalesLine.Type::Item;
                        recsalesLine.Validate("No.", '70061');
                        recsalesLine."Unit Price" := rec."Registration Amount";
                        recsalesLine.validate(Quantity, 1);
                        recsalesLine.Modify();
                    end;
                    salesPostCU.Run(RecsalesHeader);
                    RecGenJnlLine.Init();
                    RecGenJnlLine."Journal Template Name" := 'PAYMENT';
                    RecGenJnlLine."Journal Batch Name" := 'BANK';
                    RecGenJnlLine."Line No." := NextNo;
                    //RecGenJnlLine.Insert(true);
                    RecGenJnlLine."Document Type" := RecGenJnlLine."Document Type"::Invoice;
                    RecGenJnlLine."Account Type" := RecGenJnlLine."Account Type"::Customer;
                    RecGenJnlLine.Validate("Account No.", rec.CustomerNo);
                    RecGenJnlLine.Validate(Amount, rec."Registration Amount");
                    RecGenJnlLine.Validate("Posting Date", WorkDate());
                    RecGenJnlLine."Bal. Account Type" := RecGenJnlLine."Bal. Account Type"::"Bank Account";
                    RecGenJnlLine."Bal. Account No." := 'WWB - OPERATING';
                    RecGenJnlLine."Applies-to Doc. Type" := RecGenJnlLine."Applies-to Doc. Type"::Invoice;
                    // RecGenJnlLine."Applies-to Doc. No." := RecsalesinvHeader."No.";
                    if RecGenJnlLine.get() then
                        RecGenJnlLine.Modify(true);
                    recGenJnlPostLine.Run(RecGenJnlLine);
                    //  Message('Invoice Generated');
                end;


            }
        }
    }

    var
        myInt: Integer;
}