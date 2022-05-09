#region imports

using System;
using System.Data;
using System.Drawing;
using System.Web.UI;

#endregion

public partial class ProjectSupervisor : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["msj"] == "1")
        {
            lblMessage.ForeColor = Color.Red;
            lblMessage.Text = "You need to login to continue";
        }
        else if (Request.QueryString["msj"] == "2")
        {
            lblMessage.ForeColor = Color.Blue;
            lblMessage.Text = "You logged out succesfully";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        DataGrabber dg = new DataGrabber();

        try
        {
            DataTable dt = dg.DB2Table(AccessDataSource1);
            if (dt.Rows.Count > 0)
            {
                int svid = Convert.ToInt32(dt.Rows[0]["svid"]);
                int pid = Convert.ToInt32(dt.Rows[0]["pid"]);

                Session["PSVId"] = svid;
                Session["PSVpid"] = pid;
            }
            else
            {
                lblMessage.Text = "Login unsuccessful, no such project code exists for this email address.";
                return;
            }
        }
        catch (Exception evv)
        {
            lblMessage.Text = "Login unsuccessful, database error: " + evv.Message;
            EmailSender es = new EmailSender();
            es.hataYolla("Project Supervisor Login Error (for test): " + evv.Message);
            return;
        }

        Response.Redirect("RiskFormSubmission.aspx");
    }
}