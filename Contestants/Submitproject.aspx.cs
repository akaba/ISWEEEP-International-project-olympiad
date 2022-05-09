#region imports

using System;
using System.Data;
using System.Drawing;
using System.Web.UI;

#endregion

public partial class Submitproject : Page
{
    private string AbstractCount;
    private bool abstractsubmitted;
    private string ApplicationType;
    private string category;
    private string contestantinfo;
    private bool continuation;
    private bool continuationFormSubmitted;
    private string division;
    private string email;
    private int id;
    private bool isGroupProject;
    private int numberOfContestants;
    private string pCode;
    private string psvid;
    private string researchPaper;
    private string riskformdata;
    private bool RiskFormSubmitted;
    private string status;
    private string svemail;
    private string svlastname;
    private string svname;
    private string title;
    private bool CodeofConductSubmitted;
    private bool MediaReleaseSubmitted;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            id = Convert.ToInt32(Session["pid"].ToString());
        }
        catch (Exception ee)
        {
            //lblMessage.Text = "Session timed out. Please <a href='login.aspx?msj=1'>login</a>  to continue";
            Response.Redirect("login.aspx?msj=1");
            return;
        }
        if (!IsPostBack)
        {
            if (setStatus())
                checkInfo();
        }
    }

    private bool setStatus()
    {
        string status = Session["ProjectStatus"].ToString().Trim();
        if (
            !(status.Equals("saved", StringComparison.OrdinalIgnoreCase) ||
              status.Equals("", StringComparison.OrdinalIgnoreCase)))
        {
            lblMessage.ForeColor = Color.Blue;
            lblMessage.Text = "Your project is currently " + status + "<br>You already submitted your project";
            btnFinish.Visible = false;
            Panel1.Visible = false;
            return false;
        }
        return true;
    }

    private void checkInfo()
    {
        btnFinish.Visible = false;
        Panel1.Visible = false;
        DataGrabber dg = new DataGrabber();
        DataTable dc = dg.DB2Table(AccessDataSource2);
        DataTable dt;
        DataTable contestants;
        try
        {
            dt = dg.DB2Table(AccessDataSource1);
            contestants = dg.DB2Table(AccessDataSource3);
        }
        catch (Exception eee)
        {
            //EmailSender esnn = new EmailSender();
            //esnn.hataYolla(eee.Message);
            lblMessage.Text = "You need to enter all the information before you submit your project." + eee.Message;
            return;
        }

        numberOfContestants = Convert.ToInt32(dt.Rows[0]["numberOfContestants"]);
        title = dt.Rows[0]["title"].ToString();
        division = dt.Rows[0]["division"].ToString();
        category = dt.Rows[0]["category"].ToString();
        email = dt.Rows[0]["email"].ToString();
        pCode = dt.Rows[0]["projectCode"].ToString();
        status = dt.Rows[0]["status"].ToString();
        psvid = dt.Rows[0]["psvid"].ToString();
        riskformdata = dt.Rows[0]["riskformdata"].ToString();
        abstractsubmitted = ((dt.Rows[0]["abstractsubmitted"].ToString()).Equals("true", StringComparison.OrdinalIgnoreCase));
        svname = dt.Rows[0]["svname"].ToString();
        svlastname = dt.Rows[0]["svlastname"].ToString();
        svemail = dt.Rows[0]["svemail"].ToString();
        isGroupProject = ((dt.Rows[0]["groupProject"].ToString()).Equals("true", StringComparison.OrdinalIgnoreCase));
        ApplicationType = dt.Rows[0]["ApplicationType"].ToString();
        continuation = dt.Rows[0]["continuation"].ToString().Equals("true", StringComparison.OrdinalIgnoreCase);
        RiskFormSubmitted = dt.Rows[0]["RiskFormSubmitted"].ToString().Equals("1", StringComparison.OrdinalIgnoreCase);
        AbstractCount = dt.Rows[0]["AbstractCount"].ToString();
        continuationFormSubmitted = dt.Rows[0]["ContinuationFormSubmitted"].ToString().Equals("1", StringComparison.OrdinalIgnoreCase);
                                                                                                  
        researchPaper = dt.Rows[0]["ResearchPaper"].ToString();

        // if contestant information not entered set default false
        if (dc.Rows.Count < 1)
        {
            CodeofConductSubmitted = false;
            MediaReleaseSubmitted = false;
        }
        else
        {
            CodeofConductSubmitted = true;
            MediaReleaseSubmitted = true;
        }


        string MissingCodeofConduct = "";
        string MissingMediaRelease = "";
        // check all for group projects
        foreach (DataRow dataRow in dc.Rows)
        {
            if (!dataRow["CodeofConduct"].ToString().Equals("True", StringComparison.OrdinalIgnoreCase))
            {
                CodeofConductSubmitted = false;
                MissingCodeofConduct = dataRow["FirstName"].ToString() + " " + dataRow["LastName"].ToString();
            }
            if (!dataRow["MediaRelease"].ToString().Equals("True", StringComparison.OrdinalIgnoreCase))
            {
                MediaReleaseSubmitted = false;
                MissingMediaRelease = dataRow["FirstName"].ToString() + " " + dataRow["LastName"].ToString();
            }

        }
      


        int num = contestants.Rows.Count;
        contestantinfo = "";

        for (int i = 0; i < num; i++)
        {
            string nm = contestants.Rows[i]["firstname"].ToString();
            string ln = contestants.Rows[i]["lastname"].ToString();
            string school = contestants.Rows[i]["schoolname"].ToString();
            contestantinfo += "<br>&nbsp;&nbsp;&nbsp;Name:<b> " + nm + " " + ln + "</b> &nbsp;&nbsp;&nbsp;School: <b> " + school + "</b>.";
        }
        string mesaj = "Below is a summary of your project information:<br><hr style='width:500px;text-align:left'>";
        mesaj += "<b>Title:</b> " + title + "<br>";
        mesaj += "<b>Project Code:</b> " + pCode + "<br>";
        mesaj += "<b>Division:</b> " + division + "<br>";
        mesaj += "<b>Category:</b> " + category + "<br>";
        mesaj += "<b>" + printGroupInfo(isGroupProject) + "</b><br>";
        mesaj += "<b>Contestants:</b> " + contestantinfo + "<br>";
        mesaj += "<b>Status:</b> " + status + "<br>";
        mesaj += "<b>Risk Form Data:</b> " + printriskformdata(riskformdata, 1) + "<br>";
        mesaj += "<b>Supervisor's Name:</b> " + svname + " " + svlastname + "<br>";
        mesaj += "<b>Supervisor's Email:</b> " + svemail + "<br>";

        lblInfo.Text = "<span style='line-height:22px'>" +  mesaj + "</span>";

        //start controlling if everything was entered
        string uyari = "Please complete the following before you submit your project:<br><ul>";
        bool uyar = false;
        if (!status.Equals("saved", StringComparison.OrdinalIgnoreCase))
        {
            uyari += "<li style='margin-left:30px'>You need to submit your project information.</li><br>";
            uyar = true;
        }
        if (continuation && continuationFormSubmitted == false)
        {
            uyari += "<li style='margin-left:30px'>You need to submit continuation form.</li><br>";
            uyar = true;
        }
        if (numberOfContestants == 0)
        {
            uyari += "<li style='margin-left:30px'>You need to enter contestant information.<br>";
            uyar = true;
        }
        if (isGroupProject && numberOfContestants < 2)
        {
            uyari += "<li style='margin-left:30px'>This is a group project, you need to register all contestants.<br>";
            uyar = true;
        }
        if (isGroupProject && numberOfContestants > Settings.MaxNumberOfContestantsAllowedForGroupProjects)
        {
            uyari += "<li style='margin-left:30px'>You cannot enter more than  "+ Settings.MaxNumberOfContestantsAllowedForGroupProjects  +" contestants.Please delete extra ones.<br>";
            uyar = true;
        }
        if (!isGroupProject && numberOfContestants != 1)
        {
            uyari +=
                "<li style='margin-left:30px'>This is an individual project, you need to register one contestant.<br>";
            uyar = true;
        }
        if (psvid == null || svemail == "")
        {
            uyari += "<li style='margin-left:30px'>You need to provide your project supervisor information.<br>";
            uyar = true;
        }
        if (abstractsubmitted == false)
        {
            uyari += "<li style='margin-left:30px'>You need to submit your abstract.<br>";
            uyar = true;
        }
        if (researchPaper == "" && ApplicationType != "Qualified")
        {
            uyari += "<li style='margin-left:30px'>You need to submit your research paper.<br>";
            uyar = true;
        }

        /*****************Media release and Code of conduct forms*********/
        // iptal ettik bunlar olmadan da submit edebiliyor
       // if (!CodeofConductSubmitted || !MediaReleaseSubmitted)
       // {
       //     uyari += "<li style='margin-left:30px'> Your parent needs to submit the Media release and Code of conduct forms here:<br/><a href='https://www.isweeep.org/isweeep/parents/login.aspx' target='_blank'>https://www.isweeep.org/isweeep/parents/login.aspx</a>.<br>";
       //     uyar = true;
      //  }
   
        if (uyar)
        {
            uyari += "</ul>";
            lblMessage.Text = uyari;
            return;
        }

        btnFinish.Visible = true;
        Panel1.Visible = true;
    }

    protected void btnFinish_Click(object sender, EventArgs e)
    {
        checkInfo();
        try
        {
            AccessDataSource1.UpdateCommand = "update projects set status='In review' where pid = " + id;
            AccessDataSource1.Update();
            Session["ProjectStatus"] = "in review";

            EmailSender es = new EmailSender();

            //send an email to participants
            string mesaj = "Thank you for registering your project. Below is a summary of your project information:<br>";
            mesaj += "<b>Title:</b> " + title + "<br>";
            mesaj += "<b>Project Code:</b> " + pCode + "<br>";
            mesaj += "<b>Division:</b> " + division + "<br>";
            mesaj += "<b>Category:</b> " + category + "<br>";
            mesaj += "<b>" + printGroupInfo(isGroupProject) + "</b><br>";
            mesaj += "<b>Contestants:</b> " + contestantinfo + "<br>";
            mesaj += "<b>Status:</b> " + "In Review" + "<br>";
            mesaj += "<b>Risk Form Data:</b> " + printriskformdata(riskformdata, 1) + "<br>";
            mesaj += "<b>Supervisor's Name:</b> " + svname + " " + svlastname + "<br>";
            mesaj += "<b>Supervisor's Email:</b> " + svemail + "<br>";
            mesaj +=
                "Your project will be reviewed by the organization committee and you will be notified about your qualification to participate in I-SWEEEP.";
            mesaj += "<br><br><b>I-SWEEEP Organizing Committee</b>";

            if (es.sendMail(mesaj, "ISWEEEP Registration confirmation", "info@isweeep.org", email) == "1")
            {
                lblMessage.Text = "<img src='../images/ok.png'><span style='color:green;border:1px solid red;'>Thank you for submitting your project, you will receive a confirmation email shortly</span>";
                btnFinish.Visible = false;
            }

            //***************************************//

            //also email to project supervisor, risk data needed
            string mesaj2 = "Dear " + svname + " " + svlastname + ",<br>";
            mesaj2 +=
                "Your student registered a project and declared you as the project supervisor. Below is a summary of project information:<br><br>";
            mesaj2 += "<b>Title:</b> " + title + "<br>";
            mesaj2 += "<b>Project Code: " + pCode + "</b><br>";
            mesaj2 += "<b>Division:</b> " + division + "<br>";
            mesaj2 += "<b>Category:</b> " + category + "<br>";
            mesaj2 += "<b>" + printGroupInfo(isGroupProject) + "</b><br>";
            mesaj2 += "<b>Contestants:</b> " + contestantinfo + "<br><br>";
            mesaj2 += "<b>Risk Form Data:</b> " + printriskformdata(riskformdata, 2) + "<br>";
            mesaj2 += "<b>Status:</b> " + "In Review" + "<br>";
            mesaj2 += "<b>Supervisor's Name:</b> " + svname + " " + svlastname + "<br>";
            mesaj2 += "<b>Supervisor's Email:</b> " + svemail + "<br><br>";
            mesaj2 +="If it is required, you can submit the Risk Management Form here:<br/><a href='https://www.isweeep.org/isweeep/projectsv/projectsvlogin.aspx'>https://isweeep.org/isweeep/projectsv/projectsvlogin.aspx</a> <br>";
            mesaj2 += "You can login using your email address and project code.<br>";
            //mesaj2 += "The project will be reviewed by the organization committee and you will be notified about the project's qualification to participate in I-SWEEEP.";
            mesaj2 += "<br><br><b>I-SWEEEP Organizing Committee</b>";

            if (es.sendMail(mesaj2, "ISWEEEP Registration confirmation", "info@isweeep.org", svemail) == "1")
            {
                lblMessage.Text = "<img src='../images/ok.png'><span style='color:green;border:1px solid red;'>Thank you for submitting your project, you will receive a confirmation email shortly</span>";
                btnFinish.Visible = false;
            }
        }
        catch (Exception ec)
        {
            lblMessage.Text = "En error occured please email to info@isweeep.org : " + ec.Message + " - " +
                              ec.StackTrace;
            return;
        }
    }

    private string printGroupInfo(bool isGroup)
    {
        if (isGroup)
        {
            return "This project is a group project";
        }
        else return "This project is an individual project";
        //throw new NotImplementedException();
    }

    private string printriskformdata(string rfdata, int kime)
    {
        string msj = "";
        if (!string.IsNullOrEmpty(rfdata) && rfdata.IndexOf(";") > 0)
        {
            string[] riskData = rfdata.Split(';');

            msj += "This project involves the following(s): ";
            if (contains(riskData, "Hazardous"))
                msj += "Hazardous Devices, Radiation and Laser - ";
            if (contains(riskData, "HumanSubject"))
                msj += "Human Subjects  - ";
            if (contains(riskData, "Animals"))
                msj += "NonHuman Vertabrate Animals - ";
            if (contains(riskData, "Pathogens"))
                msj += "Pathogens - ";
            if (contains(riskData, "Chemicals"))
                msj += "Chemicals and Controlled Substances - ";
        }
        else return "Your project does <u>not</u> require to submit a Risk Management Form";
        if (RiskFormSubmitted)
            return msj += "<br>Risk Management Form was submitted for this project";
        if (kime == 1)
        {
            return msj +
                   "<br><span style='color:blue'>Your project supervisor must fill out Risk Management Form online.</span>";
        }
        else
        {
            return msj +
                   "<br><span style='color:blue'>You must submit Risk Management Form for this project to finalize registration</span>";
        }
    }

    public bool contains(Array ar, string str)
    {
        for (int i = 0; i < ar.Length; i++)
            if (Convert.ToString(ar.GetValue(i)).Equals(str, StringComparison.OrdinalIgnoreCase))
                return true;

        return false;
    }
}