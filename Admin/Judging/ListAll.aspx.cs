#region imports

using System;
using System.Web.UI;

#endregion

public partial class Admin_Judging_ListAll : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.PageSize = int.Parse(DropDownList1.SelectedValue);
        GridView1.DataBind();
    }
}