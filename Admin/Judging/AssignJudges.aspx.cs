#region imports

using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

#endregion

public partial class Admin_Judging_AssignJudges : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            label2.Text = "0";
        }
        Label1.Text = "";
        string x = ListBox1.ClientID;
        string cat = DropDownList2.SelectedValue;
        try
        {
            if (CheckBox1.Checked)
            {
                judges.SelectCommand =
                    "select [JudgeId], Name, [assignedTo], [Position], [Preference1], [Preference2], [Preference3], [JPhone], " +
                    "ProjectCount " +
                    "FROM [AvaliableJudges] where assignedTo='" + cat + "' order by name asc";
                GridView1.DataBind();
            }
            else
            {
                string cmd =
                    "SELECT [JudgeId], Name, [assignedTo] , [Position], [Preference1], [Preference2],[Preference3],[JPhone], " +
                    " ProjectCount " +
                    "FROM AvaliableJudges " +
                    "WHERE \"" + cat + "\" in([Preference1],[Preference2],[Preference3]) " +
                    "ORDER BY iif([Preference1]=\"" + cat + "\",'0',[Preference1]), iif([Preference2]=\"" + cat +
                    "\",'0',[Preference2])";

                judges.SelectCommand = cmd;
                GridView1.DataBind();
            }
        }
        catch (Exception)
        {
        }
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //System.Threading.Thread.Sleep(5000);
        int i;
        int last = -1;
        //ViewState.Add("top",wrapper1.Attributes["scrollTop"]);
        //int x = int.Parse();
        int count = 0;
        for (i = 0; i < ListBox1.Items.Count; i++)
        {
            if ((ListBox1.Items[i]).Selected)
            {
                count++; //Label1.Text += count;
                ListBox2.Items.Add(ListBox1.Items[i]);
                ListBox1.Items.RemoveAt(i);
                i--;
                last = i;
            }
        }

        ListBox1.SelectedIndex = last > -1 ? last : -1;
        ListBox2.SelectedIndex = -1;
        //wrapper1.Attributes["scrollTop"] = ViewState["top"].ToString();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < ListBox2.Items.Count; i++)
        {
            if ((ListBox2.Items[i]).Selected)
            {
                ListBox1.Items.Add(ListBox2.Items[i]);
                ListBox2.Items.RemoveAt(i);
                i--;
            }
        }
        ListBox1.SelectedIndex = -1;
        ListBox2.SelectedIndex = -1;
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        ListBox2.Items.Clear();
        ListBox1.DataBind();
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedIndex > 0)
        {
            ListBox1.DataBind();
            ListBox2.Items.Clear();
        }
    }

    protected void DropDownList2_DataBound(object sender, EventArgs e)
    {
        DropDownList2.Items.Insert(0, "Select a category");
    }

    protected void ListBox1_DataBound(object sender, EventArgs e)
    {
        ListBox1.Rows = ListBox1.Items.Count + 1;
    }


    private void JudgeAssignStart(int j)
    {
        Label1.Text = "";
        ArrayList p = new ArrayList();

        foreach (ListItem li in ListBox2.Items)
        {
            //if (li.Selected == true)
            p.Add(int.Parse(li.Value));
        }

        foreach (object o in p)
        {
            //Label1.Text += " - Judge # " + GridView1.SelectedValue.ToString() + " assigned to project #:  " +  o.ToString() + "<br>"  ;
            string BoothNumber = (o.ToString());
            AssignJudge(j, BoothNumber);
        }
        JudgeProjectList.DataBind();
        GridView2.DataBind();
    }

    protected void ListOrAssignProjects(Object src, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "ListProjects" && e.CommandName != "AssignJudge") return;

        // get the row index stored in the CommandArgument property
        int index = Convert.ToInt32(e.CommandArgument.ToString());

        // get the GridViewRow where the command is raised
        GridViewRow currentRow = ((GridView) e.CommandSource).Rows[index];

        // for bound fields, values are stored in the Text property of Cells [ fieldIndex ]
        int jid = int.Parse(currentRow.Cells[2].Text);

        if (e.CommandName == "ListProjects")
        {
            label2.Text = jid + "";
            projectsForJudge.FilterExpression = "JudgeId=" + jid;
        }
        if (e.CommandName == "AssignJudge")
        {
            JudgeAssignStart(jid);
        }
        GridView1.SelectedIndex = index;
    }


    protected void AssignJudge(int jid, string BoothNumber)
    {
        string cmdSelect = "select * from judgeAssignments where judgeId = " + jid + " and BoothNumber= '" + BoothNumber +
                           "'";

        AssignmentData.SelectCommand = cmdSelect;
        DataGrabber dg = new DataGrabber();
        DataTable dt = dg.DB2Table(AssignmentData);
        if (dt.Rows.Count > 0)
        {
            Label1.Text += "<br><span style='color:red'>Judge # " + jid + " was already assigned to booth number: " +
                           BoothNumber + "</span>";
            return;
        }

        string cmdInsert = "insert into judgeAssignments(judgeId,BoothNumber) values(" + jid + ",'" + BoothNumber + "')";

        try
        {
            AssignmentData.InsertCommand = cmdInsert;
            AssignmentData.Insert();
            Label1.Text += "<br><span style='color:blue'>Judge # " + jid + " assigned to project booth : " + BoothNumber +
                           "</span>";
        }
        catch (Exception e)
        {
            Label1.Text += "<br>An error occured:" + e.StackTrace + "<br>";
            return;
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView2.DataBind();
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void GridView2_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        JudgeProjectList.DataBind();
    }

    protected void PageChange(object sender, GridViewPageEventArgs e)
    {
        GridView1.SelectedIndex = -1;
    }

    protected void ScriptManager1_AsyncPostBackError(object sender, AsyncPostBackErrorEventArgs e)
    {
        ScriptManager1.AsyncPostBackErrorMessage = e.Exception.Message + "\n" + e.Exception.StackTrace.Substring(0, 300);
    }

    protected void PageList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.PageSize = int.Parse(PageList.SelectedValue);
        GridView1.DataBind();
    }
}