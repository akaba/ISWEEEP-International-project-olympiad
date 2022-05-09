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

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        DateTime thisDay = DateTime.Today;
        DateTime Deadline = new DateTime(thisDay.Year, 4, 1, 12, 0, 0);
        int result = DateTime.Compare(Deadline, thisDay);
        if (result < 0)
        {
            Button1.Visible =false;
            lblMessage.Text = "<h2>Project Registration is over for this year. <br/>Registration will start in Early OCTOBER.</h2>";
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            DataGrabber dg = new DataGrabber();
            string title = dg.getValue(txtTitle);
            string email = dg.getValue(txtEmail);
            if (title == "" || email == "")
            {
                lblMessage.Text = "Please enter the email address...";
                return;
            }

            string state = ddState.SelectedItem.Text;
            string country = ddCountry.SelectedItem.Text;

            if (country.Equals("UNITED STATES") && state.Equals("Select State"))
            {
                lblMessage.Text = "Please select your state to continue.";
                return;
            }

            if (state.Equals("Select State") || !country.Equals("UNITED STATES"))
            {
                state = "";
            }

            try
            {
                AccessDataSource1.SelectCommand = "select pid from projects where title = '" + title + "'";

                DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
                if (dv.Table.Rows.Count > 0)
                {
                    lblMessage.Text = "A project with the same title was already registered.<br>Please provide a different title for this project. ";
                    return;
                }


            }
            catch (Exception ee)
            {
                lblMessage.Text = "Sorry, there is a Database error!...Please email to technical support." + ee.Message;
                return;
            }


            try
            {
                string projectCode = assignCode();
                AccessDataSource1.InsertCommand = "insert into projects(projectCode,title, email,country,state, ApplicationType) VALUES('" + projectCode + "', '" + title + "', '" + email + "', '" + country + "', '" + state + "', 'Individual')";
                AccessDataSource1.Insert();
                lblMessage.Text = "Your project code: " + projectCode;
            }
            catch (Exception etc)
            {
                lblMessage.Text = "-->Database error!...Information could not be saved. Please try again." + etc.Message;
                return;

            }
            string pCode = "";
            //make sure everything is written to database and correct
            try
            {
                AccessDataSource1.SelectCommand = "select pid, projectCode from projects where title = '" + title + "' and email = '" + email + "'";

                DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
                int no = int.Parse(dv.Table.Rows[0][0].ToString());
                pCode = (dv.Table.Rows[0][1].ToString());

                Session.Add("PID", no);
                Session.Add("PCode", pCode);

                //send email here (title, code, password)

            }
            catch (Exception ee)
            {
                lblMessage.Text = "Your information was successfully saved but there is a Database error!...Please email to technical support.";
                EmailSender snd = new EmailSender();
                snd.hataYolla("Hata in register.aspx: " + ee.Message);
                return;
            }

            string mesaj = "Thank you for submitting your project title ( " + title + " )";
            mesaj += "<br>Country: " + country;
            mesaj += "<br>State: " + state;

            mesaj += "<br>Your project code is:<b> " + pCode;
            mesaj += " </b><br>You need to login  by entering your email address and this code<br>";
            mesaj += "Please click <a href='https://www.isweeep.org/isweeep/contestants/login.aspx'>here</a> to login and register your project.<br><br>";
            mesaj += "<b>I-SWEEEP Organizing Committee</b>";

            EmailSender es = new EmailSender();
            if (es.sendMail(mesaj, "I-Sweeep Project Registration", "info@isweeep.org", email) == "1")
            {

                lblMessage.ForeColor = System.Drawing.Color.Blue;
                lblMessage.Text = "<br/>Thank you for submitting your project title. <br/>To complete your project registration, please check your email and follow the steps.";
                lblMessage.Text += "<br/><span style=\'color:maroon;font-size:9pt;margin-top:15px\'>If you do not receive an email in 5 minutes, please check the spam folder on your email service's website (gmail.com, hotmail.com, yahoo.com etc) and mark it as 'not spam' or add info@isweeep.org as a contact." +
                "If you still cannot find registration email, send an email to info@isweeep.org in order to receive your project code.</span>";
                Button1.Visible = false;
            }


        }
        else {
            lblMessage.Text = "Please correct above errors to continue.";
            return;
        }

	

    }

    private string assignCode()
    {
        string code = "";
        
        Random r = new Random();
        int n1 = r.Next(65, 90);
        int n2 = r.Next(65, 90);
        int n3 = r.Next(48, 57);
        int n4 = r.Next(65, 90);
        int n5 = r.Next(65, 90);
        int n6 = r.Next(65, 90);
        int n7 = r.Next(48, 57);

        code = new string(new char[] { (char)n1, (char)n2, (char)n3, (char)n4, (char)n5, (char)n6, (char)n7 });
            
        
        return code;
        //throw new NotImplementedException();
    }

    protected void ddCountry_DataBound(object sender, EventArgs e)
    {
        ddCountry.Items.Insert(0,new ListItem("UNITED STATES","UNITED STATES"));
        ddCountry.Items.Insert(0, new ListItem("Select Country", "Select Country"));
    }
}
