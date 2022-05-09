using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_EditProjectSupervisor : System.Web.UI.Page
{
    string projectsv;
    string pid;
    private bool RiskFormSubmitted;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("Logon.aspx?msj=1");
            return;
        }
        projectsv = Request.QueryString["id"];
        pid = Request.QueryString["pid"];
    }

   

    public void DetailsView1ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        String oldSVemail = e.OldValues["SVemail"].ToString();
        String newSVemail = e.NewValues["SVemail"].ToString();


        if (oldSVemail.ToLower() != newSVemail.ToLower())
        {
            //Label2.Text = oldSVemail + ' ' + newSVemail;

            EmailSender es = new EmailSender();

            DataGrabber dg = new DataGrabber();



            DataTable dt = dg.ExecuteSelectQuery("Select * FROM SubmitProject where pid=" + pid);
            DataTable contestants = dg.ExecuteSelectQuery("SELECT * FROM projectContestants WHERE pid=" + pid);



            string title = dt.Rows[0]["title"].ToString();
            string division = dt.Rows[0]["division"].ToString();
            string category = dt.Rows[0]["category"].ToString();
            //email = dt.Rows[0]["email"].ToString();
            string pCode = dt.Rows[0]["projectCode"].ToString();
            //status = dt.Rows[0]["status"].ToString();
            //psvid = dt.Rows[0]["psvid"].ToString();
            string riskformdata = dt.Rows[0]["riskformdata"].ToString();
            //abstractsubmitted = ((dt.Rows[0]["abstractsubmitted"].ToString()).Equals("true", StringComparison.OrdinalIgnoreCase));
            string svname = dt.Rows[0]["svname"].ToString();
            string svlastname = dt.Rows[0]["svlastname"].ToString();
            string svemail = dt.Rows[0]["svemail"].ToString();
            bool isGroupProject = ((dt.Rows[0]["groupProject"].ToString()).Equals("true", StringComparison.OrdinalIgnoreCase));
            //ApplicationType = dt.Rows[0]["ApplicationType"].ToString();
            //continuation = dt.Rows[0]["continuation"].ToString().Equals("true", StringComparison.OrdinalIgnoreCase);
            RiskFormSubmitted = dt.Rows[0]["RiskFormSubmitted"].ToString().Equals("1", StringComparison.OrdinalIgnoreCase);
            //AbstractCount = dt.Rows[0]["AbstractCount"].ToString();
            //continuationFormSubmitted = dt.Rows[0]["ContinuationFormSubmitted"].ToString().Equals("1", StringComparison.OrdinalIgnoreCase);

            int num = contestants.Rows.Count;
            string contestantinfo = "";

            for (int i = 0; i < num; i++)
            {
                string nm = contestants.Rows[i]["firstname"].ToString();
                string ln = contestants.Rows[i]["lastname"].ToString();
                string school = contestants.Rows[i]["schoolname"].ToString();
                contestantinfo += "<br>&nbsp;&nbsp;&nbsp;Name:<b> " + nm + " " + ln + "</b> &nbsp;&nbsp;&nbsp;School: <b> " + school + "</b>.";
            }



            //also email to project supervisor, risk data needed
            string mesaj2 = "Dear " + svname + " " + svlastname + ",<br>";
            mesaj2 += "Your student registered a project and declared you as the project supervisor. Below is a summary of project information:<br><br>";
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
            mesaj2 += "If it is required, you can submit the Risk Management Form here:<br/><a href='https://www.isweeep.org/isweeep/projectsv/projectsvlogin.aspx'>https://isweeep.org/isweeep/projectsv/projectsvlogin.aspx</a> <br>";
            mesaj2 += "You can login using your email address and project code.<br>";
            //mesaj2 += "The project will be reviewed by the organization committee and you will be notified about the project's qualification to participate in I-SWEEEP.";
            mesaj2 += "<br><br><b>I-SWEEEP Organizing Committee</b>";

            if (es.sendMail(mesaj2, "ISWEEEP Registration confirmation", "info@isweeep.org", svemail) == "1")
            {
                Label2.Text = "<img src='../images/ok.png'><span style='color:green;border:1px solid red;'>Email sent to project supervisor.</span>";
                //btnFinish.Visible = false;
            }

        }
        else
        {
            Label2.Text = "";
        }

        

    }

    public string printGroupInfo(bool isGroup)
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