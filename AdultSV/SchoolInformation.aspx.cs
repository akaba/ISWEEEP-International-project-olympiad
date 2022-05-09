#region imports

using System;
using System.Data;
using System.Drawing;
using System.Web.UI;

#endregion

public partial class SchoolInformation : Page
{
    private int asvid;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            asvid = Convert.ToInt32(Session["asvid"].ToString());
        }
        catch (Exception ee)
        {
            //lblMessage.Text = "Session timed out. Please <a href='login.aspx?msj=1'>login</a>  to continue";
            Response.Redirect("adultsvlogin.aspx?msj=1");
            return;
        }
        if (!IsPostBack)
            Fill();
    }

    private void Fill()
    {
        DataGrabber dg = new DataGrabber();

        AccessDataSource1.SelectCommand = "select * from schools where asvid=" + asvid;
        DataTable dt = dg.DB2Table(AccessDataSource1);

        if (dt.Rows.Count < 1)
        {
            lblMessage.Text = "School/organization information was not entered yet...";
            return;
        }

        string sname = dt.Rows[0]["schoolname"].ToString();
        string shead = dt.Rows[0]["schoolhead"].ToString();
        string saddress = dt.Rows[0]["schooladdress"].ToString();
        string sphone = dt.Rows[0]["schoolphone"].ToString();
        string sweb = dt.Rows[0]["schoolweb"].ToString();
        string sfax = dt.Rows[0]["schoolfax"].ToString();


        string addr = saddress;
        if (addr != "")
        {
            string[] adresler = addr.Split(';');
            txtStreet.Text = adresler[0];
            if (adresler.Length == 5)
            {
                txtCity.Text = adresler[1].Trim();
                txtState.Text = adresler[2].Trim();
                txtZip.Text = adresler[3].Trim();
                ddCountry.SelectedValue = adresler[4].Trim();
            }
        }
        txtSchool.Text = sname;
        txtHead.Text = shead;
        txtPhone.Text = sphone;
        txtWeb.Text = sweb;
        txtFax.Text = sfax;


        //throw new NotImplementedException();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {       
            lblMessage.Text = "";




        DataGrabber dg = new DataGrabber();
        string sname = dg.getValue(txtSchool);
        string shead = dg.getValue(txtHead);
        string saddress = dg.getValue(txtStreet) + ";" + dg.getValue(txtCity) + ";" + dg.getValue(txtState) + ";" +
                          dg.getValue(txtZip) + ";" + dg.getValue(ddCountry);
        string sphone = dg.getValue(txtPhone);
        string sweb = dg.getValue(txtWeb);
        string sfax = dg.getValue(txtFax);

        string sid = "";

        AccessDataSource1.SelectCommand = "select * from schools where asvid =" + asvid;

        DataTable dt = dg.DB2Table(AccessDataSource1);

        if (dt.Rows.Count == 0)
        {
            string insertQuery =
                "insert into schools(schoolname,schoolhead,schooladdress,schoolphone,schoolfax,schoolweb,asvid) values(";
            insertQuery += "'" + sname + "', ";
            insertQuery += "'" + shead + "', ";
            insertQuery += "'" + saddress + "', ";
            insertQuery += "'" + sphone + "', ";
            insertQuery += "'" + sfax + "', ";
            insertQuery += "'" + sweb + "', ";
            insertQuery += "" + asvid + ")";

            try
            {
                AccessDataSource1.InsertCommand = insertQuery;
                AccessDataSource1.Insert();
            }
            catch (Exception ett)
            {
                lblMessage.Text = "Information could not be saved!" + ett.Message;
                return;
            }
        }
        else
        {
            string cmd = "update schools set ";
            cmd += " schoolname = '" + sname + "', ";
            cmd += " schoolhead = '" + shead + "', ";
            cmd += " schooladdress = '" + saddress + "', ";
            cmd += " schoolphone = '" + sphone + "', ";
            cmd += " schoolfax = '" + sfax + "', ";
            cmd += " schoolweb = '" + sweb + "' ";
            cmd += " where asvid = " + asvid;

            try
            {
                AccessDataSource1.UpdateCommand = cmd;
                AccessDataSource1.Update();
            }
            catch (Exception ett)
            {
                lblMessage.Text = "Information could not be saved!" + ett.Message;
                return;
            }
        }

        lblMessage.ForeColor = Color.Blue;
        lblMessage.Text = "<h3><img src='../images/ok.png'>Information saved successfully.</h3>";

        } else
        {
            return; 
        }
    }
}