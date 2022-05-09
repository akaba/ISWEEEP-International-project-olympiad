#region imports

using System;
using System.Data;
using System.Drawing;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web;

#endregion

public partial class rplan : Page
{
    private int pid;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            pid = Convert.ToInt32(Session["pid"].ToString());
            setView(pid);
            string status = Session["ProjectStatus"].ToString().Trim();
            if (!(status.Equals("Saved", StringComparison.OrdinalIgnoreCase) || status.Equals("", StringComparison.OrdinalIgnoreCase)))                  
            {
               // btnSubmit.Visible = false;
               // Panelvan.Visible = false;
               // lblMessage.Text = "Your project is currently " + status;
               // lblMessage.ForeColor = System.Drawing.Color.Blue;
            }
        }
        catch (Exception ee)
        {
            //lblMessage.Text = "Session timed out. Please <a href='login.aspx?msj=1'>login</a>  to continue";
            Response.Redirect("logout.aspx");
            return;
        }
    }

    protected void setView(int pid)
    {
        string ApplicationType = Session["ApplicationType"].ToString();
        if (ApplicationType.Equals("Qualified", StringComparison.OrdinalIgnoreCase))
        {
            MultiView1.SetActiveView(QualifiedView);
        }
        else MultiView1.SetActiveView(NonQualifiedView);
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string filename = FileUpload1.FileName.Trim();
        if (filename == "")
        {
            lblMessage.Text = "You did not select any files to send";
            return;
        }

        int dot = filename.LastIndexOf(".");
        string ext = filename.Substring(dot + 1);
        if (!ext.Equals("zip", StringComparison.OrdinalIgnoreCase) &&
            !ext.Equals("pdf", StringComparison.OrdinalIgnoreCase) &&
            !ext.Equals("doc", StringComparison.OrdinalIgnoreCase) &&
            !ext.Equals("docx", StringComparison.OrdinalIgnoreCase))
        {
            lblMessage.Text =
                "You need to submit your research paper as a PDF file, zip file (.zip) or Word (.doc, .docx) file.";
            return;
        }




        if (uploadFile())
        {
            lblMessage.ForeColor = Color.Blue;
            lblMessage.Text = "<div style='background-color:white;text-align:center;border:2px solid red;margin-top:10px'>Thank you! Your research paper has been saved. <a style='color:blue' href='submitproject.aspx'>click here</a> to proceed.</div>";
            btnSubmit.Visible = false;
            //EmailSender es = new EmailSender();
            //es.sendMail("Project Research paper from project#: " + pid, "New research paper", "info@isweeep.org",
            //            "info@isweeep.org");
        }
        else lblMessage.Text = "Your research plan could not be uploaded, please try again ";
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
        string newName = "12_" + pname + "_" + rnd + ext;
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

        string DBFileName = "http://www.harmonytx.org/isweeep/ResearchPapers/" + newName;

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
        return s.Replace("'", "").Replace("\"", "").Replace(":", "-").Replace("?", ".").Replace("/", "-").Replace("\\", "-").Replace(">", "-").Replace("<", "-").Replace("*", "-").Replace("|", "-").Replace("!", "-");
    }

    protected void FormView1_DataBound(object sender, EventArgs e)
    {
        HyperLink hp = (HyperLink)FormView1.FindControl("RPaperLink");
        if (hp != null)
        {
            if (hp.NavigateUrl == "")
            {
                FormView1.Visible = false;
            }
            else
            {
                Label1.Text = "<span style='color:maroon'>This file will replace the existing research paper and old one will be deleted!</span>";
                //btnSubmit.OnClientClick = "javascript:if(document.getElementByID('ctl00_cp1_FileUpload1'.value!='') return confirm('This file will replace the existing research paper and old one will be deleted! Do you want to continue?')";
                FormView1.Visible = true;
            }
        }
    }
}