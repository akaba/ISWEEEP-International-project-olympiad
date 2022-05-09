#region imports

using System;
using System.Data;
using System.Drawing;
using System.Web.UI;

#endregion

public partial class AdultSupervisor : Page
{
    private int asvid;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            asvid = Convert.ToInt32(Session["asvid"].ToString());
        }
        catch (Exception ee)
        {
            //lblMessage.Text = "Session timed out. Please <a href='login.aspx?msj=1'>login</a>  to continue";
            Response.Redirect("adultsvlogin.aspx?msj=1");
            return;
        }
        if (!IsPostBack) fill();
    }

    protected void ToggleDone(object sender, EventArgs e)
    {
        if (VisaCheckBox.Checked)
                    {
                        LabelVisa.Text = "*Required";
                        lbtxtPassportNo.Text = "*";
                        lbtxtPassportExp.Text = "*";
                        RequiredFieldValidator4.Enabled = true;
                        RequiredFieldValidator5.Enabled = true;
                    }
                    else
                    {
                        LabelVisa.Text = "*Not Required";
                        lbtxtPassportNo.Text = "";
                        lbtxtPassportExp.Text = "";
                        RequiredFieldValidator4.Enabled = false;
                        RequiredFieldValidator5.Enabled = false;
                    }
    }

    private void fill()
    {
        DataGrabber dg = new DataGrabber();
        DataTable dt = dg.DB2Table(AccessDataSource1);
        string addr = "";
        if (dt.Rows.Count == 1)
        {
            txtFirstName.Text = dt.Rows[0]["asvname"].ToString();
            txtLastName.Text = dt.Rows[0]["asvlastname"].ToString();
            txtEmail.Text = dt.Rows[0]["asvemail"].ToString();
            txtFax.Text = dt.Rows[0]["asvfax"].ToString();
            txtPhone.Text = dt.Rows[0]["asvphone"].ToString();
            addr = dt.Rows[0]["asvaddress"].ToString();
            ddCitizen.SelectedValue = dt.Rows[0]["asvcitizenship"].ToString();
            VisaCheckBox.Checked = ((dt.Rows[0]["VisaRequired"].ToString()).Equals("true", StringComparison.OrdinalIgnoreCase));
            if (((dt.Rows[0]["VisaRequired"].ToString()).Equals("true", StringComparison.OrdinalIgnoreCase)))
            {
                LabelVisa.Text = "*Required";
            }
            else
            {
                LabelVisa.Text = "*Not Required";
            }

            ddGender.SelectedValue = dt.Rows[0]["gender"].ToString();
            ddTshirt.SelectedValue = dt.Rows[0]["TShirtSize"].ToString();
            txtPassportExpDate.Text = dt.Rows[0]["PassportExpDate"].ToString();
            txtPassportNo.Text = dt.Rows[0]["PassportNumber"].ToString();
        }
        if (addr != "")
        {
            string[] adresler = addr.Split(';');
            txtStreet.Text = adresler[0];
            if (adresler.Length == 5)
            {
                txtCity.Text = adresler[1].Trim();
                txtState.Text = adresler[2].Trim();
                txtZip.Text = adresler[3].Trim();
                ddCountry.SelectedValue = adresler[4].Trim();
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";

        DataGrabber dg = new DataGrabber();

        string email = dg.getValue(txtEmail);

        string gender = dg.getValue(ddGender);
        string citizenship = dg.getValue(ddCitizen);
        bool visarequired = VisaCheckBox.Checked;
        string tShirtSize = dg.getValue(ddTshirt);
        //string school = dg.getValue(txtSchool);
        string street = dg.getValue(txtStreet);
        string city = dg.getValue(txtCity);
        string state = dg.getValue(txtState);
        string zip = dg.getValue(txtZip);
        string country = dg.getValue(ddCountry);
        string phone = dg.getValue(txtPhone);
        string fax = dg.getValue(txtFax);
        string passportNo = dg.getValue(txtPassportNo);
        string passportExp = dg.getValue(txtPassportExpDate);

        string cmd = "update adultsupervisors set ";
        cmd += " gender = '" + gender + "', ";
        cmd += " tShirtSize = '" + tShirtSize + "', ";
        cmd += " asvcitizenship = '" + citizenship + "', ";
        cmd += " visarequired= " + visarequired + ", ";
        cmd += " asvphone = '" + phone + "', ";
        cmd += " asvfax = '" + fax + "', ";
        cmd += " asvemail = '" + email + "', ";
        cmd += " PassportNumber = '" + passportNo + "', ";
        cmd += " PassportExpDate = '" + passportExp + "', ";
        cmd += " asvaddress = '" + street + ";" + city + ";" + state + ";" + zip + ";" + country + "' ";
        cmd += " where asvid = " + asvid;


        try
        {
            AccessDataSource1.UpdateCommand = cmd;
            AccessDataSource1.Update();
        }
        catch (Exception ett)
        {
            lblMessage.Text = "<br>Information could not be saved!" + ett.Message;
            return;
        }

        //passwordunu email at es.sendMail("your email is " + sifre);


        lblMessage.ForeColor = Color.Blue;
        lblMessage.Text = "<br>Supervisor information saved successfully";
        //lblMessage.Text += "\n Click <a href='participantinfo.aspx'>here</a> to continue registering projects";
    }
}