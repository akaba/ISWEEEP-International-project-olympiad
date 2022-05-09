#region imports

using System;
using System.Web.UI;

#endregion

public partial class ProjectDetails : UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
		
        if (Session["Reviewer"]==null && (Session["admin"] == null || Session["admin"].ToString().Length < 5) )
        {
            Response.Redirect("logon.aspx?msj=1");
        }
    }

    protected string link(string paperaddress)
    {
        if (paperaddress != "")
            return "<a target='_blank' href='" + paperaddress + "'>Research Paper</a>";
        else return "Not Submitted";
    }
    protected string getRiskFormData(object rskData, object formSubmitted, object pid)
    {
        string html = "";
        if (rskData != null && !string.IsNullOrEmpty(rskData.ToString()))
        {
            html += rskData.ToString();
            if (Convert.ToInt32(formSubmitted) > 0)
                html += "  ( <a target='_blank' href='./riskmanagementformstatus.aspx?pid=" + Convert.ToInt32(pid) + "'>Risk Form</a> )";
            else html += "  ( Form not submitted )";
        }
        else
        {
            //html += "No risks";
            if (Convert.ToInt32(formSubmitted) > 0)
                html += "  ( <a target='_blank' href='./riskmanagementformstatus.aspx?pid=" + Convert.ToInt32(pid) + "'>Risk Form</a> )";
        }
        return html;
    }
    protected string getReviews(object reviews, object pid)
    {
        int numReviews = Convert.ToInt32(reviews);
        if( numReviews == 0 )
            return "No reviews";
        else return "<a target='_blank' href='./projectreviews.aspx?pid=" + Convert.ToInt32(pid) + "'>" + numReviews + " Reviews</a>";
        
    }
    protected string GetAbstract(string abstractSubmitted, string pidStr)
    {
        if (string.IsNullOrEmpty(abstractSubmitted) || string.IsNullOrEmpty(pidStr) )
            return "";
        if(Convert.ToBoolean(abstractSubmitted) )
            return "<a target='_blank' href='./abstracts.aspx?id=" + Convert.ToInt32(pidStr) + "'>Abstract</a>";
        else return "Not Submitted";
    }
    protected string getASV(string asvid)
    {
        if (asvid != "")
            return "<a target='_blank' href='./travelinfo.aspx?asvid=" + asvid + "'>TravelInfo</a>";
        else return "";
    }

}