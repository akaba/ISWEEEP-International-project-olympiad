using System;
using System.Web.UI.WebControls;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class AdultSV_AddChaperone : System.Web.UI.Page
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
        if (IsValid)
        {
            lblMessage.Text = "";
            if (e.Exception != null)
            {
                e.KeepInInsertMode = true;
                e.ExceptionHandled = true;

                for (int i = 0; i < e.Values.Count; i++)// VARIABLE in e.Values)
                {
                    lblMessage.Text += e.Values[i].ToString() + " ";
                }
                lblMessage.Text += e.Exception.Message;
                return;
            }
        }
        else
        { 
            return;
        }

    }


    protected void ToggleVisa(object sender, EventArgs e)
    {      
       
                CheckBox chk = (CheckBox)FormView1.FindControl("VisaCheckBox");
                Label LabelVisa = (Label)FormView1.FindControl("LabelVisa");       
                RequiredFieldValidator RequiredFieldValidator4 = (RequiredFieldValidator)FormView1.FindControl("RequiredFieldValidator4");
                RequiredFieldValidator RequiredFieldValidator5 = (RequiredFieldValidator)FormView1.FindControl("RequiredFieldValidator5");
                if (chk != null)
                {
                    if (chk.Checked)
                    {
                        LabelVisa.Text = "*Required";                     
                        RequiredFieldValidator4.Enabled = true;
                        RequiredFieldValidator5.Enabled = true;
                    }
                    else
                    {
                        LabelVisa.Text = "*Not Required";                      
                        RequiredFieldValidator4.Enabled = false;
                        RequiredFieldValidator5.Enabled = false;
                    }

                }
    }




    protected void ToggleDone(object sender, EventArgs e)
    {

            CheckBox chk = (CheckBox)FormView1.FindControl("MyCheckBox");
            Button btn = (Button)FormView1.FindControl("InsertButton");   
            
            if (chk != null)
            {
                if (chk.Checked)
                {                    
                    btn.Visible = true;                   
                }
                else
                {                      
                       btn.Visible = false;                      
                }
            }
            
          
        
        }
          


     

    

  







}

