#region imports

using System;
using System.Data;
using System.Drawing;
using System.Web.UI;

#endregion

public partial class Admin_LoginAS : System.Web.UI.Page
{
    string myid;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("Logon.aspx?msj=1");
            return;
        }


        if (!IsPostBack)
        {
            //project login
            if (Request.QueryString["id"] != null)
            {
                myid = Request.QueryString["id"];
                ProjectLogin();
            }

            //AdultSupervisor login
            if (Request.QueryString["asvid"] != null)
            {
                myid = Request.QueryString["asvid"];
                ASVLogin();
            }

        }            


    }


    private void ProjectLogin()
    {     
        AccessDataSource1.SelectCommand = "SELECT * FROM Projects WHERE pid=" + myid;
        DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count < 1)
        {
            Label1.Text = "There is no such a project";
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
            string ProjectRiskFormStatus = ((dv.Table.Rows[0]["riskformdata"].ToString()));
            string ProjectIsContinuation = ((dv.Table.Rows[0]["Continuation"].ToString()));

            Session["pid"] = id;
            Session["ProjectStatus"] = status;
            Session["ApplicationType"] = ApplicationType;
            Session["ProjectCountry"] = ProjectCountry;
            Session["ProjectRiskFormRequired"] = (ProjectRiskFormStatus != "");
            Session["ProjectIsContinuation"] = ProjectIsContinuation;


            if (string.IsNullOrEmpty(state) && ProjectCountry == "UNITED STATES")
                Response.Redirect("../contestants/SetState.aspx");
            else if (status == "Saved")
                Response.Redirect("../contestants/checklist.aspx");
            else if (string.IsNullOrEmpty(status))
                Response.Redirect("../contestants/ProjectInformation.aspx");
            else Response.Redirect("../contestants/ProjectStatus.aspx");
        }
        else
        {
            Label1.Text = "2 projects found for the same code, please contact us";
        }
    }

    private void ASVLogin()
    {
        AccessDataSource1.SelectCommand="SELECT * FROM AdultSupervisors WHERE ASVID =" + myid;

        DataView dv = (DataView)AccessDataSource1.Select(DataSourceSelectArguments.Empty);

        if (dv.Table.Rows.Count < 1)
        {
            Label1.Text = "Your login information is incorrect please try again.";
            return;
        }

        if (dv.Table.Rows.Count == 1)
        {
            int id = int.Parse((dv.Table.Rows[0]["asvid"].ToString()));
            string name = dv.Table.Rows[0]["ASVName"].ToString() + " " + dv.Table.Rows[0]["ASVLastName"].ToString();
            //bool submitted = Boolean.Parse(dv.Table.Rows[0]["submitted"].ToString());
            //if (submitted == true)
            //{
            //    lblMessage.Text = "You already finished and submitted the process. Please email to info@isweeep.org if anything needs to be changed.";
            //    return;
            //}
            Session["asvname"] = name;
            Session["asvid"] = id;
            Response.Redirect("../AdultSV/adultsupervisorinfo.aspx");
        }

    }
}