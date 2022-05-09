using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Contestants_ProjectStatus : System.Web.UI.Page
{
    int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            id = Convert.ToInt32(Session["pid"].ToString());
        }
        catch (Exception ee)
        {
            Response.Redirect("login.aspx?msj=1");
        }
        SetProjectStatus();

        SetFinancialAppStatus();

        //SetRecommendedProjectStatus();
    }

    private void SetRecommendedProjectStatus()
    {
        if (Session["ApplicationType"].ToString() == "Recommended" && Session["ProjectStatus"].ToString() == "Qualified")
        {
            DataGrabber dg = new DataGrabber();

            object scholarship = dg.ExecuteScalarQuery(@"SELECT  [Scholarship] 
                            FROM projects WHERE  pid=" + id, Server.MapPath("~/app_data/isweeep.mdb"));

            string scholarshipStatus = scholarship.ToString();
            lblScholarshipstatus.Text = "<b style='font-size:12pt;color:blue'>Scholarship Status:</b><br>";
            if (string.IsNullOrEmpty(scholarshipStatus))
            {
                lblScholarshipstatus.Text += "In review";
            }

            if (scholarshipStatus == "Awarded")
            {
                lblScholarshipstatus.Text += Settings.scholarshipAwardedMessage;
            }
            else if (scholarshipStatus == "Not Awarded")
            {
                lblScholarshipstatus.Text += Settings.scholarshipNotAwardedMessage;
            }
        }
        else lblScholarshipstatus.Visible = false;
    }

    private void SetProjectStatus()
    {
        if (Session["ProjectStatus"] != null && Session["ProjectStatus"].ToString() != "")
        {
            string status = Session["ProjectStatus"].ToString().ToUpper().Trim();
            if (status == "QUALIFIED")
                lblProjectStatus.Text = "<h3>Congratulations! Your project has been QUALIFIED for I-SWEEEP " + Settings.CurrentYear + "</h3>"
                    + "<br><br>Please make sure that you complete all required forms. <a href='FormStatuses.aspx'>Click here to check status of form submission.</a>";
            else if (status == "IN REVIEW")
                lblProjectStatus.Text = "<h3>Your project is currently IN REVIEW.</h3> Please check this page later again.";
            else if (status == "NOT QUALIFIED")
                lblProjectStatus.Text = @"<h3>Your project has NOT been QUALIFIED.</h3> 
                                It has been reviewed by I-SWEEEP review committee and 
                                unfortunately your project is not eligible to participate in ISWEEEP " + Settings.CurrentYear ;
            else if (status == "WAITING LIST")
            {
                lblProjectStatus.Text = @"<h3>Your project is currently IN WAITING LIST.</h3> 
                                It has been reviewed by I-SWEEEP review committee and
                                put into the waiting list. If we have openings, you will be contacted by I-SWEEEP representatives.
                                ";
            }
            else lblProjectStatus.Text = status;
        }
        else lblProjectStatus.Text = "Your project information was not saved yet. <a href='ProjectInformation.aspx'> Click here</a> to save project information";
    }

    private void SetFinancialAppStatus()
    {
        string status = Session["ProjectStatus"].ToString();
        if (status == "Not Qualified")
            return;
        DataGrabber dg = new DataGrabber();

        DataTable dt = dg.ExecuteSelectQuery(@"select [FirstName], [LastName],[amountawarded], [status] 
                            from FinancialAppResults WHERE  pid=" + id, Server.MapPath("~/app_data/isweeep.mdb"));

        if (dt.Rows.Count < 1)
        {
            lblFstatus.Visible = false;
            return;
        }
        lblFstatus.Visible = true;
        lblFstatus.Text = "<b style='font-size:12pt;color:blue'>Financial Application Status:</b><br> <br>";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string name = dt.Rows[i]["FirstName"] + " " + dt.Rows[i]["LastName"];
            string amount = dt.Rows[i]["amountawarded"].ToString();
            string appStatus = dt.Rows[i]["status"].ToString();

            if (appStatus == "Submitted") appStatus = "In Review";

            lblFstatus.Text += "<b>Applicant:</b>" + name + "<br>";
            lblFstatus.Text += "<b>Status:</b>" + appStatus + "<br>";
            if (appStatus == "Awarded")
                lblFstatus.Text += "<b>Amount Awarded:$</b>" + amount + "<br><br><br>";

        }

    }
}
