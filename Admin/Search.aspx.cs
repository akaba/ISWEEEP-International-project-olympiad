#region imports

using System;
using System.Web.UI;

#endregion

public partial class Admin_Search : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string s = Request.QueryString["s"] as string;
        try
        {
            if (s != null && s.Length < 5)
            {
                int i;
                if (int.TryParse(s,out i))
                {
                    Response.Redirect("projectinformation.aspx?id=" + s);
                }
                return;
            }
        }
        catch (FormatException f)
        {
            
        }

        GridView1.DataBind();
        Page.RegisterHiddenField("__EVENTTARGET", "btnSearch");
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("search.aspx?s=" + TextBox1.Text);
    }
}