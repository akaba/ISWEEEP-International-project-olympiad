using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reviewer_SelectProjectst : System.Web.UI.Page
{
    int reviewerID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ReviewerName"] == null || Session["Reviewer"] == null)
            Response.Redirect("login.aspx");

        reviewerID = Convert.ToInt32(Session["Reviewer"].ToString());
        DsProjects.SelectCommand = @"Select * from ProjectsForReview WHERE (Select Count(1) from Reviews where ProjectId = ProjectsForReview.pid and ReviewerID=" + reviewerID + ") < 1";       

        if (Session["countryAssigned"] != null)
        {
            String country = Session["countryAssigned"].ToString();
            if (string.IsNullOrEmpty(country))
                return;

            DsProjects.SelectCommand += " and  ProjectsForReview.country= '" + country + "'";
        }       

        if (Session["stateAssigned"] != null)
        {
            String state = Session["stateAssigned"].ToString();
            if (string.IsNullOrEmpty(state))
                return;

            DsProjects.SelectCommand += " and  ProjectsForReview.State= '" + state + "'";
        }

        if (Session["categoryAssigned"] != null)
        {
            String category = Session["categoryAssigned"].ToString();
            if (string.IsNullOrEmpty(category))
                return;

            DsProjects.SelectCommand += " and  ProjectsForReview.Category= '" + category + "'";
        }
       // labMessage.Text = DsProjects.SelectCommand;

        //gridProjects.DataBind();
    }
    protected string link(string paperaddress)
    {
        if (paperaddress != "")
            return "<a target='_blank' href='" + paperaddress + "'>Research Paper</a>";
        return "";
    }
    protected void gridProjects_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (gridProjects.SelectedIndex < 0)
            return;
        int pid = Convert.ToInt32(gridProjects.SelectedDataKey.Value);

        DataGrabber dg = new DataGrabber();
        string sql = "";
        try
        {
            sql = "INSERT INTO REVIEWS(reviewerid, projectid, status) VALUES(" + reviewerID + "," + pid + ", 'Not Started') ";
            int rowsEffected = dg.ExecuteNonQuery(sql);
            if (rowsEffected == 1)
            {
                labMessage.Text = "Project was added into your review list.";
                gridProjects.SelectedIndex = -1;
                gridProjects.DataBind();
            }
            else labMessage.Text = "Project cannot be added...";
        }
        catch (Exception err)
        {
            new EmailSender().sendMail(err.StackTrace, "Error in reviewer assignment", "akaba@harmonytx.org", "akaba@harmonytx.org");
            labMessage.Text = "A database error occured and details were sent to I-SWEEEP. Please try again later...sql:  " + sql ;
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int num = int.Parse(DropDownList1.SelectedValue);
        gridProjects.PageSize = num;
    }
    protected void DsProjects_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        
    }
}