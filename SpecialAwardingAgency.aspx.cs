#region imports

using System;
using System.Web.UI;

#endregion

public partial class SpecialAwardingAgency : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (CheckBoxList1.SelectedIndex == -1)
        {
            lblMessage.Text = "You need to check at least one category";
            return;
        }
        DataGrabber dg = new DataGrabber();
        string agencyName = dg.getValue(txtAgencyName);
        string agencyDescription = dg.getValue(txtDescriptionofAgency);
        string awardDescription = dg.getValue(txtAwardDesc);
        string address = dg.getValue(txtAddress);
        string cName = dg.getValue(coordName);
        string cEmail = dg.getValue(coordEmail);
        string cPhone = dg.getValue(coordPhone);
        string cFax = dg.getValue(coordfax);

        string hName = dg.getValue(hjName);
        string hEmail = dg.getValue(hjEmail);
        string hPhone = dg.getValue(hjPhone);
        string hFax = dg.getValue(hjFax);

        string categories = "";
        for (int j = 0; j < CheckBoxList1.Items.Count; ++j)
        {
            if (CheckBoxList1.Items[j].Selected)
                categories += CheckBoxList1.Items[j].Text + " - ";
        }

        if (agencyDescription.Length > 250)
        {
            lblMessage.Text = "Description of Agency should be less than 250 character ";
            return;
        }
        if (awardDescription.Length > 250)
        {
            lblMessage.Text = "Description of Award should be less than 250 character ";
            return;
        }
        if (agencyName.Length > 250)
        {
            lblMessage.Text = "Name of Agency should be less than 250 character ";
            return;
        }


        try
        {
            string cmd =
                "insert into specialawards(AgencyName,AgencyDescription,AgencyAddress,CoordinatorName,CPhone,CEmail,CFAX,HeadJudgeName,HJPhone,HJEmail,HJFAX,AwardDescription,AwardGivenIn) values( ";
            cmd += "'" + agencyName + "', ";
            cmd += "'" + agencyDescription + "', ";
            cmd += "'" + address + "', ";
            cmd += "'" + cName + "', ";
            cmd += "'" + cPhone + "', ";
            cmd += "'" + cEmail + "', ";
            cmd += "'" + cFax + "', ";
            cmd += "'" + hName + "', ";
            cmd += "'" + hPhone + "', ";
            cmd += "'" + hEmail + "', ";
            cmd += "'" + hFax + "', ";
            cmd += "'" + awardDescription + "', ";
            cmd += "'" + categories + "') ";

            AccessDataSource2.InsertCommand = cmd;
            AccessDataSource2.Insert();
        }
        catch (Exception et)
        {
            lblMessage.Text = "An error occured, please email to info@isweep.org: " + et.Message;
            return;
        }
        lblMessage.Text = "You have succesfully submitted your application. Thank you.";

        Button1.Visible = false;

        EmailSender es = new EmailSender();
        string mesaj =
            "Thank you for applying as a special awarding agency,<br>You will be contacted soon.<br><br><b>ISWEEEP Organizing Committee</b>";
        es.sendMail(mesaj, "I-SWEEEP Special Awarding Agency Application", "info@isweeep.org", cEmail);
    }
}