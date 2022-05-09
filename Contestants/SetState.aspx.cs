using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contestants_SetState : System.Web.UI.Page
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
            Response.Redirect("login.aspx?msj=1");
            return;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int pid = Convert.ToInt32(Session["pid"].ToString());
        string state = ddState.SelectedItem.Text;
        DataGrabber dg = new DataGrabber();

        try
        {
            dg.ExecuteNonQuery("Update projects set state='" + state + "' where pid=" + pid);
            //Session["ProjectStatus"] = "Saved";
            
        }
        catch (Exception err)
        {
            EmailSender es = new EmailSender();
            es.hataYolla("Setstate.aspx de hata olustu" + err.Message);
        }
	Response.Redirect("ProjectInformation.aspx");

    }
}
