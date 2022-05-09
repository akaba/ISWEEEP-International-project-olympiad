#region imports

using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

#endregion

public partial class Volunteer : Page
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
            lblMessage.Text = "***Email addresses do not match!";
            return;
        }

        if (CheckBoxList1.SelectedIndex == -1)
        {
            lblMessage.Text = "***You have to check at list one of the volunteering hours";
            return;
        }
        string avaliability = "";
        for (int j = 0; j < CheckBoxList1.Items.Count; ++j)
        {
            if (CheckBoxList1.Items[j].Selected)
                avaliability += CheckBoxList1.Items[j].Text + " <br> ";
        }


        string fullname = getValue(txtFirstName) + " " + getValue(txtLastName);
        string phone = getValue(txtPhone);
        string campus = getValue(txtCampus);

        string cmdInsert = "INSERT INTO volunteers ( volunteerName, volunteerEmail, Phone, volunteeringTimes,campus ) ";
        cmdInsert += " values('" + fullname + "', '" + email + "', '" + phone + "', '" + avaliability + "', '" + campus +
                     "')";

        string cmdUpdate = "UPDATE volunteers SET volunteerName = '" + fullname + "', Phone = '" + phone +
                           "', volunteeringTimes = '" + avaliability + "', campus = ' " + campus +
                           "' where volunteerEmail= '" + email + "'";
        bool saved = false;
        try
        {
            AccessDataSource1.SelectCommand = "select * from volunteers where volunteeremail = '" + email +
                                              "' and volunteername='" + fullname + "'";
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
            lblMessage.Text = "<b>There was an error saving your information; please contact tech-support: " +
                              ecc.Message + ":::</b>";
            return;
        }
        if (!saved)
        {
            string mesaj = "Thank you for registering as a volunteer.<br>";
            mesaj += "<i>Please do not reply this email</i><br>";
            mesaj += "You will be contacted by an I-SWEEEP representative.<br><br>";
            mesaj += "<b>Volunteering Times:</b><br> " + avaliability + "<br>";

            mesaj += "<br/><b>I-SWEEEP Organizing Committee</b>";

            EmailSender es = new EmailSender();
            es.sendMail(mesaj, "I-Sweeep Volunteer Registration", "info@isweeep.org", email);

            string mesaj2 = "New volunteer registration:<br>";
            mesaj2 += "<b>Name:</b> " + fullname + "<br>";
            mesaj2 += "<b>Phone:</b> " + phone + "<br>";
            mesaj2 += "<b>Email:</b> " + email + "<br>";
            mesaj2 += "<b>Campus or referance name:</b> " + campus + "<br>";
            mesaj2 += "<b>Volunteering Times:</b><br> " + avaliability + "<br>";


            es.sendMail(mesaj2, "I-Sweeep Volunteer Registration", "info@isweeep.org", "info@isweeep.org");
            es.sendMail(mesaj2, "I-Sweeep Volunteer Registration", "info@isweeep.org", "eercetin@harmonytx.org");


            Button1.Visible = false;
            lblMessage.Text = "Registration completed; Thank you for registering...You will receive an email shortly";
            lblMessage.ForeColor = Color.Blue;
            lblMessage.Font.Bold = true;
        }
        else
        {
            string mesaj = "Thank you for registering as a volunteer.<br>";
            mesaj += "Your registration was updated.";
            //mesaj += "You will be contacted by an I-SWEEEP representative.<br><br>";
            mesaj += "<b>New Volunteering Times:</b><br> " + avaliability + "<br>";

            mesaj += "<br/><b>I-SWEEEP Organizing Committee</b>";

            EmailSender es = new EmailSender();
            es.sendMail(mesaj, "I-Sweeep Volunteer Registration Update", "info@isweeep.org", email);

            string mesaj2 = "Volunteer information update:<br>";
            mesaj2 += "<b>Name:</b> " + fullname + "<br>";
            mesaj2 += "<b>Phone:</b> " + phone + "<br>";
            mesaj2 += "<b>Email:</b> " + email + "<br>";
            mesaj2 += "<b>Campus or referance name:</b> " + campus + "<br>";
            mesaj2 += "<b>Volunteering Times:</b><br> " + avaliability + "<br>";


            es.sendMail(mesaj2, "I-Sweeep Volunteer Registration Update", "info@isweeep.org", "info@isweeep.org");
            es.sendMail(mesaj2, "I-Sweeep Volunteer Registration Update", "info@isweeep.org", "eercetin@harmonytx.org");


            Button1.Visible = false;
            lblMessage.Text =
                "We already have this email address and name registered as a volunteer, so we updated your volunteering times.";
            lblMessage.Text += "You will receive the updated times in a new email. Thank you.";
            lblMessage.ForeColor = Color.Blue;
            lblMessage.Font.Bold = true;
        }
        //email at
    }

    protected string getValue(Control c)
    {
        if (c.GetType() == txtEmail.GetType())
        {
            return correct(((TextBox) c).Text.Trim());
        }
        return " ";
    }

    protected static string correct(string s)
    {
        return s.Replace("'", "''");
    }
}