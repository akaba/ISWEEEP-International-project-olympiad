#region imports

using System;
using System.Data;
using System.Drawing;
using System.IO;
using System.Web.UI;

#endregion

public partial class Finance_RP : Page
{
    private int cid;
    private int pid;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            cid = Convert.ToInt32(Session["FinanceCid"].ToString());

            pid = Convert.ToInt32(Session["FinancePid"].ToString());
        }
        catch (NullReferenceException)
        {
            Response.Redirect("financialapplication.aspx?msj=1");
            return;
        }
        if (!IsPostBack)
        {
            btnLogout.Visible = false;

            checkRP();
        }
    }

    private void checkRP()
    {
        string cmd = "SELECT researchpaper FROM projects WHERE pid=" + pid;
        AccessDataSource1.SelectCommand = cmd;
        DataGrabber dg = new DataGrabber();
        DataTable dt = dg.DB2Table(AccessDataSource1);
   
        if (dt != null && !String.IsNullOrEmpty(dt.Rows[0][0].ToString()))
        {
            Label1.Text = "We have your project research paper, you do not need to upload the file";
            lblMessage.ForeColor = Color.Blue;
            lblMessage.Text = "<br><br>Click on submit button to finalize your financial aid application.";
            uploadpanel.Visible = false;
            btnSubmit.Visible = true;
            CustomValidator1.Enabled = false;
            btnLogout.Visible = false;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == false)
        {
            lblMessage.Text = "You have to check the checkbox to accept the agreement and submit your application";
            return;
        }
        if (uploadpanel.Visible)
        {
            string filename = FileUpload1.FileName.Trim();
            if (filename == "")
            {
                lblMessage.Text = "You have to attach your project research plan to finalize financial aid application";
                return;
            }

            string ext = filename.Substring(filename.Length - 3, 3);
            if (!ext.Equals("pdf", StringComparison.OrdinalIgnoreCase) &&
                !ext.Equals("doc", StringComparison.OrdinalIgnoreCase) &&
                !ext.Equals("zip", StringComparison.OrdinalIgnoreCase))
            {
                lblMessage.Text = "You need to submit your research plan as a PDF file, Word (.doc) file or zip (.zip) file.";
                return;
            }
        }

        if (uploadpanel.Visible == false || uploadFile())
        { 
            EmailSender es = new EmailSender();
            string Insertcmd = "INSERT INTO FinancialApplications(Type, ApplicantID,status) VALUES(";
            Insertcmd += "'Individual'" + ", " + cid + ", 'Submitted')";
            try
            {
                AccessDataSource1.InsertCommand = Insertcmd;
                AccessDataSource1.Insert();
            }
            catch (Exception ee)
            {
                lblMessage.Text = "An error occured when updating your records...";// +AccessDataSource1.InsertCommand;
                 
                es.sendMail("Error in financial Application", "ApplicantID:" + cid + " ProjectID:" + pid + " Exception" + ee.StackTrace,
                            "info@isweeep.org", "fatihak@harmonytx.org");
                return;
            }

            lblMessage.ForeColor = Color.Blue;
            lblMessage.Text = "You finalized the financial application. Your application will be reviewed by I-SWEEEP";
            btnSubmit.Visible = false;
            btnLogout.Visible = true;

            es.sendMail("New financial application from contestant: " + cid, "New financial application",
                        "info@isweeep.org", "info@isweeep.org");
        }
        else lblMessage.Text = "Your research plan cannot be uploaded, please try again";
    }



    protected bool uploadFile()
    {

        DataGrabber dg = new DataGrabber();
        string projectName = dg.ExecuteScalarQuery("select title from projects where pid=" + pid).ToString();
        string filename = correct(Path.GetFileName(FileUpload1.FileName));
        Random r = new Random();
        int rnd = r.Next(10000, 100000);

        int dot = filename.LastIndexOf(".");
        string ext = filename.Substring(dot);
		string pname = correct(projectName);
		if(pname.Length>40) pname = pname.Substring(0,40);
        string newName = "10_" + pname + "_" + rnd + ext;
        string saveAs = Server.MapPath("~/ResearchPapers/") + newName;
        try
        {
            FileUpload1.PostedFile.SaveAs(saveAs);
        }
        catch (Exception n)
        {
            lblMessage.Text = "Your research plan could not be uploaded";
			new EmailSender().hataYolla(n.Message + " saving as " + saveAs);
            return false;
        }

        DataTable dt = (dg.DB2Table(AccessDataSource1));

        string DBFileName = "http://www.cosmostx.org/isweeep/ResearchPapers/" + newName;

        if (dt.Rows.Count == 1)
        {
            string cmd = "update projects set researchPaper = ";
            cmd += "'" + DBFileName + "' where pid = " + pid;

            try
            {
                AccessDataSource1.UpdateCommand = cmd;
                AccessDataSource1.Update();
				return true;
                //deleteFile();
            }
            catch (Exception ee)
            {
                lblMessage.Text = "Error:" + ee.Message;
				throw ee;
                return false;
            }
        }
        return true;
    }

    public string correct(string s)
    {
        return s.Replace("'", "").Replace("\"", "").Replace(":", "-").Replace("?", ".").Replace("/", "-").Replace("\\", "-").Replace(">", "-").Replace("<", "-").Replace("*", "-").Replace("|", "-").Replace("!", ".");
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["FinanceCid"] = null;
        Session["FinancePid"] = null;
        Session.Clear();
        Response.Redirect("FinancialApplication.aspx?msj=1");
    }
}