using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Text;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.xml;
using System.IO;
using System.Data;

public partial class Certificate_JudgeCertificates : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {        

            DataGrabber dg = new DataGrabber();         
            string email = dg.getValue(txtEmail);
            string query = "select JudgeId, JudgeName +' '+JudgeLastName AS Name from [judges] where JEmail='" + email + "' and Checkin =" + true;
            DataTable dt = dg.ExecuteSelectQuery(query);

            if (dt.Rows.Count < 1)
            {
                Label1.Text = "No records found !";
                return;
            }

            try
            {
                string name = dt.Rows[0]["Name"].ToString().ToUpper();
                int JudgeId = Convert.ToInt32(dt.Rows[0]["JudgeId"]);
                FillForm(JudgeId, name);
                Label1.Text = name + "<br/><a href='./files/Judge_" + JudgeId + ".pdf' target='_blank'>DOWNLOAD CERTIFICATE</a>";  
            }
            catch (Exception ee)
            {
                Label1.Text = "Sorry, there is a Database error!...Please email to technical support." + ee.Message;
                return;
            }





        }
    }


    private void FillForm(int id, string name)
    {
        
        string formFile = @"D:\Web\isweeep\Certificate\judge.pdf";
        string newFile = @"D:\Web\isweeep\Certificate\files\Judge_" + id + ".pdf";
        PdfReader reader = new PdfReader(formFile);

        using (PdfStamper stamper = new PdfStamper(reader, new FileStream(newFile, FileMode.Create)))
        {
            AcroFields fields = stamper.AcroFields;

            // set form fields
            fields.SetField("TextYear", "2016");
            fields.SetField("TextName", name);
            fields.SetField("TextDate", "April 26 - May 1, 2016");           

            // flatten form fields and close document
            stamper.FormFlattening = true;
            stamper.Close();
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            DataGrabber dg = new DataGrabber();
            string firstname = dg.getValue(txtFirstName);
            string lastname = dg.getValue(txtLastNAme);
            string query = "select JudgeId, JudgeName +' '+JudgeLastName AS Name from [judges] where JudgeName='" + firstname + "' AND JudgeLastName='" + lastname + "' AND Checkin =" + true;
            DataTable dt = dg.ExecuteSelectQuery(query);

            if (dt.Rows.Count < 1)
            {
                Label2.Text = "No records found !";
                return;
            }

            try
            {
                string name = dt.Rows[0]["Name"].ToString().ToUpper();
                int JudgeId = Convert.ToInt32(dt.Rows[0]["JudgeId"]);
                FillForm(JudgeId, name);
                Label2.Text = name + "<br/><a href='./files/Judge_" + JudgeId + ".pdf' target='_blank'>DOWNLOAD CERTIFICATE</a>";
            }
            catch (Exception ee)
            {
                Label2.Text = "Sorry, there is a Database error!...Please email to technical support." + ee.Message;
                return;
            }





        }

    }
}