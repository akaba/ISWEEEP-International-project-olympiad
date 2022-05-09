using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Parents_Media_Release : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataGrabber dg = new DataGrabber();
        DataTable dt = dg.ExecuteSelectQuery("Select mediaRelease,ParentName from contestants where contestantID = " + int.Parse(Session["ChildID"].ToString()));
        object formfilled = dt.Rows[0]["mediaRelease"];
        object parentName = dt.Rows[0]["ParentName"];
        if (formfilled != null && bool.Parse(formfilled.ToString()))
        {
            lblMessage.Text = "You already accepted Media Release form agreement.";
            btnAccept.Visible = false;
        }

    }
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        DataGrabber dg = new DataGrabber();
        try
        {
            dg.ExecuteNonQuery("Update contestants set mediaRelease=true where contestantID = " + int.Parse(Session["ChildID"].ToString()));
            lblMessage.Text = "Your response was saved. Thank you.";
            btnAccept.Visible = false;
        }
        catch (Exception err)
        {
            lblMessage.Text = "Your response cannot be saved, please try again later.";
            new EmailSender().hataYolla("Error in Media Release form: " + err.Message);
        }
    }
    protected void btnDecline_Click(object sender, EventArgs e)
    {
        DataGrabber dg = new DataGrabber();
        try
        {
            dg.ExecuteNonQuery("Update contestants set mediaRelease=false where contestantID = " + int.Parse(Session["ChildID"].ToString()));
            lblMessage.Text = "Your response was saved. Thank you.";
            btnAccept.Visible = false;

        }
        catch (Exception err)
        {
            lblMessage.Text = "Your response cannot be saved, please try again later.";
            new EmailSender().hataYolla("Error in mediaRelease: " + err.Message);
        }
        new EmailSender().sendMail("mediaRelease form was declined by parent.", "Contestant:" + Session["ChildName"], "info@isweeep.org", "info@isweeep.org");
    }
}