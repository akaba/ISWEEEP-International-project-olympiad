using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ApplicationTypes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AccessDataSource1.SelectCommand = @"SELECT Title, Country, RegionalName, Status, ApplicationType 
                FROM [Projects] WHERE (  ( (" + (DropDownList2.SelectedIndex==0).ToString() + "  and ApplicationType<>'Individual' ) or ApplicationType=?) and (" + (DropDownList1.SelectedIndex==0).ToString()+ " or Country=?)   )";
           
    }
    protected void AccessDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e) {
        Label1.Text = e.AffectedRows + " projects...";
    }
}
