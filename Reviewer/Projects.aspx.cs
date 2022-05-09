using System;

public partial class Reviewer_Projects : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ReviewerName"] == null)
            Response.Redirect("login.aspx");
    }
    protected string link(string paperaddress)
    {
        if (paperaddress != "")
            return "<a target='_blank' href='" + paperaddress + "'>Research Paper</a>";
        return "";
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        title.Text = "<b>Selected Project:</b><b style='padding:0px;color:maroon;'>" + 
            GridView1.SelectedRow.Cells[1].Text + "</b>";
    }
    protected void FormView1_ItemUpdated(object sender, System.Web.UI.WebControls.FormViewUpdatedEventArgs e)
    {
        if(e.AffectedRows==1 && e.NewValues["Status"].ToString() == "Completed")
        {
            string emailtext = "New review from " + Session["ReviewerName"].ToString();
            emailtext += "<br>" + title.Text;
            emailtext += "<br>Score:" + e.NewValues["Score"].ToString();
            emailtext += "<br>Comments:" + e.NewValues["Comments"].ToString();

            EmailSender es = new EmailSender();
            es.sendMail(emailtext, "New review from " + Session["ReviewerName"].ToString(), "info@isweeep.org", "info@isweeep.org");
        }
        GridView1.DataBind();
    }
    protected void GridView1_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.Cells[6].Text == "Completed")
            e.Row.Cells[0].Enabled = false;
    }
}
