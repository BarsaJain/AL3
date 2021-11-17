page 50106 USState
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = USState;
    Caption = 'US states';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Name; rec.State_Name)
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}