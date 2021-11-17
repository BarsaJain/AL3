page 50107 IndiaState
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = IndiaState;
    Caption = 'India States';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Name; rec.state_Name)
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