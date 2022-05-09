#region imports

using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

#endregion

public partial class TravelDetails : Page
{
    private int asvid;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            asvid = Convert.ToInt32(Session["asvid"].ToString());
        }
        catch (NullReferenceException)
        {
            Response.Redirect("adultsvlogin.aspx?msj=1");
            return;
        }

        if (!IsPostBack)
        {
            populateTimeDropdowns();
            Fill();
            dateArrival.maxYear = dateArrival.minYear = Settings.CurrentYear;
            DateDeparture.maxYear = DateDeparture.minYear = Settings.CurrentYear;
        }
    }

    private void populateTimeDropdowns()
    {
        ddArrivalHour.Items.Add(new ListItem("Hr",""));
        ddArrivalMinute.Items.Add(new ListItem("Min", ""));
        ddDepartureHour.Items.Add(new ListItem("Hr", ""));
        ddDepartureMinute.Items.Add(new ListItem("Min", ""));
        for (int i = 0; i < 24; ++i)
        {
            String str =  (i < 10) ? "0" + i : i.ToString();
            ddArrivalHour.Items.Add(new ListItem((str))); 
            ddDepartureHour.Items.Add(new ListItem((str)));
        }
        for (int i = 0; i < 60; ++i)
        {
            String str = (i < 10) ? "0" + i : i.ToString();
            ddArrivalMinute.Items.Add(new ListItem((str)));
            ddDepartureMinute.Items.Add(new ListItem((str)));
        }
    }

    private void Fill()
    {
        DataGrabber dg = new DataGrabber();

        AccessDataSource1.SelectCommand = "select * from travelinfo where asvid=" + asvid;
        DataTable dt = dg.DB2Table(AccessDataSource1);

        if (dt.Rows.Count < 1)
        {
            return;
        }

        string trTypeArr = dt.Rows[0]["ArrivalType"].ToString();
        string trTypeDep = dt.Rows[0]["DepartureType"].ToString();
        
        string arrDate = dt.Rows[0]["arrivaldate"].ToString();
        string arrTime = dt.Rows[0]["arrivaltime"].ToString();
        string arrOrigin = dt.Rows[0]["arrivalorigin"].ToString();
        string arrDest = dt.Rows[0]["arrivaldestination"].ToString();
        string arrAirline = dt.Rows[0]["arrivalairline"].ToString();
        string arrFlightNo = dt.Rows[0]["arrivalFlightNo"].ToString();

        string deptDate = dt.Rows[0]["Departuredate"].ToString();
        string deptTime = dt.Rows[0]["Departuretime"].ToString();
        string deptOrigin = dt.Rows[0]["Departureorigin"].ToString();
        string deptAirline = dt.Rows[0]["Departureairline"].ToString();
        string deptFlightNo = dt.Rows[0]["DepartureFlightNo"].ToString();

        ddArrivalType.SelectedValue = trTypeArr;

        if (!string.IsNullOrEmpty(arrTime) && arrTime.IndexOf(':') > 0)
        {
            ddArrivalHour.SelectedValue = arrTime.Split(':')[0];
            ddArrivalMinute.SelectedValue = arrTime.Split(':')[1];
        }
        else
        {
            ddArrivalHour.SelectedIndex = 0;
            ddArrivalMinute.SelectedIndex = 0;
        }


        txtArrivalAirport.Text = arrOrigin;
        txtArrivalDestination.Text = arrDest;
        txtArrivalAirline.Text = arrAirline;
        txtArrivalFlight.Text = arrFlightNo;

        ddDepartureType.SelectedValue = trTypeDep;
        txtDeptAirline.Text = deptAirline;
        txtDeptAirport.Text = deptOrigin;
        txtDeptFlight.Text = deptFlightNo;

        if (!string.IsNullOrEmpty(deptTime) && deptTime.IndexOf(':') > 0)
        {
            ddDepartureHour.SelectedValue = deptTime.Split(':')[0];
            ddDepartureMinute.SelectedValue = deptTime.Split(':')[1];
        }
        else
        {
            ddDepartureHour.SelectedIndex = 0;
            ddDepartureMinute.SelectedIndex = 0;
        }


        try
        {
            DateTime arr_t = DateTime.Parse(arrDate);
            dateArrival.Date = arr_t;
        }
        catch (FormatException)
        {
			//lblMessage.Text = "Arrival time is incorrect";
            //dateArrival.Date = DateTime.Parse("2008/4/9");
        }
        try
        {
            DateTime dept_t = DateTime.Parse(deptDate);
            DateDeparture.Date = dept_t;
        }
        catch (FormatException)
        {
			//.Text = "Departure time is incorrect";
            //DateDeparture.Date = DateTime.Parse("2008/4/16");
        }

    }

    private void filltravelers()
    {
        DataGrabber dg = new DataGrabber();
        travelersData.DataBind();
        DataTable dt = dg.DB2Table(travelersData);

        if (dt.Rows.Count <= 0) return;

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string cid = dt.Rows[i]["contestantId"].ToString();
            if (dt.Rows[i]["iscomingwith"].ToString() == asvid.ToString() &&
                CheckBoxList1.Items.FindByValue(cid) != null)
                CheckBoxList1.Items.FindByValue(cid).Selected = true;
        }
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";

        if(dateArrival.Date == DateTime.MinValue)
        {
            lblMessage.Text += "Please specify your arrival time";
            return;
        }
        if (DateDeparture.Date == DateTime.MinValue)
        {
            lblMessage.Text += "Please specify your departure time";
            return;
        }
        if( (ddArrivalHour.SelectedIndex >0 && ddArrivalMinute.SelectedIndex ==0) || (ddArrivalHour.SelectedIndex ==0 && ddArrivalMinute.SelectedIndex > 0))
        {
            lblMessage.Text += "Please specify both hour and minute information for arrival time";
            return;
        }
        if ((ddDepartureHour.SelectedIndex > 0 && ddDepartureMinute.SelectedIndex == 0) || (ddDepartureHour.SelectedIndex == 0 && ddDepartureMinute.SelectedIndex > 0))
        {
            lblMessage.Text += "Please specify both hour and minute information for departure time";
            return;
        }

        DataGrabber dg = new DataGrabber();

        string trTypeArr = ddArrivalType.SelectedValue;
        string trTypeDep = ddDepartureType.SelectedValue;
        

        string arrDate = dateArrival.Date.Year + "/" + dateArrival.Date.Month + "/" + dateArrival.Date.Day;
        string arrTime = dg.getValue(ddArrivalHour) + ":" + dg.getValue(ddArrivalMinute);
        string arrAirport = dg.getValue(txtArrivalAirport);
        string arrDestination = dg.getValue(txtArrivalDestination);
        string arrFlightNo = dg.getValue(txtArrivalFlight);
        string arrAirline = dg.getValue(txtArrivalAirline);

        string deptDate = DateDeparture.Date.Year + "/" + DateDeparture.Date.Month + "/" + DateDeparture.Date.Day;
        string deptTime = dg.getValue(ddDepartureHour) + ":" + dg.getValue(ddDepartureMinute);
        string deptAirport = dg.getValue(txtDeptAirport);
        string deptFlightNo = dg.getValue(txtDeptFlight);
        string deptAirline = dg.getValue(txtDeptAirline);

        AccessDataSource1.SelectCommand = "select * from travelinfo where asvid =" + asvid;
        DataTable dt = dg.DB2Table(AccessDataSource1);
        if (dt.Rows.Count == 0)
        {
            string insertQuery =
                "insert into travelinfo(arrivalType,arrivaldate,arrivaltime,arrivalorigin,arrivaldestination,arrivalairline,arrivalFlightNo,";
            insertQuery +=
                "departureType,Departuredate,Departuretime,Departureorigin,Departureairline,DepartureFlightNo,asvid) values(";
            insertQuery += "'" + trTypeArr + "', ";
            insertQuery += "'" + arrDate + "', ";
            insertQuery += "'" + arrTime + "', ";
            insertQuery += "'" + arrAirport + "', ";
            insertQuery += "'" + arrDestination + "', ";
            insertQuery += "'" + arrAirline + "', ";
            insertQuery += "'" + arrFlightNo + "',";

            insertQuery += "'" + trTypeDep + "',";
            insertQuery += "'" + deptDate + "',";
            insertQuery += "'" + deptTime + "',";
            insertQuery += "'" + deptAirport + "',";
            insertQuery += "'" + deptAirline + "',";
            insertQuery += "'" + deptFlightNo + "',";

            insertQuery += asvid + ")";

            try
            {
                AccessDataSource1.InsertCommand = insertQuery;
                AccessDataSource1.Insert();
            }
            catch (DataException)
            {
                lblMessage.Text = "Information could not be saved!" ;
                return;
            }
        }
        else
        {
            string cmd = "update travelinfo set ";
            
            cmd += " arrivaltype = '" + trTypeArr + "', ";
            cmd += " arrivaldate = '" + arrDate + "', ";
            cmd += " arrivaltime = '" + arrTime + "', ";
            cmd += " arrivalorigin = '" + arrAirport + "', ";
            cmd += " arrivaldestination = '" + arrDestination + "', ";
            cmd += " arrivalflightno = '" + arrFlightNo + "', ";
            cmd += " arrivalairline = '" + arrAirline + "', ";

            cmd += " departuretype = '" + trTypeDep + "', ";
            cmd += " Departuredate = '" + deptDate + "', ";
            cmd += " Departuretime = '" + deptTime + "', ";
            cmd += " Departureorigin = '" + deptAirport + "', ";
            cmd += " Departureflightno = '" + deptFlightNo + "', ";
            cmd += " departureairline = '" + deptAirline + "' ";

            cmd += " where asvid = " + asvid;

            try
            {
                AccessDataSource1.UpdateCommand = cmd;
                AccessDataSource1.Update();
            }
            catch (DataException)
            {
                lblMessage.Text = "Information could not be saved!" ;
                return;
            }
        }
        writeComingContestants();
        lblMessage.ForeColor = Color.Blue;
        lblMessage.Text = "Travel information saved successfully.";
    }

    private void writeComingContestants()
    {
        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            if (CheckBoxList1.Items[i].Selected)
            {
                updateContestant(CheckBoxList1.Items[i].Value, true);
            }
            else
            {
                updateContestant(CheckBoxList1.Items[i].Value, false);
            }
        }

    }

    private void updateContestant(string cid, bool doesCome)
    {
        int s = 0;
        if (doesCome) s = asvid;

        string updateCmd = "update contestants set iscomingwith=" + s + " where contestantid= " + Convert.ToInt32(cid);

        travelersData.UpdateCommand = updateCmd;
        try
        {
            travelersData.Update();
        }
        catch (DataException)
        {
            lblMessage.Text = "Error updating contestant information" ;
            return;
        }
    }

    protected void CheckBoxList1_DataBound(object sender, EventArgs e)
    {
        filltravelers();
    }
}