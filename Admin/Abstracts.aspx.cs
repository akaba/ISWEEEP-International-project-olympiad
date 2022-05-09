#region imports

using System;
using System.Data;
using System.Drawing;
using System.Web.UI;

#endregion

public partial class Admin_Abstracts : Page
{
    string pid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Reviewer"]==null && (Session["admin"] == null || Session["admin"].ToString().Length < 5) )
        {
            Response.Redirect("logon.aspx?msj=1");
        }

        if (Session["admin"] != null)
        {
            ButtonEdit.Visible = true;
        }

        pid = Request.QueryString["id"];

        if (!IsPostBack)
            Fill();
    }

    private void Fill()
    {
        DataGrabber dg = new DataGrabber();
        AccessDataSource3.SelectCommand = "SELECT * FROM [AbstractsByProjects] WHERE [pid] =" + pid;
        DataTable dt = dg.DB2Table(AccessDataSource1);

        if (dt.Rows.Count < 1)
        {
            txtAbstract.Text = "<h2>No data found please fill out form and save...</h2>";
            return;
        }

        string myAbstracts = dt.Rows[0]["Abstract"].ToString();
        txtAbstract.Text = myAbstracts;
    }


    protected void ButtonEdit_Click(object sender, EventArgs e)
    {
        DataList1.Visible = false;
        txtAbstract.Visible = true;
        ButtonEdit.Visible = false;
        ButtonSave.Visible = true;

    }
    protected void ButtonSave_Click(object sender, EventArgs e)
    {      
        DataGrabber dg = new DataGrabber();
        string myAbstract = dg.getValue(txtAbstract);

        if (txtAbstract.Text.Length < 100)
        {
            Labelmsg.Text = "You need to enter <b>Abstract</b> before you save it";
            return;
        }

        string UpdateCmd = "UPDATE Abstracts SET ";
        UpdateCmd += " Abstract = '" + myAbstract + "' ";      
        UpdateCmd += " WHERE pid = " + pid;
        //Labelmsg.Text = UpdateCmd;
        
        try
        {
            AccessDataSource3.UpdateCommand = UpdateCmd;
            AccessDataSource3.Update();
            Labelmsg.Text = "<h4>Abstract saved successfully.</h4>";

        }
        catch (Exception etc)
        {
            Labelmsg.Text = "Database error! Please contact technical support:" + etc.Message + "\n" + AccessDataSource3.UpdateCommand;           
            return;
        }


        DataList1.Visible = true;
        txtAbstract.Visible = false;
        ButtonEdit.Visible = true;
        ButtonSave.Visible = false;
        DataList1.DataBind();


    }
}