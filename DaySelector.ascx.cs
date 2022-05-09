#region imports

using System;
using System.Web.UI;
using System.Web.UI.WebControls;

#endregion

public partial class DaySelector : UserControl
{
    public int m_maxYear = 2012;
    public int m_minYear = 1910;
    public DateTime t;

    public int minYear
    {
        get { return m_minYear; }
        set { m_minYear = value; }
    }

    public int maxYear
    {
        get { return m_maxYear; }
        set { m_maxYear = value; }
    }


    public DateTime Date
    {
        get
        {
            try
            {
                t = DateTime.Parse(ddYear.SelectedValue + "/" + ddMonth.SelectedValue + "/" + ddDay.SelectedValue);
            }
            catch (Exception)
            {
                return DateTime.MinValue;
            }
            return t;
        }
        set
        {
            try
            {
                t = value;
            }
            catch(Exception)
            {
                t = DateTime.MinValue;
            }
            
            ddDay.SelectedValue = t.Day.ToString();
            ddMonth.SelectedValue = t.Month.ToString();
            ddYear.SelectedValue = t.Year.ToString();
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;

        ddDay.Items.Add(new ListItem("Day", "0"));
        for (int i = 1; i <= 31; ++i)
            ddDay.Items.Add(new ListItem(i + "", i + ""));

        ddMonth.Items.Add(new ListItem("Month", "0"));
        for (int i = 1; i <= 12; ++i)
            ddMonth.Items.Add(new ListItem(GetMonthName(i,false) + "", i + ""));

        ddYear.Items.Add(new ListItem("Year", "0"));
        for (int i = m_maxYear; i >= m_minYear; --i)
            ddYear.Items.Add(new ListItem(i + "", i + ""));

        if (t != DateTime.MinValue)
        {
            ddDay.SelectedValue = t.Day.ToString();
            ddMonth.SelectedValue = t.Month.ToString();
            ddYear.SelectedValue = t.Year.ToString();
        }
    }
    private static string GetMonthName(int month, bool abbrev)  
    {  
        DateTime date = new DateTime(1900, month, 1);  
        if (abbrev) 
            return date.ToString("MMM");  
        return date.ToString("MMMM");  
    }
}