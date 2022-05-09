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

public partial class Admin_InternationalAffiliates : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            if (CheckBox1.Checked)
                AccessDataSource1.SelectCommand = "SELECT * FROM [International_Fairs] WHERE ( active=false and ([Country] = '" + ddCountry.SelectedValue + "' or " + ddCountry.SelectedValue.Equals("0") + " )  ) order by id";
            else
                AccessDataSource1.SelectCommand = "SELECT * FROM [International_Fairs] WHERE ( active=true and ([Country] = '" + ddCountry.SelectedValue + "' or " + ddCountry.SelectedValue.Equals("0") + " ) ) order by id";

            GridView1.DataBind();
        }

    }

    protected void ddCountry_DataBound(object sender, EventArgs e)
    {
        ddCountry.Items.Insert(0, new ListItem("All", "0"));
        ddCountry.SelectedIndex = 0;
    }

    protected void ddCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

  
}