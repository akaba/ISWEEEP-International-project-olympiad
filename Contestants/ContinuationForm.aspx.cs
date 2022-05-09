using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContinuationForm : System.Web.UI.Page
{
	int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            id = Convert.ToInt32(Session["pid"].ToString());
        }
        catch (Exception ee)
        {
            //lblMessage.Text = "Session timed out. Please <a href='login.aspx?msj=1'>login</a>  to continue";
            Response.Redirect("login.aspx?msj=1");
            return;
        }
    }
    protected void AccessDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
            FormView1.ChangeMode(FormViewMode.Insert);
    }
    
    protected void setTitle()
    {
        if (FormView1.CurrentMode == FormViewMode.Insert)
        {
            string sql = "select title from projects where pid=" + Convert.ToInt32(Session["pid"]);
            DataGrabber dg = new DataGrabber();
            string title = dg.ExecuteScalarQuery(sql, Server.MapPath("~/app_data/isweeep.mdb")).ToString();

            TextBox t = (TextBox)FormView1.FindControl("CurrentTitleTextBox");
            if (t != null && title != null)
            {
                //Label1.Text = t.ClientID;
                t.Text = title;
                t.Enabled = false;
            }
        }
    }
    
    protected void FormView1_DataBound(object sender, EventArgs e)
    {
        setTitle();
    }
}
