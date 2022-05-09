using System;
using System.Data;

public partial class Reviewer_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private DataTable GetDt()
    {
        DataGrabber dg = new DataGrabber();
        string code = dg.getValue(TextBox1);
        string sql = "SELECT * from Reviewers where password = '" + code + "'";
        DataTable dt = dg.ExecuteSelectQuery(sql, Server.MapPath("~/app_data/isweeep.mdb"));
        return dt;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable dt = GetDt();
        if(dt.Rows.Count<1)
        {
            Label1.Text = "Access code is wrong!";
            return;
        }
        string RID = dt.Rows[0]["ID"].ToString();
        string ReviewerName = dt.Rows[0]["Name"].ToString();
        string countryAssigned = dt.Rows[0]["AssignedCountry"].ToString();
        string stateAssigned = dt.Rows[0]["AssignedState"].ToString();
        string categoryAssigned = dt.Rows[0]["AssignedCategory"].ToString();
        bool isReviewAdmin = bool.Parse(dt.Rows[0]["ReviewAdmin"].ToString());
        Session["Reviewer"] = RID;
        Session["ReviewerName"] = ReviewerName;
        Session["countryAssigned"] = countryAssigned;
        Session["stateAssigned"] = stateAssigned;
        Session["categoryAssigned"] = categoryAssigned;
        Session["isReviewAdmin"] = isReviewAdmin;
        if(isReviewAdmin)
            Response.Redirect("managereviewers.aspx");
        else    Response.Redirect("SelectProjects.aspx");
    }
}
