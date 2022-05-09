#region imports

using System;
using System.Web.UI;

#endregion

public partial class Admin_admin : MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null || Session["admin"].ToString().Length < 5)
       {
            Response.Redirect("logon.aspx?msj=1");
       }
        if (!IsPostBack)
            Labelname.Text = "&nbsp;&nbsp;" + Session["admin"].ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text.Length > 1)
        {
            Response.Redirect("Search.aspx?s=" + TextBox1.Text);
        }
        else TextBox1.Text = "input more chars";
    }


    protected void ddpreviosyears_SelectedIndexChanged(object sender, EventArgs e)
    {
        //string mylink = "https://www.isweeep.org/" + ddpreviosyears.SelectedValue + "/admin/logon.aspx";
        //Response.Redirect(mylink);
    }
}