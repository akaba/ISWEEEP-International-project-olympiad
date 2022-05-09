using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;


public partial class Affiliates_CodeAssignment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["orgid"] == null)
        {
            Response.Redirect("Logon.aspx");
        }
        else
        {

            DataView dvAccess = (DataView)ScienceFairsData.Select(DataSourceSelectArguments.Empty);
            Label1.Text = dvAccess[0][0].ToString();
            Label2.Text = dvAccess[0][1].ToString();
            Label3.Text = dvAccess[0][2].ToString();
            Label4.Text = dvAccess[0][3].ToString();
            if (DBNull.Value.Equals(dvAccess[0][2]))           
            {
                Response.Redirect("logon.aspx?msj=3");
            }

            int limit = Convert.ToInt32(dvAccess[0][2]);
            int created = Convert.ToInt32(dvAccess[0][3]);
         
            if (created == limit)
            {                
                btnGenerate.Visible = false;
                DataGrabber dg = new DataGrabber();
                string fairID = Session["orgid"].ToString();
                DataTable dt = dg.ExecuteSelectQuery("Select ProjectCode from Projects where RegionalID='" + fairID + "'");
                StringBuilder t = new StringBuilder("Following project codes created:<br/><br/><table class='Codegenereted'>");
             
                foreach (DataRow dataRow in dt.Rows)
                {               
                  //for (int x = 0; x < dt.Columns.Count; x++)
                  //  {
                    t.Append("<tr><td>" + dataRow["ProjectCode"].ToString() + "</td></tr>");
                  //  }                   
                }
                t.Append("</table>");
                lblMessage.Text = t.ToString();               
            } 

        }
    }

    protected void btnGenerate_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            DataGrabber dg = new DataGrabber();
            string fairID = Session["orgid"].ToString();  
                DataTable dt = dg.ExecuteSelectQuery("Select Country,ORGANIZATION,code_limit,code_created from AllScienceFairs where ID='" + fairID + "'");
                string country = dt.Rows[0]["Country"].ToString();
                string fair = dt.Rows[0]["ORGANIZATION"].ToString();
                int code_limit = Convert.ToInt32(dt.Rows[0]["code_limit"]);
                int code_created = Convert.ToInt32(dt.Rows[0]["code_created"]);
                code_limit = code_limit - code_created;

                string type = "Qualified";
            
                for (int i = 0; i < code_limit; ++i)
                {
                    CreateProject(country, fairID, fair, type);
                }
                          
                dt = dg.ExecuteSelectQuery("Select ProjectCode from Projects where RegionalID='" + fairID + "'");

                StringBuilder t = new StringBuilder("Following project codes created:<br/><br/><table class='Codegenereted'>");
                foreach (DataRow dataRow in dt.Rows)
                {
                    //for (int x = 0; x < dt.Columns.Count; x++)
                    //  {
                    t.Append("<tr><td>" + dataRow["ProjectCode"].ToString() + "</td></tr>");
                    //  }                   
                }
                t.Append("</table>");
                lblMessage.Text = t.ToString();

                dt = dg.ExecuteSelectQuery("Select Country,ORGANIZATION,code_limit,code_created from AllScienceFairs where ID='" + fairID + "'");
                Label4.Text = dt.Rows[0]["code_created"].ToString();

                btnGenerate.Visible = false;
           
        }
        else { return; }
    }

 

   

    public string q(string s)
    {
        return "'" + s + "'";
    }
    public const string c = ",";
    private string CreateProject(string country, string fairID, string fair, string type)
    {
        string code = assignCode(type);
        string query = "INSERT INTO projects(projectCode, country,RegionalParticipation,RegionalID,RegionalName,ApplicationType) VALUES";
        query += "(" + q(code) + c + q(country) + c + true + c + q(fairID) + c + q(fair) + c + q(type) + ")";
        OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;data source=" + Server.MapPath("~/app_data/isweeep.mdb"));
        OleDbCommand comm = new OleDbCommand(query, conn);
        conn.Open();
        int i = comm.ExecuteNonQuery();
        conn.Close();
        if (i > 0) return code;
        else return "DB-Error";
    }
    private string assignCode(string type)
    {
        string code = type.Substring(0, 1).ToUpper();

        Random r = new Random();
        //int n1 = r.Next(65, 90);//buyuk harf
        int n2 = r.Next(97, 122);//kucuk harf
        int n3 = r.Next(48, 57);//rakam
        int n4 = r.Next(97, 122);
        int n5 = r.Next(97, 122);
        int n6 = r.Next(97, 122);
        int n7 = r.Next(48, 57);
        code += new string(new char[] { (char)n2, (char)n3, (char)n4, (char)n5, (char)n6, (char)n7 });

        return code;
        //throw new NotImplementedException();
    }
}