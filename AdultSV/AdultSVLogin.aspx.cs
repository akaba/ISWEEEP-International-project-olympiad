#region imports

using System;
using System.Data;
using System.Web.UI;

#endregion

public partial class AdultSVLogin : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["msj"] == "1")
            lblMessage.Text = "Session timed out. Please login to continue";
        else if (Request.QueryString["msj"] == "2")
            lblMessage.Text = "You logged out successfully";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dv = (DataView) AccessDataSource1.Select(DataSourceSelectArguments.Empty);

        if (dv.Table.Rows.Count < 1)
        {
            lblMessage.Text = "Your login information is incorrect please try again.";
            return;
        }

        if (dv.Table.Rows.Count == 1)
        {
            int id = int.Parse((dv.Table.Rows[0]["asvid"].ToString()));
            string name  = dv.Table.Rows[0]["ASVName"].ToString() +" "+ dv.Table.Rows[0]["ASVLastName"].ToString();
            //bool submitted = Boolean.Parse(dv.Table.Rows[0]["submitted"].ToString());
            //if (submitted == true)
            //{
            //    lblMessage.Text = "You already finished and submitted the process. Please email to info@isweeep.org if anything needs to be changed.";
            //    return;
            //}
            Session["asvname"] = name;
            Session["asvid"] = id;
            Response.Redirect("adultsupervisorinfo.aspx");
        }
    }
}