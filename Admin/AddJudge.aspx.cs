using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddJudge : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (IsValid)
        {

            DataGrabber dg = new DataGrabber();

            string fname = dg.getValue(txtFirstName);
            string lname = dg.getValue(txtLastName);
            string email = dg.getValue(txtEmail);
            string phone = dg.getValue(txtPhone);
            string company = dg.getValue(txtCompany);
            string position = dg.getValue(txtPosition);

            bool checkin = false;
            if (CheckBox1.Checked) checkin = true;



            AccessDataSource1.SelectCommand = "select * from judges where JEmail='" + email + "' and JudgeName='" + fname + "' and JudgeLastName = '" + lname + "'";

            try
            {

                if (dg.DB2Table(AccessDataSource1).Rows.Count > 0)
                {
                    Label1.Text = "A judge with the same email and name was already registered. ";
                    return;

                }
            }
            catch (Exception ee)
            {
                Label1.Text = "Sorry, there is a Database error!...Please email to technical support." + ee.Message;
                return;
            }

            //record the judge
            try
            {
                string cmdInsert ="INSERT INTO Judges ( JudgeName, JudgeLastName, JPhone, JEmail, CompanyName, [Position],Checkin) ";
                cmdInsert += " values('" + fname + "', '" + lname + "', '" + phone + "', '" + email + "', '" + company + "', '" + position + "',"+checkin+")";                            

                AccessDataSource1.InsertCommand = cmdInsert;
                AccessDataSource1.Insert();
                Label1.Text = fname + " " + lname + " recorded sucessfully";
            }
            catch (Exception etc)
            {
                Label1.Text = "-->Database error!...Information could not be saved. Please try again." + etc.Message;
                return;
            }





        }
    }
    protected void ButtonClear_Click(object sender, EventArgs e)
    {
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtEmail.Text = "";
        txtPhone.Text = "";
        txtCompany.Text = "";
        txtPosition.Text = "";
    }
}