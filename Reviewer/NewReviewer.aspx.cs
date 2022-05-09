using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reviewer_NewReviewer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            bool isadmin = bool.Parse(Session["isReviewAdmin"].ToString());
            if (!isadmin)
                Response.Redirect("Login.aspx");

        }
        catch (Exception err)
        { Response.Redirect("Login.aspx"); }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DataGrabber dg = new DataGrabber();
        ReviewerObj reviewer = new ReviewerObj();
        reviewer.name = dg.getValue(txtFullname);
        reviewer.passcode = dg.getValue(txtpassw);
        reviewer.email = dg.getValue(txtEmail);
        reviewer.isAdmin = chkAdmin.Checked;
        reviewer.area = dg.getValue(txtArea)??"";
        reviewer.affiliation = dg.getValue(txtAff)??"";
        reviewer.countryAssigned = dg.getValue(ddCountry)??""; 
        String sql="";
        try
        {
            sql = String.Format("INSERT INTO Reviewers([name], [password], affiliate, [email], [area], assignedcountry, reviewadmin) values('{0}','{1}','{2}','{3}','{4}','{5}',{6})",
                                        reviewer.name, reviewer.passcode, reviewer.affiliation, reviewer.email, reviewer.area, reviewer.countryAssigned, reviewer.isAdmin.ToString().ToLower());

            dg.ExecuteNonQuery(sql);
            btnadd.Visible = true;
            btnSubmit.Visible = false;
            labMessage.Text = "<b>Reviewer was added successfully.</b>";
            //Response.Redirect("~/Reviewer/manageReviewers.aspx");
        }
        catch (Exception err)
        {
            txtAff.Text = sql + err.StackTrace;
        }

    }
    protected void ddCountry_DataBound(object sender, EventArgs e)
    {
        ddCountry.Items.Insert(0, new ListItem("Assign country", ""));
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        Response.Redirect("newReviewer.aspx");
    }
}
public class ReviewerObj
{
    public String name { get; set; }
    public String passcode { get; set; }
    public String email { get; set; }
    public String affiliation { get; set; }
    public String area { get; set; }
    public String countryAssigned { get; set; }
    public bool isAdmin { get; set; }
}