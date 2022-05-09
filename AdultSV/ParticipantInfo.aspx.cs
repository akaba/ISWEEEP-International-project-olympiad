#region imports

using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;



#endregion

public partial class ParticipantInfo : Page
{
    private int id;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            id = Convert.ToInt32(Session["asvid"].ToString());
        }
        catch (Exception ee)
        {
            //lblMessage.Text = "Session timed out. Please <a href='login.aspx?msj=1'>login</a>  to continue";
            Response.Redirect("adultsvlogin.aspx?msj=1");
            return;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //GridView1.Visible = true;
        lblMessage.Text = "";
        if (TextBox1.Text.Trim() == "")
        {
            //GridView1.Visible = false;
            lblMessage.Text = "Please enter a valid code";
            return;
        }
        int asvid = Convert.ToInt32(Session["asvid"].ToString());
        DataGrabber dg = new DataGrabber();
        AccessDataSource1.SelectCommand ="SELECT [pid], [ProjectCode], [Title], [Division], [Category], [Status], [ASVID] FROM [Projects] WHERE ([ProjectCode] = '" +
            dg.getValue(TextBox1) + "' )";
        DataTable dt = dg.DB2Table(AccessDataSource1);
        if (dt.Rows.Count == 1)
        {
            int pid = Convert.ToInt32(dt.Rows[0][0]);
		    string status= (dt.Rows[0]["status"]).ToString();
            if (status != "Qualified")
            {
                lblMessage.Text = "This project is not qualified, you cannot add it...";
                return;
            }
            Session["ASVProject"] = pid;
            AccessDataSource1.UpdateCommand = "update projects set asvid = " + asvid + " where pid=" + pid;
            AccessDataSource1.Update();
            //lblMessage.Text = Session["pid"].ToString();

            contestantInfo.DataBind();
            GridView2.DataBind();
        }
        else
        {
            //GridView1.Visible = false;
            lblMessage.Text = "There is no project with this code";
        }
    }

    protected void AccessDataSource3_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0) Panel1.Visible = false;
        else Panel1.Visible = true;
    }

    protected void GridView2_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {      

        FormView1.DataBind();
    }

    protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        
        //lbPassportNumber.Text = "*oldu";        

        foreach (GridViewRow row in GridView2.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chk = row.FindControl("VisaCheckBox") as CheckBox;
                TextBox mytxtPassportNumber = row.FindControl("txtPassportNumber") as TextBox;
                TextBox mytxtPassportExpDate = row.FindControl("txtPassportExpDate") as TextBox;
                Label mylbPassNumber = row.FindControl("lbPassportNumber") as Label;
                Label mylbPassExpDate = row.FindControl("lbPassportExpDate") as Label;              
             
                if (chk != null)
                {
                    if (chk.Checked)
                    {
                            if (string.IsNullOrEmpty(mytxtPassportNumber.Text))
                            {
                                mylbPassNumber.Text = "*Passport Number";
                                e.Cancel = true;
                                
                            }
                            else { mylbPassNumber.Text = ""; }

                            if (string.IsNullOrEmpty(mytxtPassportExpDate.Text))
                            {
                                mylbPassExpDate.Text = "*Expiration Date";
                                e.Cancel = true;
                               
                            }
                            else { mylbPassExpDate.Text = ""; }
                    }
                    else
                    {
                        mylbPassNumber.Text = "";
                        mylbPassExpDate.Text = "";
                    }

                }


            }
        }
    }






    protected void ToggleDone(object sender, EventArgs e)
    {      

        foreach (GridViewRow row in GridView2.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chk = row.FindControl("VisaCheckBox") as CheckBox;
                if (chk != null)
                {
                    if (chk.Checked)
                    {
                        chk.Text = "*Required";
                    }
                    else
                    {
                        chk.Text = "*Not Required";
                    }
                    
                }

               
            }
        }


    }





}