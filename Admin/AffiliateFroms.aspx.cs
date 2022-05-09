using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Admin_AffiliateFroms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            LabelGrid.Text = "";
            LabelAddFile.Text = "";
        }
    }


    protected void BtnAddFile_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;

        if (string.IsNullOrEmpty(FileUpload2.FileName))
        {
            LabelAddFile.Text = "No file was selected";
            return;
        }

        //dosya uzantisi
        string OriginFilename = FileUpload2.PostedFile.FileName;
        int pointPos = OriginFilename.LastIndexOf(".");
        string ext = OriginFilename.Substring(pointPos, OriginFilename.Length - pointPos);

       
        string name = TxtFormName.Text;
        DateTime date = DateTime.Now;
        string author = Session["admin"].ToString();



        try
        {
            DataGrabber dg = new DataGrabber();
            string filename = dg.fixFileName(name) + "_" + date.Month + "-" + date.Day + "-" + date.Year + ext;

            if (!Directory.Exists(Server.MapPath("~/AffiliateFroms/")))
            {
                Directory.CreateDirectory(Server.MapPath("~/AffiliateFroms/"));
            }

            FileUpload2.SaveAs(Server.MapPath("~/AffiliateFroms/") + filename);
            string sql = "INSERT INTO [AffiliateForms] ([FormName],[File],[UploadDate],[Author]) values('" + name + "','" + filename + "',#" + date + "#,'" + author + "')";            
            dg.ExecuteNonQuery(sql);
            LabelAddFile.Text = "File uploaded successfully...";
          

        }
        catch (Exception err)
        {
            LabelAddFile.Text = "File could not be uploaded..." + err.Message;

        }

        GridView1.DataBind();

    }


    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        if (!Page.IsValid)
            return;

        FileUpload fileUpLoad = GridView1.Rows[GridView1.EditIndex].FindControl("FileUpload1") as FileUpload;

        if (string.IsNullOrEmpty(fileUpLoad.FileName))
        {
            LabelGrid.Text = "No file was selected";
            return;
        }

        String id = e.Keys[0].ToString();
        String formName = (e.NewValues["FormName"].ToString());

        
        // get file ext
        String OriginFilename = fileUpLoad.PostedFile.FileName;
        int pointPos = OriginFilename.LastIndexOf(".");
        String ext = OriginFilename.Substring(pointPos, OriginFilename.Length - pointPos);

        string name = TxtFormName.Text;
        DateTime date = DateTime.Now;
        string author = Session["admin"].ToString();


        try
        {
            DataGrabber dg = new DataGrabber();

            String fileName = fileUpLoad.FileName;
            fileName = dg.fixFileName(formName) + "_" + date.Month + "-" + date.Day + "-" + date.Year + ext;

           

            if (!Directory.Exists(Server.MapPath("~/AffiliateFroms/")))
            {
                Directory.CreateDirectory(Server.MapPath("~/AffiliateFroms/"));
            }

            fileUpLoad.SaveAs(Server.MapPath("~/AffiliateFroms/") + fileName);

            String sql = "Update AffiliateForms SET [FormName]='" + formName + "', [File]='" + fileName + "', [UploadDate]=#" + date + "#, [Author]='" + author + "' WHERE AffiliateForms.ID=" + id;
           // LabelAddFile.Text = sql;
            dg.ExecuteNonQuery(sql);


            LabelGrid.Text = "Form <strong>"+formName + "</strong> uploaded successfully...";
          

        }
        catch (Exception err)
        {
            LabelGrid.Text = "File could not be uploaded..." + err.Message;
        }



    }




    protected void BtnCancel_Click(object sender, EventArgs e)
    {

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