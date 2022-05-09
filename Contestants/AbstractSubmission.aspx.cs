#region imports

using System;
using System.Data;
using System.Drawing;
using System.Web.UI;

#endregion

public partial class AbstractSubmission : Page
{
    private int id;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            id = Convert.ToInt32(Session["pid"].ToString());
        }
        catch (Exception ee)
        {
            lblMessage.Text = "Session timed out. Please <a href='login.aspx?msj=1'>login</a>  to continue";
            Response.Redirect("login.aspx?msj=1");
            return;
        }
        if (!IsPostBack)
        {
            Fill();
            setStatus();
        }
    }

    private void setStatus()
    {
        string status = Session["ProjectStatus"].ToString().Trim();
        if (!(status.Equals("saved", StringComparison.OrdinalIgnoreCase) || status.Equals("", StringComparison.OrdinalIgnoreCase)))               
        {
            CheckBox1.Visible = false;
            lblMessage.ForeColor = Color.Blue;
            lblMessage.Text = "Your project status is currently " + status + "<br>You cannot make changes at this time";
            Button1.Visible = false;
        }
    }

    private void Fill()
    {
        DataGrabber dg = new DataGrabber();
        DataTable dt = dg.DB2Table(AccessDataSource1);
        if (dg.DB2Table(AccessDataSource1).Rows.Count == 1)
        {
            txtAbstract.Text = dt.Rows[0]["Abstract"].ToString();
        }
    }

    protected void TextChanged(object sender, EventArgs e)
    {
        int LengthOfAbstract = txtAbstract.Text.Length;

        if (LengthOfAbstract > 2000)
        {
            lblMessage.Text =
                "<span style='border:1px solid blue'>Abstract is too long. It should be less than 2000 characters. It is currently " +
                LengthOfAbstract + " characters.</span>";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == false)
        {
            lblMessage.Text = "You have to accept the agreement by checking the checkbox";
            return;
        }


        DataGrabber dg = new DataGrabber();

        string abstractText = dg.getValue(txtAbstract);

        if (txtAbstract.Text.Length < 1)
        {
            lblMessage.Text = "You need to write your abstract before you save it";
            return;
        }

        if (dg.DB2Table(AccessDataSource1).Rows.Count == 1)
        {
            string UpdateCmd = "update abstracts set ";
            UpdateCmd += "[abstract] = '" + abstractText + "' ";
            UpdateCmd += "where pid = " + id;

            try
            {
                AccessDataSource1.UpdateCommand = UpdateCmd;
                AccessDataSource1.Update();
                AccessDataSource1.UpdateCommand = "UPDATE projects SET abstractsubmitted = true WHERE pid = " + id;
                AccessDataSource1.Update();
            }
            catch (Exception etc)
            {
                
                    lblMessage.Text ="Database error! Please contact technical support:" + etc.Message + "\n" +
                    AccessDataSource1.UpdateCommand;
                //HypNext.Visible = false;
                return;
            }
        }
        else
        {
            string insertCmd = "INSERT INTO abstracts(pid,[abstract]) VALUES(";
            insertCmd += " " + id + ", ";
            insertCmd += "'" + abstractText + "' )";

            AccessDataSource1.InsertCommand = insertCmd;
            try
            {
                AccessDataSource1.Insert();
                AccessDataSource1.UpdateCommand = "UPDATE projects SET abstractsubmitted = true WHERE pid = " + id;
                AccessDataSource1.Update();
            }
            catch (Exception etc)
            {
                lblMessage.Text =
                    lblMessage.Text =
                    "Database error! Please contact technical support:" + etc.Message + "\n" +
                    AccessDataSource1.InsertCommand;
                //HypNext.Visible = false;
                return;
            }
        }

        lblMessage.ForeColor = Color.Blue;

        lblMessage.Text = "<br>You have successfully saved your abstract.";
        if (abstractText == "")
        {
            lblMessage.Text += "Please write your abstract before final submission";
        }
        else
        {
            lblMessage.Text += "Click <a href='ResearchPaper.aspx'>here</a> to submit your research paper.<br>";
        }
    }
}