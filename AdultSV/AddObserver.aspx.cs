using System;
using System.Web.UI.WebControls;

public partial class AdultSV_AddObserver : System.Web.UI.Page
{
    private int asvid;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            asvid = Convert.ToInt32(Session["asvid"].ToString());
        }
        catch (NullReferenceException)
        {
            Response.Redirect("adultsvlogin.aspx?msj=1");
            return;
        }
    }
   
    protected void FormView1_ItemInserted(object sender, System.Web.UI.WebControls.FormViewInsertedEventArgs e)
    {
        lblMessage.Text = "";
        if (e.Exception != null)
        {
            e.KeepInInsertMode =true;
            e.ExceptionHandled = true;
            
            for (int i=0; i<e.Values.Count;i++)// VARIABLE in e.Values)
            {
                lblMessage.Text += i +": " + e.Values[i].ToString() + " | ";
                guestData.InsertParameters[i].ToString();
            }
            for (int i = 0; i < guestData.InsertParameters.Count; i++)// VARIABLE in e.Values)
            {
                lblMessage.Text += i + ": " + guestData.InsertParameters[i].ToString() + " | ";
            }
            lblMessage.Text += e.Exception.Message + guestData.InsertCommand;
            
            return;
        }

    }

    protected void guestData_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {

    }
    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        lblMessage.Text = "";
        if (e.Exception != null)
        {
            e.KeepInEditMode = true;
            e.ExceptionHandled = true;

            for (int i = 0; i < e.NewValues.Count; i++)// VARIABLE in e.Values)
            {
                lblMessage.Text += i + ": " + e.NewValues[i].ToString() + " | ";
                guestData.InsertParameters[i].ToString();
            }
            for (int i = 0; i < guestData.InsertParameters.Count; i++)// VARIABLE in e.Values)
            {
                lblMessage.Text += i + ": " + guestData.InsertParameters[i].ToString() + " | ";
            }
            lblMessage.Text += e.Exception.Message + guestData.InsertCommand;

            return;
        }
    }
}

