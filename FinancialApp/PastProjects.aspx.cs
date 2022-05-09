#region imports

using System;
using System.Web.UI;
using System.Web.UI.WebControls;

#endregion

public partial class FinancialApp : Page
{
    private int cid;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            cid = Convert.ToInt32(Session["FinanceCid"].ToString());

        }
        catch (NullReferenceException )
        {
            Response.Redirect("financialapplication.aspx?msj=1");
            return;
        }
    }


}