#region imports

using System;
using System.Web.UI;
using System.Data;

#endregion

public partial class AdultSV_SubmitAll : Page
{
    private int asvid;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            asvid = Convert.ToInt32(Session["asvid"].ToString());

            DataGrabber dg = new DataGrabber();
            string msj = "";
            DataTable dt = dg.ExecuteSelectQuery(@"select * from Schools WHERE asvid=" + asvid, Server.MapPath("~/app_data/isweeep.mdb"));
            if (dt.Rows.Count < 1)
            {
                Button1.Visible = false;
                msj += "<h4>You need to enter -School/Organization information.</h4>";
                //return;
            }


            dt = dg.ExecuteSelectQuery(@"select * from adultsupervisors WHERE VisaRequired=TRUE AND asvid=" + asvid, Server.MapPath("~/app_data/isweeep.mdb"));

            if (dt.Rows.Count == 1)
            {
                dt = dg.ExecuteSelectQuery(@"select * from Embassy WHERE asvid=" + asvid, Server.MapPath("~/app_data/isweeep.mdb"));
                if (dt.Rows.Count < 1)
                {
                    Button1.Visible = false;
                    msj += "<h4>You need to enter-Embassy information.</h4>";
                    //return;
                }

            }
            else
            { DetailsView2.Visible =false; }

           
          

            lblMessage.Text = msj;

                   // DataGrabber dg = new DataGrabber();
                    //adultSVdata.SelectCommand = "select * from adultsupervisors where asvid = " + asvid;
                  //  DataTable dt = dg.DB2Table(adultSVdata);                
                  //  if (((dt.Rows[0]["submitted"].ToString()).Equals("true", StringComparison.OrdinalIgnoreCase)))
                  //  {
                  //      Button1.Visible = false;
                 //       lblMessage.Text = "<h2>Your information has been submitted.</h2>";
                  //  }
                   // else { Button1.Visible = true; }

        }
        catch (NullReferenceException)
        {
            Response.Redirect("adultsvlogin.aspx?msj=1");
            return;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        EmailSender es = new EmailSender();

        string msj = "Adult supervisor information finalization by supervisor id:" + asvid;
            msj += "<br><a href='http://isweeep.org/isweeep/admin/travelinfo.aspx?asvid=" + asvid +"' >Details</a>";

        es.sendMail(msj, "Adult Supervisor info", "info@isweeep.org", "info@isweeep.org");

        lblMessage.Text = "<h2>Thank you for submitting your information.</h2>";

        setSubmitted();
    }

    private void setSubmitted()
    {
        adultSVdata.UpdateCommand = "update adultsupervisors set submitted = true where asvid = " + asvid;
        try
        {
            adultSVdata.Update();
            Button1.Visible = false;
        }
        catch (Exception ee)
        {
            lblMessage.Text = "Error saving information" + ee.Message;
            return;
        }
        //throw new NotImplementedException();
    }
    protected void comingContestants_Selected(object sender, System.Web.UI.WebControls.SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
             Button1.Visible = false;
             lblMessage.Text = "<h4>You need to specify the contestants coming with you on Travel Details page, before you finalize. <br/><a href='TravelDetails.aspx'>Click to select contestants.</a></h4>";
        }
    }
}