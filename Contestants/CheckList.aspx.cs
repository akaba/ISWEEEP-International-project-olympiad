#region imports

using System;
using System.Data;
using System.Text;
using System.Web.UI;

#endregion

public partial class ProjectStatus : Page
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
    private bool CodeofConductSubmitted;
    private bool MediaReleaseSubmitted;
    private string svemail;
    private string svlastname;
    private string svname;
    private string title;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            id = Convert.ToInt32(Session["pid"].ToString());
        }
        catch (Exception ee)
        {
            //lblMessage.Text = "Session timed out. Please <a href='login.aspx?msj=1'>login</a>  to continue";
            Response.Redirect("login.aspx?msj=1");
        }
        if (!IsPostBack)
            setCheckList();
    }

    private void setCheckList()
    {
        DataGrabber dg = new DataGrabber();
        DataTable dt = dg.DB2Table(AccessDataSource1);
        DataTable dc = dg.DB2Table(AccessDataSource2);

        //check project status
        string status = dt.Rows[0]["status"].ToString();

        Label1.Text = "";

        if (status == "")
        {
            Label1.Text ="You have to submit your project information to see the checklist. Please click <a href='projectinformation.aspx'>here</a> to submit your project information.<br>";
            return;
        }

        string submittedImage = "<img src='../images/ok.png' />";
        string nopeImage = "<img src='../images/error.png' />";
        string warnImage = "<img src='../images/Warning.png' />";
        //if(status.Equals("Saved",StringComparison.OrdinalIgnoreCase))
        //{

       
            //==
            numberOfContestants = Convert.ToInt32(dt.Rows[0]["numberOfContestants"]);
            title = dt.Rows[0]["title"].ToString();
            division = dt.Rows[0]["division"].ToString();
            category = dt.Rows[0]["category"].ToString();
            email = dt.Rows[0]["email"].ToString();
            pCode = dt.Rows[0]["projectCode"].ToString();
            //status = dt.Rows[0]["status"].ToString();
            psvid = dt.Rows[0]["psvid"].ToString();
            riskformdata = dt.Rows[0]["riskformdata"].ToString();
            abstractsubmitted =  ((dt.Rows[0]["abstractsubmitted"].ToString()).Equals("true", StringComparison.OrdinalIgnoreCase));
            svname = dt.Rows[0]["svname"].ToString();
            svlastname = dt.Rows[0]["svlastname"].ToString();
            svemail = dt.Rows[0]["svemail"].ToString();
            isGroupProject = ((dt.Rows[0]["groupProject"].ToString()).Equals("true", StringComparison.OrdinalIgnoreCase));
            ApplicationType = dt.Rows[0]["ApplicationType"].ToString();
            continuation = dt.Rows[0]["continuation"].ToString().Equals("true", StringComparison.OrdinalIgnoreCase);
            RiskFormSubmitted = dt.Rows[0]["RiskFormSubmitted"].ToString().Equals("1",StringComparison.OrdinalIgnoreCase);
            AbstractCount = dt.Rows[0]["AbstractCount"].ToString();
            continuationFormSubmitted = dt.Rows[0]["ContinuationFormSubmitted"].ToString().Equals("1", StringComparison.OrdinalIgnoreCase);

            // if contestant information not entered set default false
            if (dc.Rows.Count < 1)
            {
                CodeofConductSubmitted = false;
                MediaReleaseSubmitted = false;
            }
            else            
            {
                CodeofConductSubmitted = true;
                MediaReleaseSubmitted = true;
            }
          

            string MissingCodeofConduct="";
            string MissingMediaRelease="";
            // check all for group projects
            foreach (DataRow dataRow in dc.Rows)
            {
                if (!dataRow["CodeofConduct"].ToString().Equals("True", StringComparison.OrdinalIgnoreCase))
                {                    
                    CodeofConductSubmitted = false;
                    MissingCodeofConduct = dataRow["FirstName"].ToString() + " " + dataRow["LastName"].ToString();
                }
                if (!dataRow["MediaRelease"].ToString().Equals("True", StringComparison.OrdinalIgnoreCase))
                {                    
                    MediaReleaseSubmitted = false;
                    MissingMediaRelease= dataRow["FirstName"].ToString()+" "+ dataRow["LastName"].ToString();
                }
                      
            }
        

                                                                                             
            researchPaper = dt.Rows[0]["ResearchPaper"].ToString();

            StringBuilder t =  new StringBuilder("<table border=0 id='tbl' cellpadding=10 class='checkList'><thead align=left><th>Form Name</th><th>Status</th><th>Explanation</th></thead>");
            t.Append("<tr><td>");
            t.Append("Project Information");
            t.Append("</td><td>");
            t.Append(submittedImage + "Submitted");
            t.Append("</td></tr>");

            /**********continuation form***********************/
            if (continuation)
                if (continuationFormSubmitted == false)
                {
                    t.Append("<tr><td>");
                    t.Append("Continuation Form");
                    t.Append("</td><td>");
                    t.Append(nopeImage + "Not Submitted");
                    t.Append("</td><td>");
                    t.Append("You have to submit project continuation form since <br />this is a continuation project from last year.<br /> Click <a href='continuationform.aspx'>here</a> to submit");
                    t.Append("</td></tr>");
                }
                else
                {
                    t.Append("<tr><td>");
                    t.Append("Continuation Form");
                    t.Append("</td><td>");
                    t.Append(submittedImage + "Submitted");
                    t.Append("</td></tr>");
                }
            /*************contestant form********************/
            if (numberOfContestants == 0)
            {
                t.Append("<tr><td>");
                t.Append("Contestant Information");
                t.Append("</td><td>");
                t.Append(nopeImage + "Not Submitted");
                t.Append("</td><td>");
                t.Append("You have to submit contestant information. <br />Click <a href='contestants.aspx'>here</a> to submit");
                t.Append("</td></tr>");
            }
            else if ( (numberOfContestants > 1 && !isGroupProject) || (isGroupProject && numberOfContestants > Settings.MaxNumberOfContestantsAllowedForGroupProjects ))
            {
                t.Append("<tr><td>");
                t.Append("Contestant Information");
                t.Append("</td><td>");
                t.Append(warnImage + "Wrong Information");
                t.Append("</td><td>");
                t.Append("You entered more contestants than you should enter for this project. <br />Click <a href='contestants.aspx'>here</a> to delete extra contestant(s)");
                t.Append("</td></tr>");
            }
            else if (numberOfContestants == 1 && isGroupProject)
            {
                t.Append("<tr><td>");
                t.Append("Contestant Information");
                t.Append("</td><td>");
                t.Append(warnImage + "Not Finished");
                t.Append("</td><td>");
                t.Append("You have to enter 2 contestants since this is a group project. <br />Click <a href='contestants.aspx'>here</a> to enter");
                t.Append("</td></tr>");
            }
            else if ((numberOfContestants == 1 && !isGroupProject) || (numberOfContestants > 1 && isGroupProject))
            {
                t.Append("<tr><td>");
                t.Append("Contestant Information");
                t.Append("</td><td>");
                t.Append(submittedImage + "Submitted");
                t.Append("</td></tr>");
            }
            /****************Supervisor Information*************/
            if (psvid == "")
            {
                t.Append("<tr><td>");
                t.Append("Supervisor Information");
                t.Append("</td><td>");
                t.Append(nopeImage + "Not Submitted");
                t.Append("</td><td>");
                t.Append("You have to submit supervisor information. <br />Click <a href='supervisorinformation.aspx'>here</a> to submit");
                t.Append("</td></tr>");
            }
            else
            {
                t.Append("<tr><td>");
                t.Append("Supervisor Information");
                t.Append("</td><td>");
                t.Append(submittedImage + "Submitted");
                t.Append("</td></tr>");
            }
            /******************Abstract Form********************/
            if (abstractsubmitted && AbstractCount == "1")
            {
                t.Append("<tr><td>");
                t.Append("Abstract");
                t.Append("</td><td>");
                t.Append(submittedImage + "Submitted");
                t.Append("</td></tr>");
            }
            else
            {
                t.Append("<tr><td>");
                t.Append("Abstract");
                t.Append("</td><td>");
                t.Append(nopeImage + "Not Submitted");
                t.Append("</td><td>");
                t.Append("You have to submit project abstract. <br />Click <a href='abstractsubmission.aspx'>here</a> to submit");
                t.Append("</td></tr>");
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
                    t.Append("You have to submit your project research paper. <br />Click <a href='researchpaper.aspx'>here</a> to submit");
                    t.Append("</td></tr>");
                }
                else
                {
                    t.Append("<tr><td>");
                    t.Append("Research Paper");
                    t.Append("</td><td>");
                    t.Append(submittedImage + "Submitted");
                    t.Append("</td></tr>");
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

                }
                
            }
            /*****************Risk Management Form*********/
            if (riskformdata != "")
           
                if (!RiskFormSubmitted)
                {
                    t.Append("<tr><td>");
                    t.Append("Required Forms");
                    t.Append("</td><td>");
                    t.Append(nopeImage + "Not Submitted");
                    t.Append("</td><td>");
                    t.Append("Your supervisor will receive an e-mail from I-SWEEEP<br />  about how to fill out the online form after you submit<br /> your project.");
                    t.Append("</td></tr>");
                }
                else
                {
                    t.Append("<tr><td>");
                    t.Append("Required Forms");
                    t.Append("</td><td>");
                    t.Append(submittedImage + "Submitted");
                    t.Append("</td></tr>");
                }
         
           

               /*****************Media release and Code of conduct forms*********/
            
                if (!CodeofConductSubmitted || !MediaReleaseSubmitted)
                {
                    t.Append("<tr><td>");
                    t.Append("Media release and Code of conduct forms by parent");
                    t.Append("</td><td>");
                    t.Append(nopeImage + "Not Submitted");
                    t.Append("</td><td>");
                    t.Append("Your parent will receive an e-mail from I-SWEEEP<br /> about how to fill out the online form after you enter  contestant information.");
                    t.Append(" Your parent needs to submit the Media release and Code of conduct forms here:<br/><a href='https://www.isweeep.org/isweeep/parents/login.aspx' target='_blank'>https://www.isweeep.org/isweeep/parents/login.aspx</a>");
                
                    if (MissingMediaRelease!="")
                        t.Append("<br/>Media Release form for:<strong>" + MissingMediaRelease + "</strong> ");

                    if (MissingCodeofConduct!="")
                        t.Append("<br/>Code of Conduct form for:<strong>" + MissingCodeofConduct + "</strong> ");    

                    t.Append("</b></td></tr>");
               
                }
                else
                {
                    t.Append("<tr><td>");
                    t.Append("Media release and Code of conduct forms by parent");
                    t.Append("</td><td>");
                    t.Append(submittedImage + "Submitted");
                    t.Append("</td></tr>");
                }

                /*****************Submit Project*********/
                    if (status == "Saved")
                    {

                        t.Append("<tr><td>");
                        t.Append("<STRONG>SUBMIT PROJECT</STRONG>");
                        t.Append("</td><td>");
                        t.Append(nopeImage + "Saved");
                        t.Append("</td><td>");
                        t.Append("You have to submit your project after completing all the checklist items.");
                        t.Append("</td></tr>");                       
                    }
                    else
                    {
                        t.Append("<tr><td>");
                        t.Append("<STRONG>SUBMIT PROJECT</STRONG>");
                        t.Append("</td><td>");
                        t.Append(submittedImage + status);
                        t.Append("</td></tr>");                       
                    }


            t.Append("</table>");

            Label1.Text = t.ToString();
        //}
    }
}