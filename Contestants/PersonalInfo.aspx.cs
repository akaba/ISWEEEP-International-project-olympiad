using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class PersonalInfo : System.Web.UI.Page
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


    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Expires = 60;
        Response.ExpiresAbsolute = DateTime.Now.Subtract(new TimeSpan(1, 0, 0));
        Response.AddHeader("pragma", "no-cache");
        Response.AddHeader("cache-control", "private");
        Response.CacheControl = "no-cache";

        try
        {
            id = Convert.ToInt32(Session["pid"].ToString());
        }
        catch (Exception err)
        {
            Response.Redirect("login.aspx?msj=1");
            return;
        }
        bool pageOk = true;
        if (IsPostBack == false)
        {
            Session.Timeout = 45;
            pageOk = CanAddNewPerson(id);
            if (!pageOk)
                Response.Redirect("Contestants.aspx");
            BindGrades();
            DaySelector1.minYear = Settings.minDateOfBirthAllowedForContestants;
            DaySelector1.maxYear = Settings.maxDateOfBirthAllowedForContestants;
        }
        setStatus();

        if (IsLastNewPerson(id))
        { MyCheckBox.Visible = true; CustomValidator1.Enabled = true; }
        else { MyCheckBox.Visible = false; CustomValidator1.Enabled = false; }
    }

    private bool IsLastNewPerson(int pid)
    {
        DataGrabber dg = new DataGrabber();
        bool isGroupProject;
        object grp = dg.ExecuteScalarQuery("select groupProject from projects where pid=" + pid);
        if (grp == null || Convert.ToBoolean(grp) == false)
        {
            isGroupProject = false;
        }
        else isGroupProject = true;

        int numberOfContestantsRegistered = Convert.ToInt32(dg.ExecuteScalarQuery("select count(*) from contestants where observer=false and pid=" + pid));

        if (isGroupProject && numberOfContestantsRegistered == (Settings.MaxNumberOfContestantsAllowedForGroupProjects-1))
        {
            return true;
        }
        if (!isGroupProject && numberOfContestantsRegistered >= 1)
        {
            return false;
        }
        return false;
    }

    protected void CheckBoxRequired_ServerValidate(object sender, ServerValidateEventArgs e)
    {
        e.IsValid = MyCheckBox.Checked;
    }
        


    private bool CanAddNewPerson(int pid)
    {
        DataGrabber dg = new DataGrabber();
        bool isGroupProject;
        object grp = dg.ExecuteScalarQuery("select groupProject from projects where pid=" + pid);
        if (grp == null || Convert.ToBoolean(grp) == false)
        {
            isGroupProject = false;
        }
        else isGroupProject = true;

        int numberOfContestantsRegistered = Convert.ToInt32(dg.ExecuteScalarQuery("select count(*) from contestants where observer=false and pid=" + pid));

        if (isGroupProject && numberOfContestantsRegistered >= Settings.MaxNumberOfContestantsAllowedForGroupProjects)
        {
            return false;
        }
        if (!isGroupProject && numberOfContestantsRegistered >= 1)
        {
            return false;
        }
        return true;
        
    }

    private void BindGrades()
    {
        ddGrade.Items.Add(new ListItem("Select grade"));
        if (Session["ProjectCountry"].ToString().ToUpper() != "UNITED STATES")
        {
            for (int i = 9; i < 13; i++)
            {
                ddGrade.Items.Add(new ListItem(i.ToString()));
            }
        }
        else
        {
           // DataGrabber dg = new DataGrabber();
           // string division = dg.ExecuteScalarQuery("SELECT DIVISION FROM PROJECTS WHERE PID=" + id).ToString();
           
                for (int i = 9; i < 13; i++)
                {
                    ddGrade.Items.Add(new ListItem(i.ToString()));
                }
            
          
        }

    }

    private void setStatus()
    {
        string status = Session["ProjectStatus"].ToString().Trim();
        if (!(status.Equals("saved", StringComparison.OrdinalIgnoreCase) || status.Equals("", StringComparison.OrdinalIgnoreCase)))
        {
            lblMessage.ForeColor = System.Drawing.Color.Blue;
            lblMessage.Text = "Your project status is currently " + status + "<br>You cannot make changes at this time";
            Button1.Visible = false;
        }

    }

    private void checkInfo()
    {
    
        DataGrabber dg = new DataGrabber();
        DataTable dt;
        DataTable contestants;
        try
        {
            dt = dg.DB2Table(AccessDataSource3);
            contestants = dg.DB2Table(AccessDataSource4);
        }
        catch (Exception eee)
        {
            //EmailSender esnn = new EmailSender();
            //esnn.hataYolla(eee.Message);
            lblMessage.Text = "You need to enter all the information before you submit your project." + eee.Message;
            return;
        }

      
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

    protected void Button1_Click(object sender, EventArgs e)
    {
    

        if (IsValid)
        {
            checkInfo(); 

        if (!CanAddNewPerson(id))
        {
            lblMessage.Text = "This contestant cannot be added, because you already reached the maximum number of contestants you can add...";
            return;
        }
        DateTime dob = DaySelector1.Date;

        if (dob.Equals(DateTime.MinValue))
        {
            Message2.Text = Label1.Text = "Please select the date of birth.";

            return;
        }

        string DOB = dob.Year + "/" + dob.Month + "/" + dob.Day;

        lblMessage.Text = ""; Message2.Text = "";


        DataGrabber dg = new DataGrabber();
        string fname = dg.getValue(txtFirstName);
        string lname = dg.getValue(txtLastName);
        string mname = (txtMName.Text.Trim().Length > 0) ? txtMName.Text.Trim().Substring(0, 1) : "";
        string gender = ddGender.SelectedValue;
        int grade = int.Parse(ddGrade.SelectedValue);
        string citizenship = correct(ddCitizen.SelectedItem.Text);
        string tShirtSize = dg.getValue(ddTshirt);

        string school = dg.getValue(txtSchool);
        string street = dg.getValue(txtStreet);
        string city = dg.getValue(txtCity);
        string state = ddState.SelectedItem.Text;
        string zip = dg.getValue(txtZip);
        string country = correct(ddCountry.SelectedItem.Text);
        string phone = dg.getValue(txtPhone);
        string email = dg.getValue(txtEmail);
        string parentName = dg.getValue((txtParentName));      
        string parentEmail = dg.getValue((txtParentEmail));

        bool Visa_Required = true;

        if (citizenship == "UNITED STATES")
        {
            Visa_Required = false;
        }


        AccessDataSource1.SelectCommand = "select pid, firstname, mi, lastname,dob, gender, citizenship, passportnumber, passportexpdate,[T-shirtsize] from contestants  where pid=" + id + " and lastname='" + lname + "' and firstname = '" + fname + "'"; ;


        if (dg.DB2Table(AccessDataSource1).Rows.Count == 1)
        {
            string UpdateCmd = "Update contestants Set pid = " + id + ", FirstName='" + fname + "', lastname= '" + lname + "', mi= '" + mname + "', ";
            UpdateCmd += " dob= '" + DOB + "', citizenship= '" + citizenship + "' , gender =  '" + gender + "', [Tshirtsize] =  '" + tShirtSize + "', ";
            UpdateCmd += " schoolname= '" + school + "', street= '" + street + "', ";
            UpdateCmd += " city= '" + city + "', state= '" + state + "', email= '" + email + "', " + "', parentEmail= '" + parentEmail + "', parentName= '" + parentEmail + "', ";
            UpdateCmd += " country= '" + country + "', zipcode= '" + zip + "', phone =  '" + phone + "', VisaRequired =  " + Visa_Required + " ";
            UpdateCmd += " where pid=" + id + " and lastname='" + lname + "' and firstname = '" + fname + "'";
            AccessDataSource1.UpdateCommand = UpdateCmd;

            try
            {
                AccessDataSource1.Update();
            }
            catch (Exception etc)
            {
                Message2.Text = lblMessage.Text = "Database error! Please contact technical support:" + etc.Message + "\n" + AccessDataSource1.UpdateCommand;
                HypNext.Visible = false;
                return;
            }
        }
        else
        {
            string insertCmd = "INSERT INTO Contestants ( pid, Firstname, Lastname, MI, DOB, Gender,[Tshirtsize], SchoolName,VisaRequired, Citizenship, Street, City, State, Country, ZipCode, Phone,Email,ParentName,ParentEmail,[Grade] ) values(";
            insertCmd += id + ", '" + fname + "', '" + lname + "', '" + mname + "', '" + DOB + "', '" + gender + "', '" + tShirtSize + "', '" + school + "', " + Visa_Required + ", '" + citizenship + "', '" + street + "', '";
            insertCmd += city + "', '" + state + "', '" + country + "', '" + zip + "', '" + phone + "', '" + email + "', '" +parentName + "', '" + parentEmail + "'," + grade + ")";
            AccessDataSource1.InsertCommand = insertCmd;
            try
            {
                AccessDataSource1.Insert();
            }
            catch (Exception etc)
            {
                Message2.Text = lblMessage.Text = "Database error! Please contact technical support:" + etc.Message + "<Br>" + AccessDataSource1.InsertCommand;
                HypNext.Visible = false;
                return;
            }
        }

        lblMessage.ForeColor = System.Drawing.Color.Blue;
        Message2.ForeColor = lblMessage.ForeColor;
        Message2.Text = lblMessage.Text = "Your information was successfully saved.<br/>Your parent will receive an e-mail from I-SWEEEP  about how to fill out the Media release and Code of conduct forms online.";
        //Send Email to parent
        EmailSender es = new EmailSender();
        string mesaj2 = "Dear " + parentName + ",<br>";
        mesaj2 += "Your child registered a project. Below is a summary of project information:<br><br>";
        mesaj2 += "<b>Title:</b> " + title + "<br>";
        mesaj2 += "<b>Project Code: " + pCode + "</b><br>";
        mesaj2 += "<b>Division:</b> " + division + "<br>";
        mesaj2 += "<b>Category:</b> " + category + "<br>";
        mesaj2 += "<b>" + printGroupInfo(isGroupProject) + "</b><br/>";
        mesaj2 += "<b>Contestant:</b> " + fname + " " + lname + "<br>";
        mesaj2 += "<b>School:</b> " + school + "<br>";
        mesaj2 += "<b>Risk Form Data:</b> " + printriskformdata(riskformdata, 1) + "<br>";
        mesaj2 += "<b>Status:</b> " + "Saved" + "<br><br>";

        mesaj2 += "<b>!You need to submit the Media release and Code of conduct forms here:<b/><br/><a href='https://www.isweeep.org/isweeep/parents/login.aspx'>https://www.isweeep.org/isweeep/parents/login.aspx</a> <br>";
        //mesaj2 += "The project will be reviewed by the organization committee and you will be notified about the project's qualification to participate in I-SWEEEP.";
        mesaj2 += "<br><br><b>I-SWEEEP Organizing Committee</b>";

        if (es.sendMail(mesaj2, "I-SWEEEP required parent forms", "info@isweeep.org", parentEmail) == "1")
        {
            //lblMessage.Text = "<img src='../images/ok.png'><span style='color:green;border:1px solid red;'>Thank you for submitting your project, you will receive a confirmation email shortly</span>";
            lblMessage.Text = "eamail sent";
        }
        //Send Email to parent 

    Response.Redirect("contestants.aspx");
        //HypNext.Visible = true;



        }
        else
            // page is not valid
        {
            return;
        }

    }

    public string correct(string s)
    {
        return s.Replace("'", "''");
    }

}
