#region imports

using System;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

#endregion

public partial class Admin_Query : Page
{
    public static int counter;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            // Label1.Text = Label1.Text = DropDownList1.SelectedValue.ToString();
            String str = "";
            GridView1.Columns.Clear();
            try
            {
                DataGrabber dg = new DataGrabber();
                if (DropDownList1.SelectedIndex < 0)
                    return;
                int queryID = Convert.ToInt32(DropDownList1.SelectedValue);
                string query = dg.ExecuteScalarQuery("select [query] from [query] where id = " + queryID).ToString();
                DataTable dt = dg.ExecuteSelectQuery(query);

                GridView1.AutoGenerateColumns = false;


                if (dt.Rows.Count < 0) return;

                foreach (DataColumn dc in dt.Columns)
                {
                    BoundField bf = new BoundField();
                    bf.DataField = dc.ColumnName;
                    bf.HeaderText = dc.ColumnName;
                    bf.SortExpression = dc.ColumnName;
                    GridView1.Columns.Add(bf);
                }


                GridView1.DataSource = dt;
                records.Text = dt.Rows.Count + " records";
                GridView1.DataBind();


            }
            catch (Exception exc)
            {
                records.Text = "Database error...please report to IT manager:  " + exc.Message;
            }
            finally
            {
                //Button2.Text = str;
            }
        }
        else
        {
            //first time code
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Clear();

        Response.AddHeader("content-disposition",
                           "attachment;        filename=" + DropDownList1.SelectedItem.Text + ".xls");

        Response.Charset = "";

        // If you want the option to open the Excel file without saving than

        // comment out the line below

        // Response.Cache.SetCacheability(HttpCacheability.NoCache);

        Response.ContentType = "application/vnd.ms-excel";

        StringWriter stringWrite = new StringWriter();

        HtmlTextWriter htmlWrite =
            new HtmlTextWriter(stringWrite);

        GridView1.RenderControl(htmlWrite);

        Response.Write(stringWrite.ToString());

        Response.End();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        // Confirms that an HtmlForm control is rendered for the specified ASP.NET server control at run time.
    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dt = GridView1.DataSource as DataTable;
        DataView dv = dt.DefaultView;
        dv.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
        GridView1.DataSource = dv;
        GridView1.DataBind();


    }
    private string GetSortDirection(string column)
    {

        // By default, set the sort direction to ascending.
        string sortDirection = "ASC";

        // Retrieve the last column that was sorted.
        string sortExpression = ViewState["SortExpression"] as string;

        if (sortExpression != null)
        {
            // Check if the same column is being sorted.
            // Otherwise, the default value can be returned.
            if (sortExpression == column)
            {
                string lastDirection = ViewState["SortDirection"] as string;
                if ((lastDirection != null) && (lastDirection == "ASC"))
                {
                    sortDirection = "DESC";
                }
            }
        }

        // Save new values in ViewState.
        ViewState["SortDirection"] = sortDirection;
        ViewState["SortExpression"] = column;

        return sortDirection;
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {

        //GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
        //GridView1.FooterRow.TableSection = TableRowSection.TableFooter;

    }
}