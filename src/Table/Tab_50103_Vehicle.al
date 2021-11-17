table 50103 Vehicle_Table
{
    DataClassification = ToBeClassified;
    Caption = 'Vehicle Data';

    fields
    {
        field(1; Vehicle_ID; code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'ID';

        }
        field(2; Vehicle_Name; Text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';

        }
        field(3; Manufacturing_Date; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Manufacturing Date';

        }
        field(4; color; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","Red","Blue","Yellow";

        }
        field(5; Price; Decimal)
        {
            DataClassification = ToBeClassified;


        }
        field(6; NoOfUnits; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'No Of Units';

        }
        field(7; Mfg_Country; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","India","US";
            Caption = 'Manufacturing Country';
        }
        field(8; State; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'State';
            TableRelation = if (Mfg_Country = const(India)) "Country/Region";

        }


    }

    keys
    {
        key(Key1; Vehicle_ID)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Vehicle_ID, Vehicle_Name) { }
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