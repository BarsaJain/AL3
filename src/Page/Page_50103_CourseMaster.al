page 50103 CourseMaster
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = courseHeader;
    Caption = 'Course Master';

    layout
    {
        area(Content)
        {
            group(GroupName)
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
                field(DurationOfcourse; rec.DurationOfcourse)
                {
                    ApplicationArea = All;

                }

            }


            part(courseLinesubform; CourseLinesubform)
            {
                SubPageLink = Coursecode = field(CourseCode);
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}