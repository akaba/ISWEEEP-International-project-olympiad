#region imports

using System;
using System.Drawing;
using System.Web.UI;

#endregion

public partial class AdultSVRegister : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        DataGrabber dg = new DataGrabber();
        string fname = dg.getValue(txtFirstName);
        string lname = dg.getValue(txtLastName);
        string email = dg.getValue(txtEmail);
        string email2 = dg.getValue(txtEmail2);

        if (!email.Equals(email2, StringComparison.OrdinalIgnoreCase))
        {
            lblMessage.Text = "Email addresses do not match!";
            return;
        }

        if (dg.DB2Table(AccessDataSource1).Rows.Count == 1)
        {
            lblMessage.Text =
                "This email address was already registered, please login to edit your information";
            return;
        }
        string sifre = new Random().Next(10000, 100000).ToString();

        string cmd = "insert into adultsupervisors(asvname,asvlastname,asvemail,sifre) values(";
        cmd += "'" + fname + "', ";
        cmd += "'" + lname + "', ";
        cmd += "'" + email + "', ";
        cmd += "'" + sifre + "')";

        try
        {
            AccessDataSource1.InsertCommand = cmd;
            AccessDataSource1.Insert();
        }
        catch (Exception edd)
        {
            lblMessage.Text = "Your registration information could not be saved, please try again or email to info@isweeep.org";
            return;
        }

        EmailSender es = new EmailSender();
        string msj = "Dear " + fname + " " + lname +
                     ";<br>Thank you for registering as an adult supervisor,<br>Your password is: " + sifre;
        msj +=
            "<br>Please click <a href='https://isweeep.org/isweeep/adultsv/adultsvlogin.aspx'>here</a> to login.<br><b>I-SWEEEP Organizing Committee.</b>";
        es.sendMail(msj, "I-SWEEEP Adult Supervisor Registration", "info@isweeep.org", email);

        lblMessage.ForeColor = Color.Blue;
        lblMessage.Text = "Your information saved successfully, please check your email address for your password";
    }
}