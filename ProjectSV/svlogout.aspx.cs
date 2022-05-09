#region imports

using System;
using System.Web.UI;

#endregion

public partial class ProjectSV_Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["PSVpid"] = null;
        Session["PSVId"] = null;
        Session.Clear();
        Response.Redirect("projectsvlogin.aspx?msj=2");
    }
}