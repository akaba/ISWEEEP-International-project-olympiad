#region imports

using System;
using System.Web.UI;

#endregion

public partial class Admin_Finished_Traves : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.PageSize = int.Parse(DropDownList1.SelectedValue);
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (doBtnListExportOptions.SelectedIndex == 0)
        {
            GridView1.AllowPaging = false;
            GridView1.DataBind();
        }
        GridViewExportUtil.Export("Finished Travel plans.xls", GridView1);
    }
}