#region imports

using System;
using System.Web.UI;

#endregion

public partial class financialApp : MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void logout(object sender, EventArgs e)
    {
        Session["FinanceCid"] = null;
        Session["FinancePid"] = null;
        Session.Clear();
        Response.Redirect("FinancialApplication.aspx?msj=1");
    }

}