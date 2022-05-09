#region imports

using System;
using System.Data;
using System.Drawing;
using System.Web.UI;

#endregion

public partial class ProjectSVContact : Page
{
    private int pid;
    private int svid;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            svid = Convert.ToInt32(Session["PSVId"].ToString());
            pid = Convert.ToInt32(Session["PSVpid"].ToString());
        }
        catch (NullReferenceException)
        {
            Response.Redirect("projectSvLogin.aspx?msj=1");
            return;
        }
        if (!IsPostBack)
            Fill();
    }

    private void Fill()
    {
        DataGrabber dg = new DataGrabber();

        AccessDataSource2.SelectCommand = "select * from riskforms where pid=" + pid;
        DataTable dt = dg.DB2Table(AccessDataSource2);

        if (dt.Rows.Count < 1)
            return;

        string description = dt.Rows[0]["HazardousDescription"].ToString();
        string risks = dt.Rows[0]["RisksInvolved"].ToString();
        string precautions = dt.Rows[0]["SafetyPrecautions"].ToString();
        string disposal = dt.Rows[0]["DisposalProcedure"].ToString();
        string status = dt.Rows[0]["riskformstatus"].ToString();

        TextBox1.Text = description;
        TextBox2.Text = risks;
        TextBox3.Text = precautions;
        TextBox4.Text = disposal;

       // if (status.Equals("submitted", StringComparison.OrdinalIgnoreCase))
       // {
       //     Button1.Visible = false;
       //     Button2.Visible = false;
       //     lblMessage.Text = "Risk form was already submitted for this project, you cannot make changes at this time";
       //     return;
      //  }

        //throw new NotImplementedException();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button2.Visible = false;
        lblMessage.Text = "";
        if (CheckBox1.Checked == false)
        {
            lblMessage.Text = "You need to accept the agreement";
            return;
        }

        DataGrabber dg = new DataGrabber();
        string description = dg.getValue(TextBox1);
        string risks = dg.getValue(TextBox2);
        string precautions = dg.getValue(TextBox3);
        string disposal = dg.getValue(TextBox4);

        AccessDataSource2.SelectCommand = "select * from riskforms where pid=" + pid;
        DataTable dt = dg.DB2Table(AccessDataSource2);
        if (dt.Rows.Count == 1)
        {
            string updCmd = "update riskforms set ";
            updCmd += "HazardousDescription = '" + description + "', ";
            updCmd += "RisksInvolved = '" + risks + "', ";
            updCmd += "SafetyPrecautions = '" + precautions + "', ";
            updCmd += "DisposalProcedure = '" + disposal + "', ";
            updCmd += "RiskFormStatus = '" + "Saved" + "' where pid= " + pid;

            try
            {
                AccessDataSource2.UpdateCommand = updCmd;
                AccessDataSource2.Update();
            }
            catch (Exception ext)
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "En error occured, please try again or email to info@isweeep.org: " + ext.Message;
                EmailSender es = new EmailSender();
                es.hataYolla("Risk Form Page Error:" + ext.Message);
                return;
            }
            if (description == "" || precautions == "" || risks == "")
            {
                lblMessage.Text =
                    "Risk Form was successfully saved... Before you submit, you must fill out at least the first 3 fields";
            }
            else
            {
                lblMessage.ForeColor = Color.Blue;
                lblMessage.Text = "Risk Form was successfully saved.<br>";
                lblMessage.Text +=
                    "If you finished editing, please submit the form. After you submit the form, you cannot make any more changes.";
                Button2.Visible = true;
            }
        }
        else
        {
            string insertCmd =
                "insert into riskforms(pid,HazardousDescription,RisksInvolved,SafetyPrecautions,DisposalProcedure,RiskFormStatus) values(";
            insertCmd += pid + ", '";
            insertCmd += description + "', '";
            insertCmd += risks + "', '";
            insertCmd += precautions + "', '";
            insertCmd += disposal + "', '";
            insertCmd += "Saved" + "')";

            try
            {
                AccessDataSource2.InsertCommand = insertCmd;
                AccessDataSource2.Insert();
            }
            catch (Exception ext)
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "En error occured, please try again or email to info@isweeep.org:" + ext.Message;
                EmailSender es = new EmailSender();
                es.hataYolla("Risk Form Error checkpoint 2: " + ext.Message);
                return;
            }
            if (description == "" || precautions == "" || risks == "")
            {
                lblMessage.Text =
                    "Risk Form was successfully saved. Before you submit, you must fill out at least the first 3 fields";
            }
            else
            {
                lblMessage.ForeColor = Color.Blue;
                lblMessage.Text = "Risk Form was successfully saved.<br>";
                lblMessage.Text +=
                    "If you finished editing, please submit the form. After you submit the form, you cannot make any more changes.";
                Button2.Visible = true;
            }
        }
    }

    protected string printriskformdata(object riskdata)
    {
        string msj = "";// "This project involves the following(s): <br>";
        string rfdata = riskdata.ToString();
        if (!string.IsNullOrEmpty(rfdata))
        {
            string[] riskData = rfdata.Split(';');

            msj += "This project involves the following(s): <br>"; ;
            if (contains(riskData, "Hazardous"))
                msj += "Hazardous Devices, Radiation and Laser <br> ";
            if (contains(riskData, "HumanSubject"))
                msj += "Human Subjects  <br> ";
            if (contains(riskData, "Animals"))
                msj += "NonHuman Vertabrate Animals <br> ";
            if (contains(riskData, "Pathogens"))
                msj += "Pathogens <br>  ";
            if (contains(riskData, "Chemicals"))
                msj += "Chemicals and Controlled Substances <br> ";
        }
        else
        {
            msj += "This project does not involve any risks, you do not need to fill the risk management form.";
        }
        return msj;
    }

    public bool contains(Array ar, string str)
    {
        for (int i = 0; i < ar.Length; i++)
            if (Convert.ToString(ar.GetValue(i)).Equals(str, StringComparison.OrdinalIgnoreCase))
                return true;

        return false;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string updCmd = "update riskforms set ";
        updCmd += "RiskFormStatus = '" + "Submitted" + "' where pid= " + pid;

        try
        {
            AccessDataSource2.UpdateCommand = updCmd;
            AccessDataSource2.Update();
        }
        catch (Exception ext)
        {
            lblMessage.ForeColor = Color.Red;
            lblMessage.Text = "En error occured, please try again or email to info@isweeep.org: " + ext.Message;
            EmailSender es = new EmailSender();
            es.hataYolla(ext.Message);
            return;
        }

        DataGrabber dg = new DataGrabber();
        DataTable dt = dg.DB2Table(AccessDataSource1);

        if (dt.Rows.Count > 0)
        {
            string projectTitle = dt.Rows[0]["title"].ToString();
            string projectEmail = dt.Rows[0]["email"].ToString();

            EmailSender esn = new EmailSender();
            string msj = "Risk Management Form was Submitted for project id:" + pid + "<br>Project title: " +
                         projectTitle + "<br> <a href='https://www.isweeep.org/isweeep/admin/riskmanagementformstatus.aspx?pid=" + pid + "'>View form</a>";
            msj += "<br><br><b>ISWEEEP Organizing Committee.</b>";
            esn.sendMail(msj, "Risk Management Form submission", "info@isweeep.org", "info@isweeep.org");

            string msj2 = "Risk Management Form was submitted for your project with title: " + projectTitle;
            msj2 += "<br><br><b>ISWEEEP Organizing Committee.</b>";
            esn.sendMail(msj2, "ISWEEEP Risk managament form submission", "info@isweeep.org", projectEmail);
        }

        lblMessage.ForeColor = Color.Blue;
        lblMessage.Text =
            "Thank you for submitting the Risk Management Form. Click <a href='svlogout.aspx?msj=2'>here</a> to logout. ";
        Button1.Visible = false;
        Button2.Visible = false;
    }
}