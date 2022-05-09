#region imports

using System;
using System.Web.UI;
using System.Data;

#endregion

public partial class adultSV : MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int asvid;
        try
        {
            asvid = Convert.ToInt32(Session["asvid"].ToString());
            if (!IsPostBack)
                Labelname.Text = "&nbsp;&nbsp;" + Session["asvname"].ToString();
        }
        catch (NullReferenceException)
        {
            Response.Redirect("adultsvlogin.aspx?msj=1");
            return;
        }

        //

        DataGrabber dg = new DataGrabber();

        AccessDataSource1.SelectCommand = "select * from ContestantsForAdultSVs where asvid=" + asvid;
        DataTable dt = dg.DB2Table(AccessDataSource1);

        
        //loop all contestants visa status
        if (dt.Rows.Count > 0)
        {

            bool visa = false;    
            for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (((dt.Rows[i]["VisaRequired"].ToString()).Equals("true", StringComparison.OrdinalIgnoreCase)))
                        visa=true;
                  }
            if(visa)  
            {
                 HyperLink1.Visible = true;
            }
              else
            { 
                HyperLink1.Visible = false;
            }
         
        }

       

    }







}