#region imports

using System;
using System.Web.UI;

#endregion

public partial class Logout : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["asvid"] = null;
        Session.Clear();
        Response.Redirect("adultsvlogin.aspx?msj=2");
    }
}