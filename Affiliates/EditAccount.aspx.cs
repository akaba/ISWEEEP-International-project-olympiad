using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class Affiliates_EditAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
        if (Session["orgid"] == null)
        {
            Response.Redirect("Logon.aspx");
        }
        else
        {
           string orgid = Session["orgid"].ToString();
           string numorgid = orgid.Substring(1);
           Session["id"] = numorgid;
           //Label1.Text = orgid.ToString();
           //Label1.Text = orgid[0].ToString();
           if (orgid[0].ToString() == "N")
           {
               DetailsView1.Visible = true;
               DetailsView2.Visible = false;
             
           }
           else 
           {
               DetailsView1.Visible = false;
               DetailsView2.Visible = true;
             
           }

           if (Request.QueryString["msj"] == "1")
           {

               Label1.Text = "Please update information of your organization";
           }
         

        }

    }
}