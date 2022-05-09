using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class QualifiedProjects : System.Web.UI.Page
{
    DataGrabber dg;
    protected void Page_Load(object sender, EventArgs e)
    {
            dg = new DataGrabber();
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
    protected string WriteProject(string c1)
    {
		return c1;
       //return  dg.toTitleCase(c1);
    }
    protected string WritePlace(string c1, string c2)
    {
        if (string.IsNullOrEmpty(c2) || c2 == "-" || c1 != "UNITED STATES")
            return c1;
        else return "USA" + " - " + c2;

    }
    protected string WriteContestants(string c1, string c2)
    {
        if (string.IsNullOrEmpty(c2))
            return  dg.toTitleCase( c1 );
        else return dg.toTitleCase(c1) + " and " + dg.toTitleCase(c2);

    }
}
