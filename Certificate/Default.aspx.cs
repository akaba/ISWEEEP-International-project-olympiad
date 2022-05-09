using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.xml;
using System.IO; 

public partial class Certificate_Default : System.Web.UI.Page
{
    string mypid;  

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null && Session["pid"] == null)
        {
            Label1.Text = "<h1>You need to login to continue</h1>";
            return;
        }      


        if (!IsPostBack)
        {
            //admin login
            if (Request.QueryString["id"] != null)
            {
                mypid = Request.QueryString["id"].ToString();
            }
            else
            {
                //student login
                if (Session["pid"] != null)
                {
                    mypid = Session["pid"].ToString();
                }
            }
        }


        string link = "";

        try
        {
            DataGrabber dg = new DataGrabber();
            string query = "Select Name from [QualifiedContestants] where pid = " + mypid; 
            DataTable dt = dg.ExecuteSelectQuery(query);
            if (dt.Rows.Count < 0)
            {
                Label1.Text = "";
                return;
            }
            int count = 0;
            link = "<h3>CERTIFICATE OF PARTICIPATION: </h3>";
            foreach (DataRow row in dt.Rows)
            {
                count = count + 1;
                string name = row["Name"].ToString().ToUpper(); 
                FillForm("participation",mypid, count, name);
                link = link + count + ". " + "<a href='./files/" + mypid + "_" + count + ".pdf' target='_blank'>" + name + "</a>&nbsp;   (Contestant)<br/>";
            }
            Label1.Text = link;
            
            string query1 = "Select DISTINCT Name from [QualifiedProjectSupervisors] where pid = " + mypid; 
            DataTable dt1 = dg.ExecuteSelectQuery(query1);
            if (dt1.Rows.Count < 0) return;            
            foreach (DataRow row in dt1.Rows)
            {
                count = count + 1;
                string name = row["Name"].ToString().ToUpper();
                FillForm("participation", mypid, count, name);
                link = link + count + ". " + "<a href='./files/" + mypid + "_" + count + ".pdf' target='_blank'>" + name + "</a>&nbsp;(Project Supervisor)<br/>";
            }
            Label1.Text = link;

            string query2 = "Select DISTINCT Name from [QualifiedAdultSupervisors] where pid = " + mypid;
            DataTable dt2 = dg.ExecuteSelectQuery(query2);
            if (dt1.Rows.Count < 0) return;
            foreach (DataRow row in dt2.Rows)
            {
                count = count + 1;
                string name = row["Name"].ToString().ToUpper();
                FillForm("participation", mypid, count, name);
                link = link + count + ". " + "<a href='./files/" + mypid + "_" + count + ".pdf' target='_blank'>" + name + "</a>&nbsp;(Adult Supervisor)<br/>";
            }

            Label1.Text = link;

        }
        catch (Exception exc)
        {
            Label1.Text = "Database error...please report to IT manager: " + exc.Message;
        }




        // print awards
        try
        {
            DataGrabber dg = new DataGrabber();
            string query = "Select * from [AWARDS] where pid = " + mypid;
            DataTable dt = dg.ExecuteSelectQuery(query);
            if (dt.Rows.Count < 0)
            {
               return;
            }
            int count = 0;
            link += "<h3>AWARD CERTIFICATES:</h3>";
            foreach (DataRow row in dt.Rows)
            {
                count = count + 1;
                string name = row["Name"].ToString().ToUpper();
                string type = row["Certificate"].ToString();
                int ContestantID = Convert.ToInt32(row["ContestantID"]);
                FillForm(type, mypid, ContestantID, name);
                link += count + ". " + "<a href='./files/" + mypid + "_" + ContestantID + ".pdf' target='_blank'>" + name + "</a>&nbsp;   (" + type + ")<br/>";
            }

            Label1.Text = link;
          
        }
        catch (Exception exc)
        {
            Label1.Text = "Database error...please report to IT manager: " + exc.Message;
        }

        
        
       
    }
   



    private void FillForm(string type,string id,int count,string name)
    {
        type = type.ToLower();        
        string formFile = @"D:\Web\isweeep\Certificate\"+ type +".pdf";
        string newFile = @"D:\Web\isweeep\Certificate\files\" + id + "_" + count + ".pdf";
		PdfReader reader = new PdfReader(formFile);
		   
		using (PdfStamper stamper = new PdfStamper(reader, new FileStream(newFile, FileMode.Create)))
		{
			AcroFields fields = stamper.AcroFields;
  
           // set form fields
		   fields.SetField("TextYear", "2016"); 
		   fields.SetField("TextName", name);		   
		   fields.SetField("TextDate", "April 26 - May 1, 2016"); 
			  
		  // Label1.Text = fields.GetField("TextName") + " created successfully.";

		   // flatten form fields and close document
		   stamper.FormFlattening = true;
		   stamper.Close();
		}
    }
}