#region imports

using System;
using System.Web.UI;
using System.Web.UI.WebControls;

#endregion

public partial class Admin_TravelInfo : Page
{
    private string adminname;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            adminname = Session["admin"].ToString();
        }
        catch (Exception ee)
        {
            //lblMessage.Text = "Session timed out. Please <a href='login.aspx?msj=1'>login</a>  to continue";
            Response.Redirect("Logon.aspx?msj=1");
            return;
        }
    }

   
}