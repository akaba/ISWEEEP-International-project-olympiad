using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ProjectMerge : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void ProjectBox1_DataBound(object sender, EventArgs e)
    {
        ProjectBox1.Items.Insert(0, new ListItem("Select", "0"));
        ProjectBox1.SelectedIndex = 0;
    }

    protected void ProjectBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ProjectBox1.SelectedIndex != 0 && ProjectBox2.SelectedIndex != 0)
        {
            ButtonMerge.Visible = true;
        }
    }

    protected void ProjectBox2_DataBound(object sender, EventArgs e)
    {
        ProjectBox2.Items.Insert(0, new ListItem("Select", "0"));
        ProjectBox2.SelectedIndex = 0;
    }

    protected void ProjectBox2_SelectedIndexChanged(object sender, EventArgs e)
    {
              
        if (ProjectBox1.SelectedIndex != 0 && ProjectBox2.SelectedIndex != 0)
        {
            ButtonMerge.Visible = true;
        }
    }


    protected void ButtonMerge_Click(object sender, EventArgs e)
    {
        int project1 =Convert.ToInt32(ProjectBox1.SelectedValue);
        int project2 = Convert.ToInt32(ProjectBox2.SelectedValue);

        if (project1 == 0 || project2 == 0)
        {
            Label1.Text = "Select projects first!!";          
        }
        else
        {
            // Label1.Text = project1.ToString() + ' ' + project2.ToString();
            //Label1.Text = "";

            DataGrabber dg = new DataGrabber();
            DataTable dt;
            try
            {
                dt = dg.ExecuteSelectQuery("Select * from Projects where pid=" + project1);              

            }
            catch (Exception et)
            {
                Label1.Text = "Error, no such project exist..." + et;
                return;
            }

            string ProjectCode = "";
            string RegionalID = "";
            string RegionalName = "";

            if (dt.Rows.Count > 0)
            {
                ProjectCode = dt.Rows[0]["ProjectCode"].ToString();
                RegionalID = dt.Rows[0]["RegionalID"].ToString();
                RegionalName = dt.Rows[0]["RegionalName"].ToString();
            }
            else
            { 
                return; 
            }

            // Delete the project1 ***
            string deletecmd = "Delete FROM Projects where pid=" + project1;
            AccessDataSource3.DeleteCommand = deletecmd;
            AccessDataSource3.Delete();          
            // Delete the project1 ***


            // Update the project2 ***        
                    string updateCmd = "update projects set ";
                    updateCmd += "ProjectCode = '" + ProjectCode + "', ";
                    updateCmd += "RegionalID = '" + RegionalID + "', ";
                    updateCmd += "RegionalName = '" + RegionalName + "', ";
                    updateCmd += "ApplicationType = 'Qualified' ";
                    updateCmd += " where pid = " + project2;
                    try
                    {
                        AccessDataSource3.UpdateCommand = updateCmd;
                        AccessDataSource3.Update();
                    }
                    catch (Exception ett)
                    {
                        Label1.Text = "Database error: " + ett.Message;
                        return;
                    }
                    Label1.Text = "Project updated succsfully.";
           
        }
     

    }
}