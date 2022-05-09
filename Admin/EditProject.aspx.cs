using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_EditProject : System.Web.UI.Page
{
    string project;

    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["admin"] == null)
        {
          Response.Redirect("Logon.aspx?msj=1");
           return;
        }

        project = Request.QueryString["id"];
    }

    protected void ProjectBox_DataBound(object sender, EventArgs e)
    {
        ProjectBox.SelectedValue = project;
    }

    protected void ProjectBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("EditProject.aspx?id=" + ProjectBox.SelectedValue);       
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
        if (numReviews == 0)
            return "No reviews";
        else return "<a target='_blank' href='./projectreviews.aspx?pid=" + Convert.ToInt32(pid) + "'>" + numReviews + " Reviews</a>";

    }
    protected string GetAbstract(string abstractSubmitted, string pidStr)
    {
        if (string.IsNullOrEmpty(abstractSubmitted) || string.IsNullOrEmpty(pidStr))
            return "";
        if (Convert.ToBoolean(abstractSubmitted))
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