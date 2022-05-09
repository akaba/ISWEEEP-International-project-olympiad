#region imports

using System;
using System.Data;
using System.Web.UI;

#endregion

public partial class RiskManagementFormStatus : Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null || Session["admin"].ToString().Length < 5)
        {
            Response.Redirect("logon.aspx?msj=1");
        }
        setStatus();
    }

    private void setStatus()
    {
        DataTable dt;
        try
        {
            dt = ((DataView) AccessDataSource1.Select(DataSourceSelectArguments.Empty)).ToTable();
        }
        catch (DataException)
        {
            return;
        }
        if (dt.Rows.Count > 0)
        {
            string riskdata = dt.Rows[0]["RiskFormData"].ToString();
            if (riskdata.Length < 5)
            {
                lblMessage.Text ="This project does not involve any risks. They do not need to submit a risk management form.";
                
            }
        }
    }
}