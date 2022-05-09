using System;
using System.Collections;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Web.Services.Protocols;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.Common;
using System.Data.OleDb;
/// <summary>
/// Summary description for SearchAutoComplete
/// </summary>
[System.Web.Script.Services.ScriptService]
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class SearchAutoComplete : System.Web.Services.WebService {

    public SearchAutoComplete () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
    [System.Web.Services.WebMethod]
    public string[] GetCompletionList(string prefixText, int count)
    {
        //        dim dbconn,sql,dbcomm,dbread
        OleDbConnection dbconn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;data source=" + Server.MapPath("~/app_data/isweeep.mdb"));
        dbconn.Open();
        string sql="SELECT title FROM projects where title like '%" + prefixText + "%' ";
        OleDbCommand dbcomm=new OleDbCommand(sql,dbconn);
        OleDbDataReader dbread=dbcomm.ExecuteReader();
         ArrayList suggestions = new ArrayList(10);
         int i=0;
         while( dbread.HasRows && dbread.Read() && i++<10)
         {
            suggestions.Add( dbread.GetValue(0).ToString());
         }
        
        dbread.Close();
        dbconn.Close();

        suggestions.TrimToSize();
        string [] ret = (string[]) suggestions.ToArray(typeof (string));
        return ret;

    }

}

