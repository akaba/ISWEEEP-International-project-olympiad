using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Parents : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int childID;
        try
        {
            childID = Convert.ToInt32(Session["childID"].ToString());
        }
        catch (NullReferenceException)
        {
            Response.Redirect("Login.aspx?msj=1");
            return;
        }
    }
}
