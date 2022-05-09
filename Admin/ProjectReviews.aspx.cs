using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProjectReviews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null || Session["admin"].ToString().Length < 5)
        {
            Response.Redirect("logon.aspx?msj=1");
        }
        if (!IsPostBack)
        {
            string pids = Request.QueryString["pid"] as string;
            if (string.IsNullOrEmpty(pids))
                return;
            int pid = Convert.ToInt32(pids);
            DataGrabber dg = new DataGrabber();
            object title = dg.ExecuteScalarQuery("select title from projects where pid=" + pid, Server.MapPath("~/app_data/isweeep.mdb"));

            Label2.Text = title.ToString();

        }
    }

}
