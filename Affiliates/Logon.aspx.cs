using System;
using System.Data;
using System.Drawing;
using System.Web.UI;

public partial class Affiliates_Logon : System.Web.UI.Page
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
        else if (Request.QueryString["msj"] == "3")
        {
            Label1.ForeColor = Color.Blue;
            Label1.Text = "You Project Limit was not set. Please email us at info@isweeep.org to request it.";
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);

        if (dv.Table.Rows.Count < 1)
        {
            Label1.Text = "Your login information is incorrect please try again.";
            Session["orguname"] = null;
            return;
        }

        if (dv.Table.Rows.Count == 1)
        {
            string uname = ((dv.Table.Rows[0]["user_name"].ToString()));
            string orgid = ((dv.Table.Rows[0]["ID"].ToString()));

            Session["orguname"] = uname;
            Session["orgid"] = orgid;

            Response.Redirect("EditAccount.aspx?msj=1");
            //Response.Redirect("contestants.aspx?pid=" + id);
        }
    }
}