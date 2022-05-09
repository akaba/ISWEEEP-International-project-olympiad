#region imports

using System;
using System.Web.UI;
using System.Data;
#endregion

public partial class Admin_Statistics : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void countryProjects_Selected(object sender, System.Web.UI.WebControls.SqlDataSourceStatusEventArgs e)
    {
        Label1.Text = e.AffectedRows + " ";
    }
}