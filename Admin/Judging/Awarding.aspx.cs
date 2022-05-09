#region imports

using System;
using System.Web.UI;
using System.Web.UI.WebControls;

#endregion

public partial class Admin_Judging_Awarding : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        projectData.SelectCommand = "SELECT * FROM  JudgingResults";
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.PageSize = int.Parse(DropDownList1.SelectedValue);
    }

    protected void countryBox_DataBound(object sender, EventArgs e)
    {
        countryBox.Items.Insert(0, new ListItem("All", "0"));
        countryBox.SelectedIndex = 0;
        //projectData.FilterExpression += "country= '" + countryBox.SelectedValue + "' or " +countryBox.SelectedValue.Equals("0");
    }

    protected void countryBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (countryBox.SelectedIndex != 0)
        {
            projectData.SelectCommand = "select * from judgingResults where country='" + countryBox.SelectedValue + "'";
            GridView1.DataBind();
        }
    }

    protected void categories_DataBound(object sender, EventArgs e)
    {
        categoryList.Items.Insert(0, new ListItem("All", "0"));
        categoryList.SelectedIndex = 0;
    }

    protected void categories_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (categoryList.SelectedIndex != 0)
        {
            projectData.SelectCommand = "select * from judgingResults where cat='" + categoryList.SelectedValue + "'";
            GridView1.DataBind();
        }
        ////projectData.FilterExpression = "category='" + categoryList.SelectedValue + "'";
    }


    protected void projectData_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label1.Text = e.AffectedRows + " Results ";
    }
}