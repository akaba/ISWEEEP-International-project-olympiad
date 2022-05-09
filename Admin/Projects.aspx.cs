#region imports

using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

#endregion

public partial class Admin_Projects : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null || Session["admin"].ToString().Length < 5)
        {
            Response.Redirect("logon.aspx?msj=1");
        }
        
        if (IsPostBack)             
            AccessDataSource1.SelectCommand =
                "SELECT * FROM [Projects] WHERE ( ([Country] = '" +
                countryBox.SelectedValue + "' or " + countryBox.SelectedValue.Equals("0") + " ) AND ([Status] = '" +
                statusBox.SelectedValue + "' or " + statusBox.SelectedValue.Equals("0") + " ) AND ([state] = '" +
                ddStates.SelectedValue + "' or " + ddStates.SelectedValue.Equals("0") + " )  AND ([pid] = " +
                titleBox.SelectedValue + " or  " + titleBox.SelectedValue.Equals("0") + " )   AND ([pid] = " +
                pidBox.SelectedValue + " or  " + pidBox.SelectedValue.Equals("0") + " )  AND ([ProjectCode] = '" +
                ProjectCodeBox.SelectedValue + "' or  " + ProjectCodeBox.SelectedValue.Equals("0") + " )     ) order by pid";        
    }

    protected string link(string paperaddress)
    {
        if (paperaddress != "")        
         return "<a target='_blank' href='" + paperaddress + "'>Research Paper</a>";
        else return "Not Submitted";
    }

  

    protected string GetAbstract(string abstractSubmitted, string pidStr)
    {
        if (string.IsNullOrEmpty(abstractSubmitted) || string.IsNullOrEmpty(pidStr))
            return "";
        if (Convert.ToBoolean(abstractSubmitted))
            return "<a target='_blank' href='./Abstracts.aspx?id=" + Convert.ToInt32(pidStr) + "'>Abstract</a>";
        else return "Not Submitted";
    }

    protected void ProjectCodeBox_DataBound(object sender, EventArgs e)
    {
        ProjectCodeBox.Items.Insert(0, new ListItem("All", "0"));
        ProjectCodeBox.SelectedIndex = 0;
    }
    protected void ProjectCodeBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

    protected void pidBox_DataBound(object sender, EventArgs e)
    {
        pidBox.Items.Insert(0, new ListItem("All", "0"));
        pidBox.SelectedIndex = 0;
    }
    protected void pidBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }


    protected void titleBox_DataBound(object sender, EventArgs e)
    {
        titleBox.Items.Insert(0, new ListItem("All", "0"));
        titleBox.SelectedIndex = 0;
    }
    protected void titleBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

    protected void countryBox_DataBound(object sender, EventArgs e)
    {
        countryBox.Items.Insert(0, new ListItem("All", "0"));
        countryBox.SelectedIndex = 0;
    }

    protected void statusBox_DataBound(object sender, EventArgs e)
    {
        statusBox.Items.Insert(0, new ListItem("All", "0"));
        statusBox.SelectedIndex = 0;
    }

    protected void ddStates_DataBound(object sender, EventArgs e)
    {
        ddStates.Items.Insert(0, new ListItem("All", "0"));
        ddStates.SelectedIndex = 0;
    }


    protected void AccessDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label1.Text = e.AffectedRows.ToString() + " results";
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.PageSize = int.Parse(DropDownList1.SelectedValue);
    } 

    protected void countryBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddStates.DataBind();
        //ddStates.SelectedIndex = 0;
        GridView1.DataBind();
    }

    protected void ddStates_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
    protected void statusBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

    protected bool IsEditEnabled(string statusValue)
    {
        if (statusValue== "")
            return false;
        else return true;
    }

    protected bool IsCertEnabled(string statusValue)
    {
        if (statusValue == "Qualified" || statusValue == "Not Coming")
            return true;
        else return false;
    }


     

    protected void GWRowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (!Page.IsValid)
            return;


        String oldStatus = e.OldValues["status"].ToString();
        String newStatus = e.NewValues["status"].ToString();

        //LabelGrid.Text = oldStatus + "---" + newStatus;

        if (oldStatus.ToLower() == "in review" && newStatus.ToLower() == "qualified")
        {
            int pid = int.Parse(e.Keys[0].ToString());
            DataGrabber dg = new DataGrabber();
            DataTable dt = dg.ExecuteSelectQuery("Select title, email from projects where pid=" + pid);
            String title = dt.Rows[0][0].ToString();
            String email = dt.Rows[0][1].ToString();

            String message = @"
			
			Dear I-SWEEEP contestant,
			<br><br>
			Congratulations! 
			<br><br>
			Your project ('" + title + @"') has been selected to compete at 
			I-SWEEEP International Science Olympiad that will be held in Houston , TX. You will find important 
			I-SWEEEP information in the link below. This information will help you on planning your trip to Houston. 
			Please, read the information very carefully !
			<br><br>
			<a href='http://isweeep.org/science-fair-information/'>Important I-SWEEEP Information for Finalists</a> 
			<br><br>
			Also, your parents must send the required forms online in the link below.
			 <br><br>
			<a href='https://www.isweeep.org/isweeep/parents/Login.aspx'>https://isweeep.org/isweeep/parents/Login.aspx</a>
			 <br><br>
			 <br><br>

			If you need further assistance, feel free to contact us. We look forward to meeting you in Houston. 
            <br><br>
			Best regards, 
            <br><br>
			<b>I-SWEEEP</b>		
			
			";

            EmailSender es = new EmailSender();
            es.sendMail(message, "Your project is QUALIFIED for I-SWEEEP", "info@isweeep.org", email);


        }

        string msj = "";

        if (newStatus != oldStatus)
            msj = "Status Updated.<br />";
        else
            msj = "Status did NOT change.<br />";


        FileUpload fileUpLoad = GridView1.Rows[GridView1.EditIndex].FindControl("FileUpload1") as FileUpload;

        if (string.IsNullOrEmpty(fileUpLoad.FileName))
        {
             msj+= "No file was selected.";
             LabelGrid.Text = msj;
            return;
        }  

        String id = e.Keys[0].ToString();
         //String formName = (e.NewValues["FormName"].ToString());


        // get file ext
        String OriginFilename = fileUpLoad.PostedFile.FileName;
        int pointPos = OriginFilename.LastIndexOf(".");
        String ext = OriginFilename.Substring(pointPos, OriginFilename.Length - pointPos);

        //string name = TxtFormName.Text;
        DateTime date = DateTime.Now;
        

        try
        {
            DataGrabber dg = new DataGrabber();

            String fileName = fileUpLoad.FileName;
            fileName = id + "_" + date.Month + "-" + date.Day + "-" + date.Year + ext;

            LabelGrid.Text = fileName;

            fileUpLoad.SaveAs(Server.MapPath("~/ResearchPapers/") + fileName);

            string filepath ="http://www.harmonytx.org/isweeep/ResearchPapers/" + fileName;

            String sql = "Update Projects SET [ResearchPaper]='" + filepath + "' WHERE Projects.pid=" + id;
            //dg.ExecuteNonQuery(sql);
            AccessDataSource1.UpdateCommand = sql;
            AccessDataSource1.Update();
            
             msj+= "File <strong>" + OriginFilename + "</strong> uploaded successfully...";            

        }
        catch (Exception err)
        {
            msj+= "File could not be uploaded..." + err.Message;
        }


        LabelGrid.Text = msj;


    }



   
}