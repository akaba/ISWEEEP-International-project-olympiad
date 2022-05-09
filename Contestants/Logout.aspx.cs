#region imports

using System;
using System.Web.UI;

#endregion

public partial class Logout : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["pid"] = null;
        Session["ProjectStatus"] = null;
        Response.Redirect("login.aspx?msj=2");
    }
}