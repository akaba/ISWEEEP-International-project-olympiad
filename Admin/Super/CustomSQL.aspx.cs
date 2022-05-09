#region imports

using System;
using System.Data.OleDb;
using System.Web.UI;

#endregion

public partial class Admin_Super_CustomSQL : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string command = TextBox1.Text.Trim();

            OleDbConnection dbconn =
                new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;data source=" +
                                    Server.MapPath("~/app_data/isweeep.mdb"));

            string sql = command;
            OleDbCommand dbcomm = new OleDbCommand(sql, dbconn);
            dbconn.Open();
            int rows = dbcomm.ExecuteNonQuery();
            mesaj.Text = rows + " records effected...";


            dbconn.Close();
        }
        catch (Exception ex)
        {
            mesaj.Text = "Hata: " + ex.Message;
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            string command = TextBox1.Text.Trim();

            OleDbConnection dbconn =
                new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;data source=" +
                                    Server.MapPath("~/app_data/isweeep.mdb"));

            string sql = command;
            OleDbCommand dbcomm = new OleDbCommand(sql, dbconn);
            dbconn.Open();

            GridView1.DataSource = dbcomm.ExecuteReader();
            GridView1.DataBind();

            mesaj.Text = GridView1.Rows.Count + " result...";


            dbconn.Close();
        }
        catch (Exception ex)
        {
            mesaj.Text = "Hata: " + ex.Message;
        }
    }
}