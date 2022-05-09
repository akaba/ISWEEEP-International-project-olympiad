using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Parents_Login : System.Web.UI.Page
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
        DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);

        if (dv.Table.Rows.Count < 1)
        {
            lblMessage.Text = "<br>Provided Information does not match any records. Please try again.";
            return;
        }

        if (dv.Table.Rows.Count == 1)
        {
            int childID = int.Parse((dv.Table.Rows[0]["contestantID"].ToString()));

            bool codeOfConductSubmitted = Boolean.Parse(dv.Table.Rows[0]["CodeOfConduct"].ToString());
            bool MediaReleaseSubmitted = Boolean.Parse(dv.Table.Rows[0]["MediaRelease"].ToString());
            if (codeOfConductSubmitted && MediaReleaseSubmitted)
            {
                lblMessage.Text = "<br>You already finished and submitted the code of conduct and media release forms for this contestant. <br>Please email to info@isweeep.org if anything needs to be changed.";
                return;
            }

            Session["childID"] = childID;
            Session["ChildName"] = new DataGrabber().toTitleCase(  dv.Table.Rows[0]["firstname"] + " " + dv.Table.Rows[0]["lastname"] );
            Response.Redirect("checklist.aspx");
        }
    }
}