#region imports

using System;
using System.Web.UI;

#endregion

public partial class Admin_Judging_ProjectInfo : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
    }
}