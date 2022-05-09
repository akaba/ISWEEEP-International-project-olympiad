#region imports

using System;
using System.Web.UI;

#endregion

public partial class Parents_Logout : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("Login.aspx?msj=2");
    }
}