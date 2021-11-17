table 50101 CourseHeader
{
    DataClassification = ToBeClassified;
    Caption = 'Course Header';

    fields
    {
        field(1; "No."; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'No.';
        }
        field(2; CourseCode; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Course Code';

        }
        field(3; Description; Text[80])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
        field(4; DurationOfcourse; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Duration of Course in months';
        }
    }

    keys
    {
        key(Key1; "No.", CourseCode)
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