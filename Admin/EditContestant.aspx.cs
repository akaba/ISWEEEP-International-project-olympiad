using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_EditContestant : System.Web.UI.Page
{
    string contestant;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("Logon.aspx?msj=1");
            return;
        }

        // if (IsPostBack)  AccessDataSource1.SelectCommand = "SELECT * FROM [Contestants] WHERE [ContestantID] =" + ContestantBox.SelectedValue;
        contestant = Request.QueryString["cid"];
    }


    protected void ContestantBox_DataBound(object sender, EventArgs e)
    {
        ContestantBox.SelectedValue = contestant;       
    }


    protected void ContestantBox_SelectedIndexChanged(object sender, EventArgs e)
    {
       // DetailsView1.DataBind();
        Response.Redirect("EditContestant.aspx?cid=" + ContestantBox.SelectedValue);
    }


}