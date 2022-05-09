#region imports

using System;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web;
using System.Globalization;
using System.Threading;

#endregion

/// <summary>
/// Summary description for DataGrabber
/// </summary>
public class DataGrabber
{
    public DataTable DB2Table(AccessDataSource ads)
    {
        DataView dw = (DataView) ads.Select(DataSourceSelectArguments.Empty);

        return dw.ToTable();
    }

    public object getDataAt(AccessDataSource access, int row, int col)
    {
        return (DB2Table(access)).Rows[row][col];
    }

    public string getStringAt(DataTable dt, int row, int col)
    {
        return correct((dt.Rows[row][col]).ToString());
    }

    public int getIntAt(AccessDataSource access, int row, int col)
    {
        return Convert.ToInt32(((DB2Table(access)).Rows[row][col]));
    }

    public string getValue(Control c)
    {
        if (c.GetType() == new TextBox().GetType())
        {
            return correct(((TextBox) c).Text.Trim());
        }
        if (c.GetType() == new DropDownList().GetType())
        {
            return correct(((DropDownList) c).SelectedValue.Trim());
        }
        return " ";
    }

    public string correct(string s)
    {
        return s.Replace("'", "''");
    }
    public int ExecuteNonQuery(string query)
    {
        string DBPath = HttpContext.Current.Request.MapPath("~/app_data/isweeep.mdb");
        //string DBPath = Server.MapPath("~/app_data/isweeep.mdb");
        OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;data source=" + DBPath);
        OleDbCommand comm = new OleDbCommand(query, conn);
        conn.Open();
        int i = comm.ExecuteNonQuery();
        conn.Close();
        return i;
    }
    public int ExecuteNonQuery(string query, string DBPath)
    {
        OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;data source=" + DBPath);
        OleDbCommand comm = new OleDbCommand(query, conn);
        conn.Open();
        int i = comm.ExecuteNonQuery();
        conn.Close();
        return i;
    }
    public Object ExecuteScalarQuery(string query)
    {
        string DBPath = HttpContext.Current.Request.MapPath("~/app_data/isweeep.mdb");
        //Server.MapPath("~/app_data/isweeep.mdb");
        OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;data source=" + DBPath);
        OleDbCommand comm = new OleDbCommand(query, conn);
        conn.Open();
        object dt = comm.ExecuteScalar();
        conn.Close();
        return dt;
    }
    public Object ExecuteScalarQuery(string query, string DBPath)
    {
        OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;data source=" + DBPath);
        OleDbCommand comm = new OleDbCommand(query, conn);
        conn.Open();
        object dt = comm.ExecuteScalar();
        conn.Close();
        return dt;
    }
    public DataTable ExecuteSelectQuery(string query)
    {
        string DBPath = HttpContext.Current.Request.MapPath("~/app_data/isweeep.mdb");
        //string DBPath = Server.MapPath("~/app_data/isweeep.mdb");
        OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;data source=" + DBPath);
        OleDbDataAdapter da = new OleDbDataAdapter(query, conn);
        DataTable dt = new DataTable();
        conn.Open();
        da.Fill(dt);
        conn.Close();
        return dt;
    }
    public DataTable ExecuteSelectQuery(string query, string DBPath)
    {
        OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;data source=" + DBPath);
        OleDbDataAdapter da = new OleDbDataAdapter(query, conn);
        DataTable dt = new DataTable();
        conn.Open();
        da.Fill(dt);
        conn.Close();
        return dt;
    }
    public string toTitleCase(string input)
    {
        CultureInfo cultureInfo = Thread.CurrentThread.CurrentCulture;
        TextInfo textInfo = cultureInfo.TextInfo;

        return textInfo.ToTitleCase(input.ToLower());

    }

    public String fixFileName(String fileName)
    {
        foreach (char c in System.IO.Path.GetInvalidFileNameChars())
        {
            fileName = fileName.Replace(c, '_');
        }
        fileName = fileName.Replace(' ', '_');
        fileName = fileName.Replace("'", "");
        return fileName;
    }

}