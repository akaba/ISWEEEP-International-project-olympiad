#region imports

using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

#endregion

public partial class Contestants : Page
{
    private int id;
    private string status;

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
            return;
        }
        setStatus();


    }

    private void setStatus()
    {
        status = Session["ProjectStatus"].ToString().Trim();
        if (!status.Equals("Saved", StringComparison.OrdinalIgnoreCase))
        {
            if (FormView1.FindControl("EditButton") != null && FormView1.FindControl("DeleteButton") != null)
            {
                (FormView1.FindControl("EditButton")).Visible = false;
                (FormView1.FindControl("DeleteButton")).Visible = false;
            }

            lblStatus.ForeColor = Color.Blue;
            if (status == "")
                lblStatus.Text = "Your project information was not saved yet.<br>You cannot add contestants at this time";
            else
                lblStatus.Text = "Your project status is currently " + status + "<br>You cannot make changes at this time";
            btnAdd.Visible = false;

        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("personalinfo.aspx");
    }

    protected void FormView1_DataBound(object sender, EventArgs e)
    {
        SetEditButtons();

        AccessDataSource projectdata = new AccessDataSource();
        projectdata.DataFile = "~/App_Data/Isweeep.mdb";
        projectdata.ID = "projectData";
        projectdata.SelectCommand = "select groupProject from projects where pid=" + id;
        projectdata.DataBind();
        DataGrabber dg = new DataGrabber();
        int numberOfContestants = Convert.ToInt32( dg.ExecuteScalarQuery("Select count(1) from Contestants where pid=" + id + " and observer=false"));
        bool isGroup = false;
        object grp = dg.ExecuteScalarQuery("select groupProject from projects where pid=" + id);
        if (grp == null || Convert.ToBoolean(grp) == false)
        {
            isGroup = false;
        }
        else isGroup = true;

        if (!status.Equals("Saved", StringComparison.OrdinalIgnoreCase))
        {
            btnAdd.Visible = false;
            return;
        }
        if (!isGroup)
        {
                        
            if (numberOfContestants == 1 )
            {
                btnAdd.Visible = false;
                if (status.Equals("Saved", StringComparison.OrdinalIgnoreCase))
                {
                    lblMessage.Text = "You successfully saved your personal information";
                    lblMessage.Text +=
                        "<br>Click <a href='SupervisorInformation.aspx'>here</a> to submit your supervisor information";
                }
                return;
            }
            else if (numberOfContestants == 0)
            {
                btnAdd.Visible = true;
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "You need to delete " + (numberOfContestants - 1) + " of the contestants, since this is an individual project.";
                btnAdd.Visible = false;
            }
           
        }
        else if (numberOfContestants == Settings.MaxNumberOfContestantsAllowedForGroupProjects)
        {
            btnAdd.Visible = false;
            if (status.Equals("Saved", StringComparison.OrdinalIgnoreCase))
            {
                lblMessage.Text = "You can add at most 3 contestants in a group project.";
                lblMessage.Text += "<br /><br/><img src='../images/warning.png'><strong> By adding 3rd member you agree to pay $150 per day which includes accommodation, meal, and transportation, for more Information <a href='http://isweeep.org/science-fair-information' target='_blank'>click here</a> view accommodation files.</strong>";
                lblMessage.Text += "<br/><br/>Click <a href='supervisorinformation.aspx'>here</a> to provide project supervisor information.";             
                  

            }
        }
        else if (numberOfContestants > Settings.MaxNumberOfContestantsAllowedForGroupProjects)
        {
            btnAdd.Visible = false;
            //EmailSender es = new EmailSender();
            //es.sendMail("Too many contestants in a project:" + id, "too many contestants error", "info@isweeep.org", "fatihak@harmonytx.org");
            lblMessage.Text = "You cannot register more than " + Settings.MaxNumberOfContestantsAllowedForGroupProjects + " contestants for a project, please delete extra ones.";
        }
        else btnAdd.Visible = true;

        //DropDownList gradesDD = FormView1.FindControl("ddGrade") as DropDownList;
        //if (gradesDD != null)
        //    BindGrades(gradesDD);
    }

    protected void FormView1_ModeChanged(object sender, EventArgs e)
    {
        if (FormView1.CurrentMode == FormViewMode.Edit)
        {
            //btnAdd.Visible = false;
            lblMessage.Visible = false;
        }
        else lblMessage.Visible = true;


    }
    //private void BindGrades(DropDownList ddGrade)
    //{
    //    string val = ddGrade.SelectedValue;

    //    ddGrade.Items.Clear();
    //    ddGrade.Items.Add(new ListItem("Select grade", ""));
    //    if (Session["ProjectCountry"].ToString().ToUpper() != "UNITED STATES")
    //    {
    //        for (int i = 9; i < 13; i++)
    //        {
    //            ddGrade.Items.Add(new ListItem(i.ToString()));
    //        }
    //    }
    //    else
    //    {
    //        DataGrabber dg = new DataGrabber();
    //        string division = dg.ExecuteScalarQuery("SELECT DIVISION FROM PROJECTS WHERE PID=" + id).ToString();
    //        if (division.ToUpper() == "SENIOR")
    //        {
    //            for (int i = 9; i < 13; i++)
    //            {
    //                ddGrade.Items.Add(new ListItem(i.ToString()));
    //            }
    //        }
    //        else
    //        {
    //            for (int i = 6; i < 9; i++)
    //            {
    //                ddGrade.Items.Add(new ListItem(i.ToString()));
    //            }
    //        }
    //    }

    //    if (!string.IsNullOrEmpty(val))
    //    {
    //        ddGrade.SelectedValue = val;
    //    }
    //}

    private void SetEditButtons()
    {
        status = Session["ProjectStatus"].ToString().Trim();

        if (!status.Equals("Saved", StringComparison.OrdinalIgnoreCase))
        {
            if (FormView1.FindControl("EditButton") != null && FormView1.FindControl("DeleteButton") != null)
            {
                ((Button)FormView1.FindControl("EditButton")).Visible = false;
                ((Button)FormView1.FindControl("DeleteButton")).Visible = false;
            }
        }
    }
}