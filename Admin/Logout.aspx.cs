#region imports

using System;
using System.Web.UI;

#endregion

public partial class Admin_Logout : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["admin"] = null;
        Response.Redirect("logon.aspx?msj=2");
    }
}