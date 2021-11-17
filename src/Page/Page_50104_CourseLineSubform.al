page 50104 CourseLinesubform
{
    PageType = listpart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = courseLine;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(TypeN; rec.TypeN)
                {
                    ApplicationArea = All;
                }
                field(Coursecode; rec.Coursecode)
                {
                    ApplicationArea = All;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(AcademicYear; rec.AcademicYear)
                {
                    ApplicationArea = All;
                }
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