using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_JudgeCheckin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("Logon.aspx?msj=1");
            return;
        }

        if (IsPostBack)
          AccessDataSource1.SelectCommand = "SELECT * FROM [Judges] WHERE  ( ([JudgeId] = " + JudgeBox.SelectedValue + " or  " + JudgeBox.SelectedValue.Equals("0") + " )     ) order by JudgeId";
                

        //GridView1.DataBind();
    }


    protected void JudgeBox_DataBound(object sender, EventArgs e)
    {
        JudgeBox.Items.Insert(0, new ListItem("All", "0"));
        JudgeBox.SelectedIndex = 0;
    }
    protected void JudgeBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
}