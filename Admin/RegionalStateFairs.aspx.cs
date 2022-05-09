using System;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using AjaxControlToolkit;
using System.Drawing;



public partial class Admin_RegionalStateFairs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
        
        if (IsPostBack)
        {
            if (CheckBox1.Checked)
                AccessDataSource1.SelectCommand = "SELECT * FROM [Regional_State_Fairs] WHERE ( active=false and ([state] = '" + ddStates.SelectedValue + "' or " + ddStates.SelectedValue.Equals("0") + " )  ) order by id";
            else
                AccessDataSource1.SelectCommand = "SELECT * FROM [Regional_State_Fairs] WHERE ( active=true and ([state] = '" + ddStates.SelectedValue + "' or " + ddStates.SelectedValue.Equals("0") + " ) ) order by id";

            GridView1.DataBind();
        }
        
     

    }
    protected void ddStates_DataBound(object sender, EventArgs e)
    {
        ddStates.Items.Insert(0, new ListItem("All", "0"));
        ddStates.SelectedIndex = 0;
    }

    protected void ddStates_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

   


}