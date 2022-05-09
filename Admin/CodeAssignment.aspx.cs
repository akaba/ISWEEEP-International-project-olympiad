using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_CodeAssignment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnGenerate_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            DataGrabber dg = new DataGrabber();
            string country = dg.getValue(ddCountries);
            string fairID = dg.getValue(ddScFairs);
            lblMessage.Text = fairID;
            DataTable dt = dg.ExecuteSelectQuery("Select ORGANIZATION from AllScienceFairs where ID='" + fairID + "'");
            string fair = dt.Rows[0]["ORGANIZATION"].ToString();
            //iptal string type = dg.getValue(ddType);
            string type = "Qualified";
            int num = int.Parse(txtNum.Text);

            string codes = "";
            for (int i = 0; i < num; ++i)
            {
                codes += "<br>" + CreateProject(country, fairID, fair, type);
            }

            lblMessage.Text = "Following project codes created: " + codes;
            btnGenerate.Visible = false;
        }
        else
        { return; }
    }
    public string q(string s)
    {
        return "'"+s+"'";
    }
    public const string c= ",";
    private string CreateProject(string country, string fairID, string fair, string type)
    {
        string code=assignCode(type);
        string query = "INSERT INTO projects(projectCode, country,RegionalParticipation,RegionalID,RegionalName,ApplicationType) VALUES";
        query += "(" + q(code)+ c + q(country)+c+true+c+q(fairID)+c+q(fair)+c+q(type) +")";
        OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;data source=" + Server.MapPath("~/app_data/isweeep.mdb"));
        OleDbCommand comm = new OleDbCommand(query, conn);
        conn.Open();
        int i= comm.ExecuteNonQuery();
        conn.Close();
        if (i > 0) return code;
        else return "DB-Error";
    }
    private string assignCode(string type)
    {
        string code = type.Substring(0,1).ToUpper();

        Random r = new Random();
        //int n1 = r.Next(65, 90);//buyuk harf
        int n2 = r.Next(97, 122);//kucuk harf
        int n3 = r.Next(48, 57);//rakam
        int n4 = r.Next(97, 122);
        int n5 = r.Next(97, 122);
        int n6 = r.Next(97, 122);
        int n7 = r.Next(48, 57);

        code += new string(new char[] {  (char)n2, (char)n3, (char)n4, (char)n5, (char)n6, (char)n7 });


        return code;
        //throw new NotImplementedException();
    }
    protected void ddCountries_DataBound(object sender, EventArgs e)
    {
        ddCountries.Items.FindByText("UNITED STATES").Selected = true;
    }
}
