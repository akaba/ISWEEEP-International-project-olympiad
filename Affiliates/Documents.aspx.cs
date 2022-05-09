using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Affiliates_Documents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["orguname"] == null || Session["orguname"].ToString().Length < 4)
        {
            Response.Redirect("Logon.aspx?msj=1");
        }

    }

    protected string GetLink(object doc, object file)
    {
        if (string.IsNullOrEmpty(file.ToString()))
        {
            return doc.ToString();
        }
        else return "<a style='color:blue' href='../AffiliateFroms/" + file.ToString() + "' target='_blank'>" + doc + "</a>";
    }
}