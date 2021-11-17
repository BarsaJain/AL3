page 50105 CourseList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CourseHeader;
    Caption = 'Course List';
    CardPageId = CourseMaster;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = All;

                }

                field(CourseCode; rec.CourseCode)
                {
                    ApplicationArea = All;

                }

                field(Description; rec.Description)
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