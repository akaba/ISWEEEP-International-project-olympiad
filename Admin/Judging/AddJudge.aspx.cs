#region imports

using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

#endregion

public partial class Judges : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        string email = getValue(txtEmail);
        string email2 = getValue(txtEmail2);

        if (email != email2)
        {
            lblMessage.Text = "Email addreses do not match!";
            return;
        }
        string pref1 = getValue(ddPref1);
        string pref2 = getValue(ddPref2);
        string pref3 = getValue(ddPref3);

        if (pref1 == pref2 || pref1 == pref3)
        {
            lblMessage.Text = "Please choose different categories to judge";
            return;
        }

        string fname = getValue(txtFirstName);
        string lname = getValue(txtLastName);
        string company = getValue(txtCompany);
        string position = getValue(txtPosition);

        string phone = getValue(txtPhone);

        string cmdInsert =
            "INSERT INTO Judges ( JudgeName, JudgeLastName, JPhone, JEmail, CompanyName, [Position], Preference1, Preference2, Preference3 ) ";
        cmdInsert += " values('" + fname + "', '" + lname + "', '" + phone + "', '" + email + "', '" + company + "', '" +
                     position + "', '" + pref1 + "', '" + pref2 + "', '" + pref3 + "')";

        string cmdUpdate = "UPDATE Judges SET Judges.JudgeName = '" + fname + "', Judges.JudgeLastName = '" + lname +
                           "', Judges.JPhone = '" + phone + "', Judges.CompanyName = '" + company +
                           "', Judges.[Position] = = '" + position + "', Judges.Preference1 = '" + pref1 +
                           "', Judges.Preference2 = '" + pref2 + "', Judges.Preference3 =  '" + pref3 +
                           "' where Judges.JEmail = '" + email + "'";
        bool saved = false;
        try
        {
            AccessDataSource1.SelectCommand = "select * from judges where jemail = '" + email + "'";
            DataTable t = ((DataView) (AccessDataSource1.Select(DataSourceSelectArguments.Empty))).Table;
            if (t.Rows.Count < 1)
            {
                AccessDataSource1.InsertCommand = cmdInsert;
                AccessDataSource1.Insert();
                saved = false;
            }
            else
            {
                AccessDataSource1.UpdateCommand = cmdUpdate;
                AccessDataSource1.Update();
                saved = true;
            }
        }
        catch (Exception ecc)
        {
            lblMessage.Text = "<b>There was an error when saving your information; please contact tech-support: " +
                              ecc.Message + ":::</b>";
            return;
        }
        if (!saved)
        {
            lblMessage.Text = "Registration completed; Thank you for registering...";
            string mesaj = "Thank you for registering<br>";
            mesaj += "You will be contacted by the organization committee, soon<br>";
            mesaj += "<b>I-SWEEEP Organizing Committee</b>";

            EmailSender es = new EmailSender();
            if (es.sendMail(mesaj, "I-Sweeep Judge Registration", "info@isweeep.org", email) == "1")
            {
                lblMessage.Text += " You will receive a confirmation email shortly";
            }

            string mesaj2 = "New Judge registration:<br>";
            mesaj2 += "<b>Name:</b> " + fname + " " + lname + "<br>";
            mesaj2 += "<b>Phone:</b> " + phone + "<br>";
            mesaj2 += "<b>Email:</b> " + email + "<br>";
            mesaj2 += "<b>Company:</b> " + company + "<br>";
            mesaj2 += "<b>Position:</b> " + position + "<br>";


            es.sendMail(mesaj2, "I-Sweeep Judge Registration", "info@isweeep.org", "info@isweeep.org");

            Button1.Visible = false;
        }
        else
            lblMessage.Text = "Your Information was updated successfully.";
    }

    protected string getValue(Control c)
    {
        if (c.GetType() == txtEmail.GetType())
        {
            return correct(((TextBox) c).Text.Trim());
        }
        else if (c.GetType() == ddPref1.GetType())
        {
            return correct(((DropDownList) c).SelectedValue.Trim());
        }
        else return " ";
    }

    protected string correct(string s)
    {
        return s.Replace("'", "''");
    }
}