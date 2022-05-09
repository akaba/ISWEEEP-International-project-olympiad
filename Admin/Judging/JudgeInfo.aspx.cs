#region imports

using System;
using System.Web.UI;

#endregion

public partial class Admin_Judging_JudgeInfo : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count == 1)
        {
            GridView1.SelectedIndex = 0;
            GridView2.DataBind();
        }
        else
        {
            GridView1.SelectedIndex = -1;
        }
        if (GridView1.Rows.Count > 0)
        {
            Button2.Visible = true;
        }
        else Button2.Visible = false;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (GridView1.SelectedIndex > -1)
        {
            judgeData.DeleteCommand = "delete from judgeAssignments where judgeId=" + (int) GridView1.SelectedValue;
            int rows = judgeData.Delete();
            Label1.Text = rows + " assignments were deleted<br>";
        }
        else Label1.Text = "Nothing selected<br>";
    }
}