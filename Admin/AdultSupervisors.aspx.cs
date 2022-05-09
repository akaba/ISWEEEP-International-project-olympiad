#region imports

using System;
using System.Web.UI;

#endregion

public partial class Admin_AdultSupervisors : Page
{
    string adultsv;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("Logon.aspx?msj=1");
            return;
        }
        adultsv = Request.QueryString["asvid"];
    }


    protected void AdultSupBox_DataBound(object sender, EventArgs e)
    {
        AdultSupBox.SelectedValue = adultsv;
    }
    protected void AdultSupBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        AccessDataSource1.SelectCommand = "SELECT * FROM AdultSupervisors Where ASVID=" + AdultSupBox.SelectedValue;
        GridView1.DataBind();
        //Response.Redirect("AdultSupervisors.aspx?id=" + AdultSupBox.SelectedValue);
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.PageSize = int.Parse(DropDownList1.SelectedValue);
        GridView1.DataBind();
    }
}