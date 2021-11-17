table 50106 USState
{
    DataClassification = ToBeClassified;
    Caption = 'US';

    fields
    {
        field(1; State_Name; Text[50])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; State_Name)
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