using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Reviews : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        AccessDataSource1.SelectCommand = @"SELECT Reviewers.Name, Reviews.Score, Reviews.Comments, 
            Reviews.Status, Projects.Title,
             Projects.Division, Projects.Category 
             FROM ((Reviewers INNER JOIN Reviews ON Reviewers.ID = Reviews.ReviewerID) 
             INNER JOIN Projects ON Reviews.ProjectID = Projects.pid) 
             WHERE projects.status='In Review' and (" + (DropDownList1.SelectedIndex == 0).ToString() + " or reviewers.ID=?) and (" + (DropDownList2.SelectedIndex == 0).ToString() + " or Reviews.ProjectID=?) ";


    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e) {
        if (DropDownList2.SelectedIndex >= 1) {
            Panel1.Visible = true;
        }
        else Panel1.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e) {
        if (DropDownList3.SelectedIndex > 0 && DropDownList2.SelectedIndex>=1) {
            int pid = Convert.ToInt32(DropDownList2.SelectedValue);
            string status =  DropDownList3.SelectedValue;
            DataGrabber dg = new DataGrabber();

            try{
                int  i= dg.ExecuteNonQuery("update projects set status='" + status + "' where pid=" + pid,Server.MapPath("~/app_data/isweeep.mdb"));
                if(i==1)
                    Label1.Text= "Project status updated";
            }
            catch(Exception err)
            {
                Label1.Text = "AN error occured: " + err.Message;
            }

        }
        else{
            Label1.Text = "The project or the status is not selected";
        }
    }
}
