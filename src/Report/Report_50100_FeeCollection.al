report 50100 FeeCollection
{
    UsageCategory = Administration;
    ApplicationArea = All;

    dataset
    {
        dataitem(Student; Student)
        {
            // column(ColumnName; SourceFieldName)
            // {

            // }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;
}