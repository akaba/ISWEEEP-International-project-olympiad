#region imports

using System;
using System.Web.UI;
using System.Web.UI.WebControls;

#endregion

public partial class Admin_Volunteers : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void AccessDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label1.Text = e.AffectedRows.ToString();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.PageSize = int.Parse(DropDownList1.SelectedValue);
        GridView1.DataBind();
    }
}