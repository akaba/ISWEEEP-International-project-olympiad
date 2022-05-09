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
    int asvid;
    int pid;
    bool pageOk = true;
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Timeout = 45;
        try
        {
            asvid = Convert.ToInt32(Session["asvid"].ToString());
        }
        catch (Exception err)
        {
            Response.Redirect("adultsvlogin.aspx?msj=1");
            return;
        }
        
        if (IsPostBack == true)
        {            
            try
            {
                DataGrabber dg = new DataGrabber();
                pid = Convert.ToInt32(DropDownList1.SelectedValue);
                
                int i = Convert.ToInt32( dg.ExecuteScalarQuery("select count(*) from contestants where pid=" + pid) );

                if (i >= 2)
                {
                    pageOk = false;
                }
            }
            catch (Exception evv)
            {

                Message2.Text = lblMessage.Text = "Session time out. Please login again" + evv.Message;
                Response.Redirect("adultsvlogin.aspx?msj=1");
                return;
            }
            if (!pageOk)
                lblMessage.Text = "This project has already 3 contestants, you cannot add anymore...";
            else lblMessage.Text = "" ;

            DaySelector1.maxYear = Settings.maxDateOfBirthAllowedForContestants;
            DaySelector1.minYear = Settings.minDateOfBirthAllowedForContestants;

        }
       
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DateTime dob = DaySelector1.Date;

        if (dob.Equals(DateTime.MinValue))
        {
            Message2.Text = lblMessage.Text = "Please enter the date of birth.";
            return;
        }

        string DOB = dob.Year + "/" + dob.Month + "/" + dob.Day;

        lblMessage.Text = ""; Message2.Text = "";
        
        DataGrabber dg = new DataGrabber();
        string fname = dg.getValue(txtFirstName);
        string lname = dg.getValue(txtLastName);
        string mname = (txtMName.Text.Trim().Length > 0) ? txtMName.Text.Trim().Substring(0, 1) : "";
        string gender = ddGender.SelectedValue;
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

        AccessDataSource1.SelectCommand = "select * from contestants  where pid=" + pid + " and lastname='" + lname + "' and firstname = '" + fname + "'"; ;


        if (dg.DB2Table(AccessDataSource1).Rows.Count == 1)
        {
            string UpdateCmd = "Update contestants Set pid = " + pid + ", FirstName='" + fname + "', lastname= '" + lname + "', mi= '" + mname + "', ";
            UpdateCmd += " dob= '" + DOB + "', citizenship= '" + citizenship + "' , gender =  '" + gender + "', [Tshirtsize] =  '" + tShirtSize + "', ";
            UpdateCmd += " schoolname= '" + school + "', street= '" + street + "', ";
            UpdateCmd += " city= '" + city + "', state= '" + state + "', email= '" + email + "', ";
            UpdateCmd += " country= '" + country + "', zipcode= '" + zip + "', phone =  '" + phone + "' ";
            UpdateCmd += " where pid=" + pid + " and lastname='" + lname + "' and firstname = '" + fname + "'";
            AccessDataSource1.UpdateCommand = UpdateCmd;

            try
            {
                AccessDataSource1.Update();
            }
            catch (Exception etc)
            {
                Message2.Text = lblMessage.Text = "Database error! Please contact technical support:" + etc.Message + "\n" + AccessDataSource1.UpdateCommand;
                return;
            }
        }
        else
        {
            string insertCmd = "INSERT INTO Contestants ( pid, Firstname, Lastname, MI, DOB, Gender,[Tshirtsize], SchoolName, Citizenship, Street, City, State, Country, ZipCode, Phone,Email ) values(";
            insertCmd += pid + ", '" + fname + "', '" + lname + "', '" + mname + "', '" + DOB + "', '" + gender + "', '" + tShirtSize + "', '" + school + "', '" + citizenship + "', '" + street + "', '";
            insertCmd += city + "', '" + state + "', '" + country + "', '" + zip + "', '" + phone + "', '" + email + "')";
            AccessDataSource1.InsertCommand = insertCmd;
            try
            {
                AccessDataSource1.Insert();
            }
            catch (Exception etc)
            {
                Message2.Text = lblMessage.Text = "Database error! Please contact technical support:" + etc.Message + "<Br>" + AccessDataSource1.InsertCommand;
                return;
            }
        }

        lblMessage.ForeColor = System.Drawing.Color.Blue;
        Message2.ForeColor = lblMessage.ForeColor;
        Message2.Text = lblMessage.Text = "Your information was successfully saved";
        Response.Redirect("contestants.aspx");
        //HypNext.Visible = true;


    }

    public string correct(string s)
    {
        return s.Replace("'", "''");
    }

    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        DropDownList1.Items.Insert(0, "Select Project");
    }
}
