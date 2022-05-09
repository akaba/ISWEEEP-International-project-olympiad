#region imports

using System;
using System.Data;
using System.Drawing;
using System.Web.UI;

#endregion

public partial class FamilyInformation : Page
{
    private int cid;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            cid = Convert.ToInt32(Session["FinanceCid"].ToString());
        }
        catch (NullReferenceException)
        {
            Response.Redirect("financialapplication.aspx?msj=1");
            return;
        }

        if (!IsPostBack)
        {
            Fill();
        }
    }

    private void Fill()
    {
        DataGrabber dg = new DataGrabber();
        DataTable dt = dg.DB2Table(AccessDataSource1);
        if (dg.DB2Table(AccessDataSource1).Rows.Count == 1)
        {
            txtFatherName.Text = dt.Rows[0]["fathername"].ToString();
            txtFO.Text = dt.Rows[0]["fatheroccupation"].ToString();
            txtMotherName.Text = dt.Rows[0]["mothername"].ToString();
            txtMO.Text = dt.Rows[0]["motheroccupation"].ToString();
            txtIncome.Text = dt.Rows[0]["income"].ToString();
            txtExpected.Text = dt.Rows[0]["ExpectedTravelExpense"].ToString();
            txtSponsored.Text = dt.Rows[0]["SponsoredAmount"].ToString();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DataGrabber dg = new DataGrabber();

        string fathername = dg.getValue(txtFatherName);
        string fatherOcc = dg.getValue(txtFO);
        string mothername = dg.getValue(txtMotherName);
        string motherOcc = dg.getValue(txtMO);
        string income = dg.getValue(txtIncome);
        string expedtedExpense = dg.getValue(txtExpected);
        string sponsoredAmount = dg.getValue(txtSponsored);

        AccessDataSource1.SelectCommand = "select contestantid from familyinfo where contestantid=" + cid;
        DataTable dt = dg.DB2Table(AccessDataSource1);
        if (dt.Rows.Count > 0)
        {
            string cmd = "update familyinfo ";
            cmd += "set fathername= '" + fathername + "',";
            cmd += " fatheroccupation= '" + fatherOcc + "',";
            cmd += " mothername= '" + mothername + "', ";
            cmd += " motheroccupation= '" + motherOcc + "', ";
            cmd += " income= '" + income + "', ";
            cmd += " ExpectedTravelExpense= '" + expedtedExpense + "', ";
            cmd += " SponsoredAmount= '" + sponsoredAmount + "' ";
            cmd += "where contestantid  = " + cid;

            try
            {
                AccessDataSource1.UpdateCommand = cmd;
                AccessDataSource1.Update();
            }
            catch (Exception evv)
            {
                lblMessage.Text = "Did you already enter your family information? Contact us to resolve the issue with the following information:" +
                                  evv.Message;
                return;
            }
        }
        else
        {
            string cmd =
                "insert into familyinfo(contestantid,fathername,fatheroccupation,mothername,motheroccupation,income,ExpectedTravelExpense,SponsoredAmount) values( ";
            cmd += cid + ", '" + fathername + "', '";
            cmd += fatherOcc + "', '";
            cmd += mothername + "', '";
            cmd += motherOcc + "', '";
            cmd += income + "', '";
            cmd += expedtedExpense + "', '";
            cmd += sponsoredAmount + "' )";

            try
            {
                AccessDataSource1.InsertCommand = cmd;
                AccessDataSource1.Insert();
            }
            catch (Exception evv)
            {
                lblMessage.Text = "Did you already enter your family information? Contact us to resolve the issue " +
                                  evv.Message;
                return;
            }
        }
        lblMessage.ForeColor = Color.Blue;
        lblMessage.Text =
            "Family information was saved. You can proceed to <a href='pastprojects.aspx'>Science fair history</a> page";
        //Response.Redirect("Finance_Awards.aspx");
    }
}