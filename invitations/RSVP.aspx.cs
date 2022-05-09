using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Net;
using System.Data;

public partial class Invitations_RSVP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if(!IsPostBack)
		{
			
        }
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == false)
        {
            lblMessage.ForeColor = Color.Red;
            lblMessage.Text = "Invalid information was provided, please check that everything is correct.";
            return;
        }

        if (CheckBoxList1.SelectedIndex < 0)
        {
            lblMessage.ForeColor = Color.Red;
            lblMessage.Text = "Please specify the event, you would like to attend.";
            return;
        }

        lblMessage.ForeColor = Color.Blue;
        lblMessage.Text = "";

        DataGrabber dg = new DataGrabber();
        string name = dg.getValue(txtName);
        string aff = dg.getValue(txtAff);
        string email = dg.getValue(txtEmail);

        string times="";
        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            if (CheckBoxList1.Items[i].Selected)
                times += CheckBoxList1.Items[i].Value + "<br>";

        }

        string msjSubject = "RSVP from: " + name;
        string msj = "Name: " + name + "<br>";
        msj += "Affiliation: " + aff + "<br>";
        msj += "Email: " + email + "<br>";
        msj += "Attending the following events: " + times + "<br>";

        EmailSender es = new EmailSender();

        es.sendMail(msj,msjSubject,"info@isweeep.org","mnamver@harmonytx.org");
        es.sendMail(msj, msjSubject, "info@isweeep.org", "starim@harmonytx.org");

        Button1.Visible = false;
        lblMessage.Text = "Thank you very much for your interest...RSVP is complete, you can close this window";
    }
}
