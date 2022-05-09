#region imports

using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Net.Mail;

#endregion

public partial class Admin_Contestants : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (CheckBox1.Checked)
            AccessDataSource1.SelectCommand = "SELECT * FROM [Contestants] WHERE pid in (select pid from projects where status='Qualified')";
        else
            AccessDataSource1.SelectCommand = "SELECT * FROM [Contestants] ";


        if (IsPostBack)
            AccessDataSource1.SelectCommand = "SELECT * FROM [Contestants] WHERE  ( ([ContestantID] = " +
                ContestantBox.SelectedValue + " or  " + ContestantBox.SelectedValue.Equals("0") + " )     ) order by pid"; 

        GridView1.DataBind();
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.PageSize = int.Parse(DropDownList1.SelectedValue);
        GridView1.DataBind();
    }


    protected void ContestantBox_DataBound(object sender, EventArgs e)
    {
        ContestantBox.Items.Insert(0, new ListItem("All", "0"));
        ContestantBox.SelectedIndex = 0;
    }
    protected void ContestantBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
}