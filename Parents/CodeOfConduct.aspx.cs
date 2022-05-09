using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Parents_Code_of_conduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataGrabber dg = new DataGrabber();
        DataTable dt  = dg.ExecuteSelectQuery("Select codeOfConduct,ParentName from contestants where contestantID = " + int.Parse(Session["ChildID"].ToString()));
        object formfilled = dt.Rows[0]["codeOfConduct"];
        object parentName = dt.Rows[0]["ParentName"];
        if (formfilled != null && bool.Parse(formfilled.ToString()))
        {
            lblMessage.Text = "You (" + parentName +") already accepted code of conduct form agreement.";
            txtParentName.Text = parentName.ToString();
            btnAccept.Visible = false;
        }
            
    }
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        DataGrabber dg = new DataGrabber();
        try
        {
            dg.ExecuteNonQuery("Update contestants set codeOfConduct=true, Parentname= '" + dg.getValue(txtParentName) + "' where contestantID = " + int.Parse(Session["ChildID"].ToString()));
            lblMessage.Text = "Your response was saved. Thank you.";
            btnAccept.Visible =  false;
        }
        catch (Exception err)
        {
            lblMessage.Text = "Your response cannot be saved, please try again later.";
            new EmailSender().hataYolla("Error in code of conduct form: " + err.Message);
        }
    }
    protected void btnDecline_Click(object sender, EventArgs e)
    {
        DataGrabber dg = new DataGrabber();
        try
        {
            dg.ExecuteNonQuery("Update contestants set codeOfConduct=false where contestantID = " + int.Parse(Session["ChildID"].ToString()));
            lblMessage.Text = "Your response was saved. Thank you.";
            btnAccept.Visible  = false;

        }
        catch (Exception err)
        {
            lblMessage.Text = "Your response cannot be saved, please try again later.";
            new EmailSender().hataYolla("Error in code of conduct form: " + err.Message);
        }
        new EmailSender().sendMail("Code of conduct form was declined by parent.", "Contestant:" + Session["ChildName"], "info@isweeep.org", "info@isweeep.org");
    }
}