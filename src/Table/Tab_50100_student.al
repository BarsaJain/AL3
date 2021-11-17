table 50100 Student
{
    DataClassification = ToBeClassified;
    Caption = 'Student';

    fields
    {
        field(1; "No."; Code[10])
        {
            DataClassification = ToBeClassified;

        }

        field(2; Name; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';

        }

        field(3; FirstName; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'First Name';

        }

        field(4; MiddleName; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Middle Name';

        }
        field(5; LastName; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Last Name';
        }
        field(6; Address; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Address';
        }
        field(7; PostCode; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Post Code';
            TableRelation = "Post Code";
        }
        field(8; "Country/RegionCode"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(9; IDProof; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'ID Proof';
            OptionMembers = "PAN Card","Aadhar Card";
        }
        field(10; AdmissionYear; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Admission Year';
        }
        field(11; AcademicYear; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Academic Year';
        }
        field(12; year; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Year';
        }
        field(13; coursecode; code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Course Code';
            TableRelation = CourseLine.Coursecode;
            trigger OnValidate()
            var
                myInt: Integer;
                RecCourseLine: Record CourseLine;
            begin
                //if RecCourseLine.get(coursecode) then
                // "Registration Amount" := RecCourseLine.Amount;
                RecCourseLine.SetRange(Coursecode, coursecode);
                if RecCourseLine.FindSet() then
                    "Registration Amount" := RecCourseLine.Amount;
            end;
        }
        field(14; Semester; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Semester';
        }
        field(15; "Registration Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Registration Amount';
        }
        field(16; "Fee Classification c"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Fee Classification co';
            OptionMembers = "";
        }
        field(17; CustomerNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(18; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Open","Registered";
        }
        field(19; MobileNo; text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mobile No.';
        }
        field(20; AlternateNo; text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Alternate No.';
        }
        field(21; EmaidId; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Email ID';
        }
        field(22; FatherName; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Father"s" Name';
        }
        field(23; MothersName; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mother"s" Name';
        }
        field(24; FathersOccupation; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Father"s" Occupation';
        }
        field(25; "Permanent Address"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Permanent Address';
        }

    }

    keys
    {
        key(Key1; "No.")
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