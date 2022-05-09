#region imports

using System;
using System.Data;
using System.Drawing;
using System.Web.UI;

#endregion

public partial class SupervisorInformation : Page
{
    private int id;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            id = Convert.ToInt32(Session["pid"].ToString());
        }
        catch (Exception ee)
        {
            lblMessage.Text = "Session timed out. Please <a href='login.aspx?msj=1'>login</a>  to continue";
            Response.Redirect("login.aspx?msj=1");
            return;
        }
        if (!IsPostBack)
        {
            fill();
            setStatus();
        }
    }

    private void setStatus()
    {
        string status = Session["ProjectStatus"].ToString().Trim();
        if (
            !(status.Equals("saved", StringComparison.OrdinalIgnoreCase) ||
              status.Equals("", StringComparison.OrdinalIgnoreCase)))
        {
            lblMessage.ForeColor = Color.Blue;
            lblMessage.Text = "Your project status is currently " + status + "<br>You cannot make changes at this time";
            btnSubmit.Visible = false;
        }
    }

    private void fill()
    {
        AccessDataSource1.SelectCommand =
            "select svname, svlastname, svemail from projectsupervisors where svid in (select psvid from projects where pid = " +
            id + ")";
        DataGrabber dg = new DataGrabber();
        try
        {
            DataTable dt = dg.DB2Table(AccessDataSource1);
            if (dt.Rows.Count == 1)
            {
                txtFirstName.Text = dt.Rows[0][0].ToString();
                txtLastName.Text = dt.Rows[0][1].ToString();
                txtEmail.Text = dt.Rows[0][2].ToString();
            }
        }
        catch (Exception ett)
        {
            return;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if(Page.IsValid) 
        { 
        DataGrabber dg = new DataGrabber();
        string fname = dg.getValue(txtFirstName);
        string lname = dg.getValue(txtLastName);
        string email = dg.getValue(txtEmail);

        string find = "select svid, svname, svlastname from projectsupervisors where svemail='" + email + "'";
        AccessDataSource1.SelectCommand = find;
        DataTable dt = dg.DB2Table(AccessDataSource1);
        if (dt.Rows.Count == 1)
        {
            int svid = Convert.ToInt32(dt.Rows[0][0].ToString());
            string svname = (dt.Rows[0]["svname"].ToString());
            string svlastname = (dt.Rows[0][2].ToString());
            AccessDataSource1.UpdateCommand = "update projects set psvid = " + svid + " where pid = " + id;
            AccessDataSource1.Update();
            if (!svname.Equals(fname, StringComparison.OrdinalIgnoreCase) ||
                !svlastname.Equals(lname, StringComparison.OrdinalIgnoreCase))
            {
                lblMessage.Text = "A project supervisor with this email address already exists: " + svname + " " +
                                  svlastname;
                lblMessage.Text +=
                    ". He/She will be added as your supervisor.<br>If this name is wrong, please email to info@isweeep.org<br><br>";
            }
            else
            {
                lblMessage.Text = "";
            }
            lblMessage.ForeColor = Color.Blue;
            lblMessage.Text +=
                "You successfully saved your project supervisor information. Click <a href='abstractsubmission.aspx'>here</a> to submit your abstract";
            return;
        }
        else
        {
            string cmd = "insert into projectsupervisors(svname,svlastname,svemail) values(";
            cmd += "'" + fname + "', ";
            cmd += "'" + lname + "', ";
            cmd += "'" + email + "' )";

            try
            {
                AccessDataSource1.InsertCommand = cmd;
                AccessDataSource1.Insert();
            }
            catch (Exception ett)
            {
                lblMessage.Text = "Information could not be saved!";
                return;
            }

            string find2 = "select svid from projectsupervisors where svemail='" + email + "'";
            AccessDataSource1.SelectCommand = find2;
            DataTable dt2 = dg.DB2Table(AccessDataSource1);
            if (dt2.Rows.Count == 1)
            {
                int svid = Convert.ToInt32(dt2.Rows[0][0]);
                AccessDataSource1.UpdateCommand = "update projects set psvid = " + svid + " where pid = " + id;
                AccessDataSource1.Update();
            }
        }
        lblMessage.ForeColor = Color.Blue;
        lblMessage.Text =
            "You successfully saved your project supervisor information. Click <a href='abstractsubmission.aspx'>here</a> to submit your abstract";
        }
        else
        {
            return;
        }
     }

}