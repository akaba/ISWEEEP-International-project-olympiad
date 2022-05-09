#region imports

using System;
using System.Data;
using System.Drawing;
using System.Web.UI;

#endregion

public partial class Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["msj"] == "1")
        {
            Label1.ForeColor = Color.Red;
            Label1.Text = "You need to login to continue";
        }
        else if (Request.QueryString["msj"] == "2")
        {
            Label1.ForeColor = Color.Blue;
            Label1.Text = "You logged out succesfully";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {

            if (string.IsNullOrEmpty(TextBox1.Text) || string.IsNullOrEmpty(TextBox2.Text))
            {
                // Label1.Text = "Required";
                return;
            }


            DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);

            if (dv.Table.Rows.Count < 1)
            {
                Label1.Text = "There is no such a project code";
                return;
            }

            else if (dv.Table.Rows.Count == 1)
            {
                int id = int.Parse((dv.Table.Rows[0]["pid"].ToString()));
                string status = ((dv.Table.Rows[0]["status"].ToString()));
                string email = ((dv.Table.Rows[0]["email"].ToString()));
                string ApplicationType = ((dv.Table.Rows[0]["ApplicationType"].ToString()));
                string projectCode = ((dv.Table.Rows[0]["projectCode"].ToString()));
                string RegionalName = ((dv.Table.Rows[0]["RegionalName"].ToString()));
                string state = ((dv.Table.Rows[0]["State"].ToString()));
                string ProjectCountry = ((dv.Table.Rows[0]["country"].ToString()));

                if (email != "" && email != TextBox2.Text.Trim())
                {
                    //do not let it go in
                    Label1.Text = "Email address is wrong.";
                    return;
                }
                else if (email == "" && (ApplicationType == "Recommended" || ApplicationType == "Qualified"))
                {
                    //write email address to database if invitation code entered...
                    string updateCmd = "update projects set email='" + TextBox2.Text.Trim() + "' where projectCode='" +
                                       projectCode + "'";
                    EmailSender es = new EmailSender();
                    string msj = "Project Code:" + projectCode + "<br>";
                    msj += "Email Address: " + TextBox2.Text.Trim() + "<br>";
                    msj += "Regional Name: " + RegionalName + "<br>";
                    es.sendMail(msj, ApplicationType + " project logged in for the first time", "info@isweeep.org", "info@isweeep.org");
                    DataGrabber dg = new DataGrabber();
                    dg.ExecuteNonQuery(updateCmd, Server.MapPath("~/app_data/isweeep.mdb"));

                }


                string ProjectRiskFormStatus = ((dv.Table.Rows[0]["riskformdata"].ToString()));
                string ProjectIsContinuation = ((dv.Table.Rows[0]["Continuation"].ToString()));

                Session["pid"] = id;
                Session["ProjectStatus"] = status;
                Session["ApplicationType"] = ApplicationType;
                Session["ProjectCountry"] = ProjectCountry;
                Session["ProjectRiskFormRequired"] = (ProjectRiskFormStatus != "");
                Session["ProjectIsContinuation"] = ProjectIsContinuation;


                if (string.IsNullOrEmpty(state) && ProjectCountry == "UNITED STATES")
                    Response.Redirect("SetState.aspx");
                else if (status == "Saved")
                    Response.Redirect("checklist.aspx");
                else if (string.IsNullOrEmpty(status))
                    Response.Redirect("ProjectInformation.aspx");
                else Response.Redirect("ProjectStatus.aspx");
            }
            else
            {
                Label1.Text = "2 projects found for the same code, please contact us";
            }

        }
        else
        {
            return;
        }

    
    }
 }