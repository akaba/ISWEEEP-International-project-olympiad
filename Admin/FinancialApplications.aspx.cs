#region imports

using System;
using System.Web.UI;

#endregion

public partial class Admin_FinancialApplications : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.PageSize = int.Parse(DropDownList1.SelectedValue);
        GridView1.DataBind();
    }
    protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        //e.NewValues.Add("ID", GridView1.DataKeys[GridView1.EditIndex].Value);
    }
}