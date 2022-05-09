#region imports

using System;
using System.Data;
using System.Text;
using System.Web.UI;

#endregion

public partial class contestant : MasterPage
{

    private string AbstractCount;
    private bool abstractsubmitted;
    private string ApplicationType;
    private string category;
    private bool continuation;
    private bool continuationFormSubmitted;
    private string division;
    private string email;
    private int id;
    private bool isGroupProject;
    private int numberOfContestants;
    private string pCode;
    //string status;
    private string psvid;
    private string researchPaper;
    private string riskformdata;
    private bool RiskFormSubmitted;
    private string svemail;
    private string svlastname;
    private string svname;
    private string title;
   
    
    protected void Page_Load(object sender, EventArgs e)
    {
        ContinuationFormLink.Visible = Boolean.Parse(Session["ProjectIsContinuation"].ToString());
        FormStatusesLink.Visible = true;
        ProjectStatusLink.Visible = (Session["ProjectStatus"].ToString() != "Saved" );
        if(Session["ProjectStatus"].ToString() == "Qualified" || Session["ProjectStatus"].ToString() == "Not Coming")
        {
        CertLink.Visible =true;
        }
       
         if (!IsPostBack)
         {
             setCheckList();
             LabelPSname.Text = "&nbsp;&nbsp;" + email;
         }
    }

