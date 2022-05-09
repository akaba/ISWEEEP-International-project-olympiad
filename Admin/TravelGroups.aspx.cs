using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class Admin_TravelGroups : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PutTravelInfo();
    }

    private void PutTravelInfo()
    {
        if (DropDownList1.SelectedIndex < 1)
            return;
        if (DropDownList1.SelectedIndex > 1)
        {
            Filter();
            return;
        }
        DataGrabber dg = new DataGrabber();

        DataTable dtASV = dg.ExecuteSelectQuery("Select asvid, asvname+' '+asvlastname as ASV from adultsupervisors where asvid in (select asvid from projects where status='Qualified')");

        StringBuilder sb = new StringBuilder("");

        for (int i = 0; i < dtASV.Rows.Count; i++)
        {
            int asvid = Convert.ToInt32(dtASV.Rows[i]["asvid"].ToString());
            sb.Append("<hr><br><b style='color:blue'>Adult SV:</b>" + dtASV.Rows[i]["asv"].ToString() + "  [ <a target=_blank href=travelinfo.aspx?asvid=" + asvid + ">Travel Details</a> ]<br>");
            DataTable dtContestants = dg.ExecuteSelectQuery(@"Select contestantid, pid, gender, firstname+' '+lastname as Name from contestants where iscomingwith= " + asvid + " order by gender, pid");

            sb.Append("<br><span style='color:maroon'>Contestants:</span><br>");
            for (int j = 0; j < dtContestants.Rows.Count; j++)
            {
                sb.Append("&nbsp;&nbsp;" + (j + 1) + ".&nbsp;<a style='color:black;text-decoration:none' target=_blank href=contestantdetails.aspx?cid=" + dtContestants.Rows[j]["contestantid"].ToString() + ">" +
                   dtContestants.Rows[j]["Name"].ToString() + "</a> - ");

                sb.Append(dtContestants.Rows[j]["gender"].ToString() + " - ");
                sb.Append("<a style='color:black;text-decoration:none' target=_blank href=projectinformation.aspx?id=" + dtContestants.Rows[j]["pid"].ToString() + ">");
                sb.Append(dtContestants.Rows[j]["pid"].ToString() + "</a>");
                sb.Append("<br>");  
            }

            DataTable dtGuests = dg.ExecuteSelectQuery(@"Select id, gender, firstname+' '+lastname as Name from Guests where asvid= " + asvid + " order by gender");

            if (dtGuests.Rows.Count > 0)
                sb.Append("<br><span style='color:maroon'>Guests:</span><br>");
            
            for (int j = 0; j < dtGuests.Rows.Count; j++)
            {
                sb.Append("&nbsp;&nbsp;" + (j+1) + ".&nbsp;" + dtGuests.Rows[j]["Name"].ToString() + "-" + dtGuests.Rows[j]["gender"].ToString() + "<br>" );
            }
        }

        Label1.Text = sb.ToString();

    }

    private void Filter()
    {
        DataGrabber dg = new DataGrabber();
        int asvid = Convert.ToInt32(DropDownList1.SelectedValue);
        
        DataTable dtASV = dg.ExecuteSelectQuery("Select asvid, asvname+' '+asvlastname as ASV from adultsupervisors where asvid=" + asvid);

        StringBuilder sb = new StringBuilder("");
        sb.Append("<hr><br><b style='color:blue'>Adult SV:</b>" + dtASV.Rows[0]["asv"].ToString() + "  [ <a target=_blank  href=travelinfo.aspx?asvid=" + asvid + ">Travel Details</a> ]<br>");
            
        DataTable dtContestants = dg.ExecuteSelectQuery(@"Select contestantid, pid, gender, firstname+' '+lastname as Name from contestants where iscomingwith= " + asvid + " order by gender,pid");

        sb.Append("<br><span style='color:maroon'>Contestants:</span><br>");
        for (int j = 0; j < dtContestants.Rows.Count; j++)
        {
            sb.Append("&nbsp;&nbsp;" + (j + 1) + ".&nbsp;<a style='color:black;text-decoration:none' target=_blank href=contestantdetails.aspx?cid=" + dtContestants.Rows[j]["contestantid"].ToString() + ">" +
                   dtContestants.Rows[j]["Name"].ToString() + "</a> - ");

            sb.Append(dtContestants.Rows[j]["gender"].ToString() + " - ");
            sb.Append("<a style='color:black;text-decoration:none' target=_blank href=projectinformation.aspx?id=" + dtContestants.Rows[j]["pid"].ToString() + ">");
            sb.Append(dtContestants.Rows[j]["pid"].ToString() + "</a>");
            sb.Append("<br>");   
        }

        DataTable dtGuests = dg.ExecuteSelectQuery(@"Select id, gender, firstname+' '+lastname as Name from Guests where asvid= " + asvid + " order by gender");

        if (dtGuests.Rows.Count > 0)
            sb.Append("<br><span style='color:maroon'>Guests:</span><br>");

        for (int j = 0; j < dtGuests.Rows.Count; j++)
        {
            sb.Append("&nbsp;&nbsp;" + (j + 1) + ".&nbsp;" + dtGuests.Rows[j]["Name"].ToString() + "-" + dtGuests.Rows[j]["gender"].ToString() + "<br>");
        }
        Label1.Text = sb.ToString();
    }
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        DropDownList1.Items.Insert(0, new ListItem("All"));
        DropDownList1.Items.Insert(0, new ListItem("Select One"));
    }
}
