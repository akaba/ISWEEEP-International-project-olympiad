#region imports

using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

#endregion

public partial class FormStatuses : Page
{
    private int id;

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
        setRiskFormStatus();
        setParentFormsStatus();
    }

    private void setParentFormsStatus()
    {
        if (Session["ProjectStatus"].ToString() != "Qualified")
        {
            GridView1.Visible = false;
            
        }
    }


    private void setRiskFormStatus()
    {
        DataGrabber dg = new DataGrabber();
        DataTable dt = dg.ExecuteSelectQuery(
            "SELECT  [HazardousDescription], [RisksInvolved], [SafetyPrecautions], [DisposalProcedure], [RiskFormStatus] FROM [RiskForms] WHERE [pid] = " +
            id);
        if(dt.Rows.Count == 1)
        {
            DataRow dr = dt.Rows[0];

            lblRMForm.Text = "<span style='color:blue'>Risk Management form status: " + dr["RiskFormStatus"].ToString().ToUpper() + "</span><br><br>"; 
            lblRMForm.Text += "&nbsp;&nbsp;&nbsp;Description of hazardous items: " + dr["HazardousDescription"] + "<br><br>";
            lblRMForm.Text += "&nbsp;&nbsp;&nbsp;Risks involved: " + dr["RisksInvolved"] + "<br><br>";
            lblRMForm.Text += "&nbsp;&nbsp;&nbsp;Safety Precautions: " + dr["SafetyPrecautions"] + "<br><br>";
            lblRMForm.Text += "&nbsp;&nbsp;&nbsp;Disposal Procedure: " + dr["DisposalProcedure"] + "<br><br>";
        }
        else if(dt.Rows.Count == 0 && Session["ProjectRiskFormRequired"].ToString().Equals("True", StringComparison.OrdinalIgnoreCase))
        {
            lblRMForm.Text = "Your supervisor needs to submit the risk management form for your project.<br/><br/> Your supervisor will receive an e-mail from I-SWEEEP about how to fill out the online form <u>after you submit your project</u>.";
            lblRMForm.ForeColor = Color.Red;
        }
        else if (Session["ProjectRiskFormRequired"].ToString().Equals("False", StringComparison.OrdinalIgnoreCase))
        {
            lblRMForm.Text = "Your project does not require risk management form";
        }

        
    }

  
}