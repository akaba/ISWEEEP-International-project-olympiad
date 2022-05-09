#region imports

using System;
using System.Data;
using System.Web.UI;

#endregion

public partial class recover : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dv = (DataView) AccessDataSource1.Select(DataSourceSelectArguments.Empty);

        if (dv.Table.Rows.Count < 1)
        {
            Label1.Text = "We do not have your information. Please contact us.";
            return;
        }

        if (dv.Table.Rows.Count == 1)
        {
            EmailSender es = new EmailSender();

            string sfr = dv.Table.Rows[0][3].ToString();
            string msj = "Dear " + TextBox1.Text.Trim() + " " + TextBox2.Text.Trim() + "\n";
            msj += "Your password is " + sfr + "\n";
            msj += "Click <a href='/login.aspx'>here</a> to login to the website ";
            if (es.sendMail(msj, "Your project code", "info@isweeep.org", TextBox3.Text.Trim()) == "1")
                Label1.Text = "Your password was sent...<a href='Login.aspx'>login.</a>";
            else Label1.Text = "Your password could not be sent, please contact technical support...";
        }
    }
}