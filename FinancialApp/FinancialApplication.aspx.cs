#region imports

using System;
using System.Data;
using System.Web.UI;

#endregion

public partial class FinancialApplication : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && Request.QueryString.Count > 1 && Request.QueryString[0].Equals("1"))
            lblMessage.Text = "You logged out successfully.";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DataGrabber dg = new DataGrabber();
        DataTable dt = dg.DB2Table(AccessDataSource1);

        if (dt.Rows.Count < 1)
        {
            lblMessage.Text = "Login information is incorrect, please try again";
            return;
        }

        int contestantId = Convert.ToInt32(dt.Rows[0]["contestantId"]);
        int pid = Convert.ToInt32(dt.Rows[0]["pid"]);

        AccessDataSource1.SelectCommand = "select * from FinancialApplications where ApplicantID=" + contestantId;
        if (dg.DB2Table(AccessDataSource1).Rows.Count > 0)
        {
            lblMessage.Text = "You already submitted your financial application";
            return;
        }
        Session["FinancePid"] = pid;
        Session["FinanceCid"] = contestantId;

        Response.Redirect("FamilyInformation.aspx");
    }
}