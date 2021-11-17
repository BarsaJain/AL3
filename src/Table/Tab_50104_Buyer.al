table 50104 Buyer_Table
{
    DataClassification = ToBeClassified;
    Caption = 'Buyer Data';

    fields
    {
        field(1; BuyerId; code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Buyer ID';
        }
        field(2; Name; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';

        }
        field(3; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Amount';
        }
        field(4; Videreference; code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vehicle_Table;
        }
    }

    keys
    {
        key(Key1; BuyerId)
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