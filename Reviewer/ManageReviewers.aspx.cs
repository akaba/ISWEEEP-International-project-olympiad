using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reviewer_ManageReviewers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            bool isadmin = bool.Parse(Session["isReviewAdmin"].ToString());
            if (!isadmin)
                Response.Redirect("Login.aspx");

        }
        catch (Exception err)
        { Response.Redirect("Login.aspx"); }
    }
    protected void ddCountries_DataBound(object sender, EventArgs e)
    {
        //DropDownList ddCountries = sender as DropDownList;
        //ddCountries.Items.Insert(0, new ListItem("Select one", null));
    }

    protected void renderCategory(object sender, EventArgs e)
    {
        DropDownList ddCategory = sender as DropDownList;
        if (ddCategory == null) return;

        for (int i = 1; i < ddCategory.Items.Count; i++)
        {
            ddCategory.Items[i].Value = ddCategory.Items[i].Text;
        }

    }
    protected void ddCategory_Init(object sender, EventArgs e)
    {
        DropDownList ddCategory = sender as DropDownList;
        if (ddCategory == null) return;

        for (int i = 1; i < ddCategory.Items.Count; i++)
        {
            ddCategory.Items[i].Value = ddCategory.Items[i].Text;
        }
    }
}