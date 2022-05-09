using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_PrintAbstracts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["admin"] == null || Session["admin"].ToString().Length < 5))
        {
            Response.Redirect("logon.aspx?msj=1");
        }
    }
    public string getPlace(object country, object state)
    {
        if (country.ToString().ToLower() == "united states" && !string.IsNullOrEmpty(state.ToString()))
            return country.ToString() + "-" + state.ToString();
        else return country.ToString();
    }


    public string getContestants(object c1, object c2, object c3)
    {
        if(string.IsNullOrEmpty(c2.ToString()))
            return c1.ToString();
        if(string.IsNullOrEmpty(c3.ToString()))
            return c1.ToString() + ", " + c2.ToString();
        return c1.ToString() + ", " + c2.ToString() + ", " + c3.ToString();
    }
}