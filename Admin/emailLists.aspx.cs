#region imports

using System;
using System.Collections;
using System.Data.OleDb;
using System.Web.UI;

#endregion

public partial class Admin_emailLists : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string sql = "SELECT JEMAIL FROM Judges where status='avaliable'";
        
			executeQuery(sql);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string sql = "SELECT svemail FROM projectsupervisors where svid in(select psvid from projects )";
        
			executeQuery(sql);
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        
        string sql =
            "SELECT svemail FROM projectsupervisors where svid in(select psvid from projects where status='Qualified' )";
        
			executeQuery(sql);
    }
	
	protected void Button5_Click(object sender, EventArgs e)
    {
        string sql ="SELECT email FROM projects where status='Qualified'";
			executeQuery(sql);
    }
	protected void Button6_Click(object sender, EventArgs e)
    {
        string sql = "SELECT email FROM projects where status='Not Qualified'";
			executeQuery(sql);
    }


    protected void Button7_Click(object sender, EventArgs e)
    {
        string sql = "SELECT email FROM projects WHERE status is Not Null";
        executeQuery(sql);
    }
	
	public void executeQuery(String sql)
	{
		txtList.Text = "";
        OleDbConnection dbconn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;data source=" + Server.MapPath("~/app_data/isweeep.mdb"));
                                
        dbconn.Open();
        
        OleDbCommand dbcomm = new OleDbCommand(sql, dbconn);
        OleDbDataReader dbread = dbcomm.ExecuteReader();
        ArrayList emails = new ArrayList();
        int i = 0;
        while (dbread.HasRows && dbread.Read())
        {
            txtList.Text += (dbread.GetValue(0)) + "; ";
            i++;
        }
        Label1.Text = i + " results";
        dbread.Close();
        dbconn.Close();
	}
}