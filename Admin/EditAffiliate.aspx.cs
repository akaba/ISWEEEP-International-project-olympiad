using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_EditAffiliate : System.Web.UI.Page
{
     private string adminname;

    protected void Page_Load(object sender, EventArgs e)
    {

          try
        {
            adminname = Session["admin"].ToString();
        }
        catch (Exception ee)        {
         
            Response.Redirect("Logon.aspx?msj=1");
            return;
        }

          if (Request.QueryString["rf"] != null)
          {
              DetailsView1.Visible = true;
              DetailsView2.Visible = false;
             
          } else if (Request.QueryString["if"] != null)
          {
              DetailsView1.Visible = false;
              DetailsView2.Visible = true;
          }
      
         

    }}