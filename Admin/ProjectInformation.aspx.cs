#region imports

using System;
using System.Web.UI;

#endregion

public partial class Admin_ProjectInformation : Page
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
        else return "";
    }
}