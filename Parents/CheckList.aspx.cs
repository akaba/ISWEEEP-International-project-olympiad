using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Parents_CheckList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataGrabber dg = new DataGrabber();
        DataTable dt = dg.ExecuteSelectQuery("Select codeOfConduct,MediaRelease, ParentName from contestants where contestantID = " + int.Parse(Session["ChildID"].ToString()));
        object COCfilled = dt.Rows[0]["codeOfConduct"];
        object MRfilled = dt.Rows[0]["MediaRelease"];
        object parentName = dt.Rows[0]["ParentName"];
        if (COCfilled != null && bool.Parse(COCfilled.ToString()))
        {
            lblChecklist.Text = "You already accepted code of conduct form agreement.";
        }
        else
        {
            lblChecklist.Text = "<b style='color:red'>You need to accept code of conduct form agreement.</b>";
        }

        if (MRfilled != null && bool.Parse(MRfilled.ToString()))
        {
            lblChecklist.Text += "<br/><br/> You already accepted Media Release Form agreement.";
        }
        else
        {
            lblChecklist.Text += "<br><b style='color:red'>You need to accept Media Release Form agreement.</b>";
        }
    }
}