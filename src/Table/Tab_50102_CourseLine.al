table 50102 CourseLine
{
    DataClassification = ToBeClassified;
    Caption = 'Course Line';

    fields
    {
        field(1; TypeN; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Type';
            OptionMembers = "Registration Fee","Tution Fee","Installment 1","Instailment 2";
        }
        field(2; Coursecode; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Course Code';
        }
        field(3; Description; Text[80])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
        field(4; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; AcademicYear; Text[20])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; TypeN, Coursecode)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}