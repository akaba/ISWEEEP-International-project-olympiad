#region imports

using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.HtmlControls;

#endregion

public partial class Admin_logon : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["msj"] == "1")
        {
            Label1.ForeColor = Color.Red;
            Label1.Text = "You need to login to continue";
        }
        else if (Request.QueryString["msj"] == "2")
        {
            Label1.ForeColor = Color.Blue;
            Label1.Text = "You logged out succesfully";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dv = (DataView) AccessDataSource1.Select(DataSourceSelectArguments.Empty);

        if (dv.Table.Rows.Count < 1)
        {
            Label1.Text = "Your login information is incorrect please try again.";
            Session["admin"] = null;
            return;
        }

        if (dv.Table.Rows.Count == 1)
        {
            string name = ((dv.Table.Rows[0]["username"].ToString()));
            Session["admin"] = name;      
            Response.Redirect("projects.aspx");
       
        }
    }
}