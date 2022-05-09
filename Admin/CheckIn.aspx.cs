#region imports

using System;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;
using System.Web.UI.WebControls;

#endregion

public partial class Admin_CheckIn : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // doIt();
    }

    private void doIt()
    {
        string name = txtContestant.Text.Trim();
        string title = "no title";

        // Label1.Text = Label1.Text = DropDownList1.SelectedValue.ToString();
        String str = "";
        GridView1.Columns.Clear();
        try
        {
            String query = "select * from contestants WHERE Firstname + ' ' + LastName  like '%" + name + "%'";
            OleDbConnection conn =
                new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;data source=" +
                                    Server.MapPath("~/app_data/isweeep.mdb"));
            OleDbCommand comm = new OleDbCommand(query, conn);
            conn.Open();
            DataSet ds = new DataSet();
            OleDbDataAdapter da = new OleDbDataAdapter(comm);
            da.Fill(ds);

            if (ds.Tables.Count > 0)
            {
                str += " -- Has Tables --" + ds.Tables[0].Columns.Count;
                foreach (DataColumn dc in ds.Tables[0].Columns)
                {
                    BoundField bf = new BoundField();
                    bf.DataField = dc.ColumnName;
                    bf.HeaderText = dc.ColumnName;
                    GridView1.Columns.Add(bf);
                }
            }

            GridView1.Columns[2].ItemStyle.Width = Unit.Pixel(200);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();

            conn.Close();
        }
        catch (Exception exc)
        {
        }
        finally
        {
            //Button2.Text = str;
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        // doIt();
        //Label1.Text = GridView1.Rows.Count.ToString();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        txtProject.Text = "";
    }
}