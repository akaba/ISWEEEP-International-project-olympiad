#region imports

using System;
using System.Data;
using System.Drawing;
using System.Web.UI;

#endregion

public partial class Admin_VisaLetterText : System.Web.UI.Page
{
    private string adminname;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            adminname = Session["admin"].ToString();
        }
        catch (Exception ee)
        {
            //lblMessage.Text = "Session timed out. Please <a href='login.aspx?msj=1'>login</a>  to continue";
            Response.Redirect("Logon.aspx?msj=1");
            return;
        }
        if (!IsPostBack)
            Fill();

    }

    private void Fill()
    {
        DataGrabber dg = new DataGrabber();
        AccessDataSource1.SelectCommand = "select * from Docs where docid=1";
        DataTable dt = dg.DB2Table(AccessDataSource1);

        if (dt.Rows.Count < 1)
        {
            Labelmsg.Text = "<h2>No data found please fill out form and save...</h2>";
            return;
        }       
      
        string myletter = dt.Rows[0]["letter"].ToString();     
        txtletter.Text = myletter;         
    }


    protected void ButtonSave_Click(object sender, EventArgs e)
    {
        DataGrabber dg = new DataGrabber();
        int docid = 1;
        string mydoc = "visaletter";
        string myletter = dg.getValue(txtletter); 
        
   
        if (txtletter.Text.Length < 100)
        {
            Labelmsg.Text = "You need to enter <b>Letter</b> before you save it";
            return;
        }
  


        string UpdateCmd = "UPDATE Docs SET ";
        UpdateCmd += " docname = '" + mydoc + "', ";       
        UpdateCmd += " letter = '" + myletter + "' ";
        UpdateCmd += " WHERE docid = " + docid;
        //Labelmsg.Text = UpdateCmd;
        try
        {
           AccessDataSource1.UpdateCommand = UpdateCmd;
           AccessDataSource1.Update();
           Labelmsg.Text = "<h4>Form saved successfully.</h4>";
          
        }
        catch (Exception etc)
        {
             Labelmsg.Text ="Database error! Please contact technical support:" + etc.Message + "\n" +
             AccessDataSource1.UpdateCommand;          
             return;
        }

       

    }
}