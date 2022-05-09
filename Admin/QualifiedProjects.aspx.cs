using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class QualifiedProjects : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void DropDownList2_DataBound(object sender, EventArgs e)
    {
        DropDownList2.Items.Insert(0, new ListItem("All", "0"));
        DropDownList2.SelectedIndex = 0;
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex > 0)
        {
            AccessDataSource1.FilterExpression = "Country='" + DropDownList1.SelectedValue + "'";
            DataList1.DataBind();
        }
        else
        {
            AccessDataSource1.FilterExpression = null;
            DataList1.DataBind();
        }
    }
    protected string WriteContestants(string c1, string c2, string c3)
    {
        if (string.IsNullOrEmpty(c2))
            return c1;
        else if(string.IsNullOrEmpty(c3)) return c1 + " and " + c2;
        else return c1 + ", " + c2 + " and " + c3;

    }
    protected string WritePlace(string country, string state, string city)
    {
        string place="";
        if (country == "UNITED STATES")
            place = state;
        else place = country;

        return city + ", " + place;
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedIndex > 0)
        {
            AccessDataSource1.FilterExpression = "Category='" + DropDownList2.SelectedValue + "'";
            DataList1.DataBind();
        }
        else
        {
            AccessDataSource1.FilterExpression = null;
            DataList1.DataBind();
        }
    }
}
