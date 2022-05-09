#region imports

using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

#endregion

public partial class ProjectInformation : Page
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
            lblMessage.Text = "Session timed out. Please <a href='login.aspx?msj=1'>login</a>  to continue";
            Response.Redirect("login.aspx?msj=1");
            return;
        }
        if (!IsPostBack)
        {
            Label1.Visible = false;
            fill();
            setStatus();
        }
    }

    private void setStatus()
    {
        string status = Session["ProjectStatus"].ToString().Trim();
        if (
            !(status.Equals("Saved", StringComparison.OrdinalIgnoreCase) ||
              status.Equals("", StringComparison.OrdinalIgnoreCase)))
        {
            lblMessage.ForeColor = Color.Blue;
            lblMessage.Text = "Your project status is currently " + status + "<br>You cannot make changes at this time";

            string riskInfo = "";
            if (chkHazard.Checked) riskInfo += "Hazardous;";
            if (chkPathogens.Checked) riskInfo += "Pathogens;";
            if (ChkNonHuman.Checked) riskInfo += "Animals;";
            if (ChkHuman.Checked) riskInfo += "HumanSubject;";
            if (ChkChemicals.Checked) riskInfo += "Chemicals;";

            if (riskInfo != "")
                btnSubmit.Visible = false;
            ChkAccept.Visible = false;
            chkReview.Visible = false;
			chkCOC.Visible = false;
            btnSubmit.Visible = false;
        }
        if (status != "")
        {
            ChkAccept.Checked = true;
            chkReview.Checked = true;
			chkCOC.Checked = true;
        }
        string ProjectCountry = Session["ProjectCountry"].ToString();

        //if (ProjectCountry.CompareTo("UNITED STATES") != 0)
        //{
        //    ddDivision.Items.Clear();
        //    ddDivision.Items.Add(new ListItem("Senior (9-12 Grades)", "Senior"));
        //}
    }

    protected void fill()
    {
        DataGrabber dg = new DataGrabber();
        DataTable dt;
        try
        {
            dt = dg.DB2Table(AccessDataSource1);
        }
        catch (Exception et)
        {
            lblMessage.Text = "Error, no such project exist...";
            return;
        }
        if (dt.Rows.Count > 0)
        {
            string status = dt.Rows[0]["status"].ToString();
            if (status.Equals("In Review", StringComparison.OrdinalIgnoreCase) ||
                status.Equals("Submitted", StringComparison.OrdinalIgnoreCase))
            {
                  lblMessage.Text = "Your project is in review process. You cannot make any changes at this time.";
                  btnSubmit.Visible = false;
            }


            txtTitle.Text = dt.Rows[0]["title"].ToString();

            //ddDivision.SelectedValue = dt.Rows[0]["Division"].ToString();
            ddCategory.SelectedValue = dt.Rows[0]["Category"].ToString();
            txtScfName.Text = dt.Rows[0]["RegionalName"].ToString();
            RadioContinuation.SelectedIndex = dt.Rows[0]["continuation"].ToString().Equals("True", StringComparison.OrdinalIgnoreCase) ? 1 : 0;
            RadioButtonList1.SelectedIndex = dt.Rows[0]["RegionalParticipation"].ToString().Equals("True", StringComparison.OrdinalIgnoreCase) ? 1 : 0;
            RadioButtonList2.SelectedIndex = dt.Rows[0]["GroupProject"].ToString().Equals("True", StringComparison.OrdinalIgnoreCase) ? 0 : 1;
            RadioButtonList3.SelectedIndex = dt.Rows[0]["ElectricityRequired"].ToString().Equals("True", StringComparison.OrdinalIgnoreCase) ? 1 : 0; 
                                                
            string[] riskData = dt.Rows[0]["RiskFormData"].ToString().Split(';');

            chkHazard.Checked = contains(riskData, "Hazardous");
            ChkHuman.Checked = contains(riskData, "HumanSubject");
            ChkNonHuman.Checked = contains(riskData, "Animals");
            chkPathogens.Checked = contains(riskData, "Pathogens");
            ChkChemicals.Checked = contains(riskData, "Chemicals");
        }
    }

    public bool contains(Array ar, string str)
    {
        for (int i = 0; i < ar.Length; i++)
            if (Convert.ToString(ar.GetValue(i)).Equals(str, StringComparison.OrdinalIgnoreCase))
                return true;

        return false;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (chkReview.Checked == false)
            {
                lblMessage.Text = "You must review the rules & guidelines";
                return;
            }
            if (ChkAccept.Checked == false)
            {
                lblMessage.Text = "You must accept entry agreement to register your project";
                return;
            }
            if (chkCOC.Checked == false)
            {
                lblMessage.Text = "You must accept Code of Conduct and Legal Disclaimer ";
                return;
            }
            lblMessage.Text = "";

            DataGrabber dg = new DataGrabber();



            string title = dg.getValue(txtTitle);
            string riskInfo = "";
            if (chkHazard.Checked) riskInfo += "Hazardous;";
            if (chkPathogens.Checked) riskInfo += "Pathogens;";
            if (ChkNonHuman.Checked) riskInfo += "Animals;";
            if (ChkHuman.Checked) riskInfo += "HumanSubject;";
            if (ChkChemicals.Checked) riskInfo += "Chemicals;";

            //bool isRiskFormSubmitted = false;

            if (riskInfo == "")
            {
                Session["ProjectRiskFormRequired"] = false;
                Label1.Visible = false;
            }
            else
            {
                Session["ProjectRiskFormRequired"] = true;
                string queryForRiskForm = "select count(*) from riskforms where pid=" + id;
                int NumRiskForms = (Int32)dg.ExecuteScalarQuery(queryForRiskForm, Server.MapPath("~/app_data/isweeep.mdb"));
                if (NumRiskForms == 0)
                    Label1.Visible = true;
            }

            string division = "Senior";
            string category = dg.getValue(ddCategory);

            bool continuation = false;
            if (RadioContinuation.SelectedIndex == 1)
            {
                continuation = true;
                Session["ProjectIsContinuation"] = true;
            }
            else
            {
                continuation = false;
                Session["ProjectIsContinuation"] = false;
            }

            string scfName = "";
            bool regionalPart = false;
            if (RadioButtonList1.SelectedIndex == 1)
            {
                regionalPart = true;
                scfName = dg.getValue(txtScfName);
            }

            bool electricity = false;
            if (RadioButtonList3.SelectedIndex == 1) electricity = true;

            bool groupProject = false;
            if (RadioButtonList2.SelectedIndex == 0) groupProject = true;


            string updateCmd = "update projects set ";
            updateCmd += "title = '" + title + "', ";
            updateCmd += "division = '" + division + "', ";
            updateCmd += "category = '" + category + "', ";
            updateCmd += "electricityrequired = " + electricity + ", ";
            updateCmd += "regionalparticipation = " + regionalPart + ", ";
            updateCmd += "regionalname = '" + scfName + "', ";
            updateCmd += "status = '" + "Saved" + "', ";
            updateCmd += "riskformdata = '" + riskInfo + "', ";
            updateCmd += "groupProject = " + groupProject + ", ";
            updateCmd += "continuation = " + continuation + "";
            updateCmd += " where pid = " + id;
            try
            {
                AccessDataSource1.UpdateCommand = updateCmd;
                AccessDataSource1.Update();
            }
            catch (Exception ett)
            {
                lblMessage.Text = "Database error: " + ett.Message;
                return;
            }
            Session["ProjectStatus"] = "saved";

            lblMessage.ForeColor = Color.Blue;
            lblMessage.Text =
                "<div style='background-color:white;text-align:center;border:2px solid red;margin-top:10px'>Your project information has been saved, <a style='color:blue' href='contestants.aspx'>click here</a> to enter contestant information</div>";

        }
        else {

            lblMessage.Text ="<div style='background-color:white;text-align:center;border:2px solid red;margin-top:10px'>!! You must provide all the required information </div>";

        }
        }
}