    private void setCheckList()
    {
        DataGrabber dg = new DataGrabber();
        DataTable dt = dg.DB2Table(AccessDataSource1);

        bool checklist = true;

        //check project status
        string status = dt.Rows[0]["status"].ToString();

       // Label1.Text = "";

        if (status == "")
        {
          //  Label1.Text ="You have to submit your project information to see the checklist. Please click <a href='projectinformation.aspx'>here</a> to submit your project information.<br>";
            return;
        }

        string submittedImage = "<img src='../images/ok.png' />";
        string nopeImage = "<img src='../images/error.png' />";
        string warnImage = "<img src='../images/Warning.png' />";
        //if(status.Equals("Saved",StringComparison.OrdinalIgnoreCase))
        {
            numberOfContestants = Convert.ToInt32(dt.Rows[0]["numberOfContestants"]);
            title = dt.Rows[0]["title"].ToString();
            division = dt.Rows[0]["division"].ToString();
            category = dt.Rows[0]["category"].ToString();
            email = dt.Rows[0]["email"].ToString();
            pCode = dt.Rows[0]["projectCode"].ToString();
            //status = dt.Rows[0]["status"].ToString();
            psvid = dt.Rows[0]["psvid"].ToString();
            riskformdata = dt.Rows[0]["riskformdata"].ToString();
            abstractsubmitted = ((dt.Rows[0]["abstractsubmitted"].ToString()).Equals("true", StringComparison.OrdinalIgnoreCase));
            svname = dt.Rows[0]["svname"].ToString();
            svlastname = dt.Rows[0]["svlastname"].ToString();
            svemail = dt.Rows[0]["svemail"].ToString();
            isGroupProject = ((dt.Rows[0]["groupProject"].ToString()).Equals("true", StringComparison.OrdinalIgnoreCase));
            ApplicationType = dt.Rows[0]["ApplicationType"].ToString();
            continuation = dt.Rows[0]["continuation"].ToString().Equals("true", StringComparison.OrdinalIgnoreCase);
            RiskFormSubmitted = dt.Rows[0]["RiskFormSubmitted"].ToString().Equals("1", StringComparison.OrdinalIgnoreCase);
            AbstractCount = dt.Rows[0]["AbstractCount"].ToString();
            continuationFormSubmitted = dt.Rows[0]["ContinuationFormSubmitted"].ToString().Equals("1", StringComparison.OrdinalIgnoreCase);
            researchPaper = dt.Rows[0]["ResearchPaper"].ToString();

            

            StringBuilder t = new StringBuilder("<table border=0 id='tbl' cellpadding=10 class='checkList'><thead align=left><th>Form Name</th><th>Status</th><th>Explanation</th></thead>");
            t.Append("<tr><td>");
            t.Append("Project Information");
            t.Append("</td><td>");
            t.Append(submittedImage + "Submitted");
            t.Append("</td></tr>");
            Image1.ImageUrl = "~/images/ok.png";
            ProjectinformationLink.Attributes.Add("class", "menu");
            /**********continuation form***********************/
            if (continuation)
                if (continuationFormSubmitted == false)
                {
                    t.Append("<tr><td>");
                    t.Append("Continuation Form");
                    t.Append("</td><td>");
                    t.Append(nopeImage + "Not Submitted");
                    t.Append("</td><td>");
                    t.Append("You have to submit project continuation form since this is a continuation project from last year. Click <a href='continuationform.aspx'>here</a> to submit");
                    t.Append("</td></tr>");
                    checklist = false;
                }
                else
                {
                    t.Append("<tr><td>");
                    t.Append("Continuation Form");
                    t.Append("</td><td>");
                    t.Append(submittedImage + "Submitted");
                    t.Append("</td></tr>");                    
                    Image10.ImageUrl = "~/images/ok.png";
                    ContinuationFormLink.Attributes.Add("class", "menu");
                }
            /*************contestant form********************/
            if (numberOfContestants == 0)
            {
                t.Append("<tr><td>");
                t.Append("Contestant Information");
                t.Append("</td><td>");
                t.Append(nopeImage + "Not Submitted");
                t.Append("</td><td>");
                t.Append("You have to submit contestant information. Click <a href='contestants.aspx'>here</a> to submit");
                t.Append("</td></tr>");
                checklist = false;
            }
            else if ((numberOfContestants > 1 && !isGroupProject) || (isGroupProject && numberOfContestants > Settings.MaxNumberOfContestantsAllowedForGroupProjects))
            {
                t.Append("<tr><td>");
                t.Append("Contestant Information");
                t.Append("</td><td>");
                t.Append(warnImage + "Wrong Information");
                t.Append("</td><td>");
                t.Append("You entered more contestants than you should enter for this project. Click <a href='contestants.aspx'>here</a> to delete extra contestant(s)");
                t.Append("</td></tr>");
                checklist = false;
            }
            else if (numberOfContestants == 1 && isGroupProject)
            {
                t.Append("<tr><td>");
                t.Append("Contestant Information");
                t.Append("</td><td>");
                t.Append(warnImage + "Not Finished");
                t.Append("</td><td>");
                t.Append("You have to enter 2 contestants since this is a group project. Click <a href='contestants.aspx'>here</a> to enter");
                t.Append("</td></tr>");
                checklist = false;
            }
            else if ((numberOfContestants == 1 && !isGroupProject) || (numberOfContestants > 1 && isGroupProject))
            {
                t.Append("<tr><td>");
                t.Append("Contestant Information");
                t.Append("</td><td>");
                t.Append(submittedImage + "Submitted");
                t.Append("</td></tr>");
                Image2.ImageUrl = "~/images/ok.png";
                ContestantInformationLink.Attributes.Add("class", "menu");
            }
            /****************Supervisor Information*************/
            if (psvid == "")
            {
                t.Append("<tr><td>");
                t.Append("Project Supervisor Information");
                t.Append("</td><td>");
                t.Append(nopeImage + "Not Submitted");
                t.Append("</td><td>");
                t.Append("You have to submit supervisor information. Click <a href='supervisorinformation.aspx'>here</a> to submit");
                t.Append("</td></tr>");
                checklist = false;
                
            }
            else
            {
                t.Append("<tr><td>");
                t.Append("Project Supervisor Information");
                t.Append("</td><td>");
                t.Append(submittedImage + "Submitted");
                t.Append("</td></tr>");
                Image3.ImageUrl = "~/images/ok.png";
                SupervisorInformationLink.Attributes.Add("class", "menu");
            }
            /******************Abstract Form********************/
            if (abstractsubmitted && AbstractCount == "1")
            {
                t.Append("<tr><td>");
                t.Append("Abstract");
                t.Append("</td><td>");
                t.Append(submittedImage + "Submitted");
                t.Append("</td></tr>");
                Image4.ImageUrl = "~/images/ok.png";
                AbstractSubmissionLink.Attributes.Add("class", "menu");
            }
            else
            {
                t.Append("<tr><td>");
                t.Append("Abstract");
                t.Append("</td><td>");
                t.Append(nopeImage + "Not Submitted");
                t.Append("</td><td>");
                t.Append("You have to submit project abstract. Click <a href='abstractsubmission.aspx'>here</a> to submit");
                t.Append("</td></tr>");
                checklist = false;
            }
            /*****************Research Paper*********************/
            if (!ApplicationType.Equals("Qualified", StringComparison.OrdinalIgnoreCase))
                if (researchPaper == "")
                {
                    t.Append("<tr><td>");
                    t.Append("Research Paper");
                    t.Append("</td><td>");
                    t.Append(nopeImage + "Not Submitted");
                    t.Append("</td><td>");
                    t.Append("You have to submit your project research paper. Click <a href='researchpaper.aspx'>here</a> to submit");
                    t.Append("</td></tr>");
                    checklist = false;
                }
                else
                {
                    t.Append("<tr><td>");
                    t.Append("Research Paper");
                    t.Append("</td><td>");
                    t.Append(submittedImage + "Submitted");
                    t.Append("</td></tr>");
                    Image5.ImageUrl = "~/images/ok.png";
                    ResearchPaperLink.Attributes.Add("class", "menu");
                }
            else
            {
                if (researchPaper == "")
                {
                    t.Append("<tr><td>");
                    t.Append("Research Paper");
                    t.Append("</td><td>");
                    t.Append("Not Required");
                    t.Append("</td><td>");
                    t.Append("Uploading your research paper is optional. You can click <a href='researchpaper.aspx'>here</a> to submit it");
                    t.Append("</td></tr>");
                  
                }
                else
                {
                    t.Append("<tr><td>");
                    t.Append("Research Paper");
                    t.Append("</td><td>");
                    t.Append(submittedImage + "Submitted");
                    t.Append("</td></tr>");
                    Image5.ImageUrl = "~/images/ok.png";
                    ResearchPaperLink.Attributes.Add("class", "menu");

                }

            }
            /*****************Risk Management Form*********/
            if (riskformdata != "")
            {
                if (!RiskFormSubmitted)
                {
                    t.Append("<tr><td>");
                    t.Append("Required Forms");
                    t.Append("</td><td>");
                    t.Append(nopeImage + "Not Submitted");
                    t.Append("</td><td>");
                    t.Append("Your supervisor will receive an e-mail from I-SWEEEP about how to fill out the online form after you submit your project.");
                    t.Append("</td></tr>");
                    checklist = false;
                }
                else
                {
                    t.Append("<tr><td>");
                    t.Append("Required Forms");
                    t.Append("</td><td>");
                    t.Append(submittedImage + "Submitted");
                    t.Append("</td></tr>");
                    Image7.ImageUrl = "~/images/ok.png";
                    FormStatusesLink.Attributes.Add("class", "menu");
                }
            }
            else 
            {
                //project does not require risk management form
                Image7.ImageUrl = "~/images/ok.png";
                FormStatusesLink.Attributes.Add("class", "menu");
            }
                /*****************Submit Project*********/
            if (status == "Saved") 
            {
              
                    t.Append("<tr><td>");
                    t.Append("Submit Project");
                    t.Append("</td><td>");
                    t.Append(nopeImage + "Not Submitted");
                    t.Append("</td><td>");
                    t.Append("Your supervisor will receive an e-mail from I-SWEEEP about how to fill out the online form after you submit your project.");
                    t.Append("</td></tr>");
                    checklist = false;
            }
            else
            {
                t.Append("<tr><td>");
                t.Append("Submit Project");
                t.Append("</td><td>");
                t.Append(submittedImage + "Submitted");
                t.Append("</td></tr>");
                Image9.ImageUrl = "~/images/ok.png";
                SubmitProjectLink.Attributes.Add("class", "menu");
            }
            /*****************Project Status*********/
            if (status != "Saved")
            {
                Image6.ImageUrl = "~/images/ok.png";
                ProjectStatusLink.Attributes.Add("class", "menu");

            }


                /*****************Submit Project*********/
                if (checklist)
                {
                    Image8.ImageUrl = "~/images/ok.png";
                    CheckListLink.Attributes.Add("class", "menu");
                }


            t.Append("</table>");

            //Label1.Text = t.ToString();
        }
    }
}