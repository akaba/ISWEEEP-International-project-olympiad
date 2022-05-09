using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_QuallifyInvited : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.PageSize = int.Parse(DropDownList1.SelectedValue);
        GridView1.DataBind();
    }
    protected void StatusUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        String oldStatus = e.OldValues["status"].ToString();
        String newStatus = e.NewValues["status"].ToString();
        
        if(oldStatus.ToLower() == "in review" && newStatus.ToLower() == "qualified")
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
    }
}
