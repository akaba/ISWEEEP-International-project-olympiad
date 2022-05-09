using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Net;
using System.IO;

public partial class Donations_donate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if(!IsPostBack)
		{
			//string ip= Request.ServerVariables["REMOTE_ADDR"];
			//string referer = Request.ServerVariables["HTTP_REFERER"];
			//EmailSender es = new EmailSender();
			//es.sendMail("Donation page visit from: " + ip + " <br>referer: " + referer, "I-SWEEEP Donation page visit", "fatihak@harmonytx.org", "fatihak@harmonytx.org");
		}
        
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
        {
            lblMessage.Text = "You entered an invalid value, please check that everything is correct and valid";
            return;
        }
        readHtmlPage("https://secure.authorize.net/gateway/transact.dll");
        //Uncomment the line ABOVE for shopping cart testing OR uncomment the line BELOW for live accounts
        //myPage.Text = readHtmlPage("https://secure.authorize.net/gateway/transact.dll")
    }

    //String strPost = "x_login=YOUR-LOG-IN-ID&x_tran_key=YOUR-TRANSACTION-KEY&x_method=CC&x_type=AUTH_CAPTURE
    //&x_amount=1.00&x_delim_data=TRUE&x_delim_char=|&x_relay_response=FALSE
    //&x_card_num=4111111111111111&x_exp_date=052009&x_test_request=TRUE&x_version=3.1";

    private void readHtmlPage(string url)
    {
        String result = "";
        string loginID = "598JrzK4m3";
        string transkey = "4Ag436sEDDp56e7w";
        string amount = txtAmount.Text.Trim();
        string cardNumber = txtcardNumber.Text.Trim();
        string expDate = ddMonth.SelectedValue + "/" + ddYear.SelectedValue;
        string cardCode = txtSecCode.Text.Trim();
        string address = txtAddress.Text.Trim();
        string zipCode = txtZipCode.Text.Trim();
        string city = txtCity.Text.Trim();
        string state = txtState.Text.Trim();
        string country = txtCountry.Text.Trim();
        string email = txtEmail.Text.Trim();
        string phone = txtPhone.Text.Trim();
        string organization = txtOrganization.Text.Trim();
        string billing_fname = txtFirstNameonCard.Text.Trim();
        string billing_lname = txtLastNameonCard.Text.Trim();
        string fname = txtFirstName.Text.Trim();
        string lname = txtLastName.Text.Trim();
        string donatingPerson = fname + " " + lname;
        
        String strPost = String.Format(@"x_login={0}&x_tran_key={1}&x_amount={2}
            &x_card_num={3}&x_exp_date={4}&x_card_code={5}&x_first_name={6}&x_last_name={7}
            &x_address={8}&x_zip={9}&x_city={10}&x_state={11}&x_country={12}
            &x_email={13}&x_phone={14}&x_company={15}&donatingPerson={16}
            &x_method=CC&x_test_request=FALSE&x_version=3.1&x_type=AUTH_CAPTURE
            &x_delim_data=TRUE&x_delim_char=|&x_relay_response=FALSE",
            loginID,transkey,amount,cardNumber,expDate,cardCode,
            billing_fname,billing_lname,address,zipCode,city,state,country,email,phone,organization, donatingPerson);

        //Label1.Text = strPost;

        HttpWebRequest objRequest = PostRequest(url, strPost);

        result = GetResponse(result, objRequest);

        ProcessResponse( result);
    }

    private static String GetResponse(String result, HttpWebRequest objRequest)
    {
        HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
        using (StreamReader sr =
           new StreamReader(objResponse.GetResponseStream()))
        {
            result = sr.ReadToEnd();
            sr.Close();
        }
        return result;
    }

    private HttpWebRequest PostRequest(string url, String strPost)
    {
        StreamWriter myWriter = null;

        HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(url);
        objRequest.Method = "POST";
        objRequest.ContentLength = strPost.Length;
        objRequest.ContentType = "application/x-www-form-urlencoded";

        try
        {
            myWriter = new StreamWriter(objRequest.GetRequestStream());
            myWriter.Write(strPost);
        }
        catch (Exception e)
        {
            SetMessage( e.Message, Color.Red);
        }
        finally
        {
            myWriter.Close();
        }
        return objRequest;
    }

    private void ProcessResponse(string result)
    {
        lblMessage.Text = result;
        string[] codes = result.Split('|');
        if (codes[0] == "1")
            Approve(result);
        else if (codes[0] == "2")
            Declined();
        else if (codes[0] == "3")
            TransactionError();
        else if (codes[0] == "4")
            HeldForReview();
        //lblMessage.Text = codes[3];
        //lblMessage.Text = result;
    }

    private void HeldForReview()
    {
        SetMessage( "The transaction has been held for review, your donation will be reviewed by the bank.<br>Thank you.", Color.Maroon);
        btnSubmit.Visible = false;
    }

    private void TransactionError()
    {
        SetMessage("The transaction cannot be processed. Please make sure that you entered everything correctly.", Color.Red);
        btnSubmit.Visible = true;
    }

    private void Declined()
    {
        SetMessage( "Card information is invalid, please make sure that you entered everything correctly.", Color.Red);
        btnSubmit.Visible = true;
    }   

    protected void Approve(string result)
    {
        SetMessage( "Thank you for donating to I-SWEEEP, you will receive an email shortly",Color.Blue);
        btnSubmit.Visible = false;
        MultiView1.SetActiveView(View2);
        WriteReceipt(result);
    }

    private void WriteReceipt(string result)
    {
        string[] response = result.Split('|');
        string donatingPerson = response[response.Length-1];
        string trans_id = response[7];
        string receiptText = "<h2>Thank you for donating to I-SWEEEP</h2>";
        receiptText += "<b>Donor Name:</b> " + donatingPerson + "<br>";
        receiptText += "<b>Organization:</b> " + txtOrganization.Text + "<br>";
        receiptText += "<b>Payment Amount:</b> $" + txtAmount.Text + "<br>";
        receiptText += "<b>Card Number:</b> XXXXXXXXXXXX" + txtcardNumber.Text.Substring(12, 4)+ "<br>";
        receiptText += "<b>Address:</b> " + txtAddress.Text + ", " + txtCity.Text + ", " + txtZipCode.Text + ", " + txtState.Text + ", " + txtCountry.Text + "<br>";
        receiptText += "<b>Transaction Time:</b> " +DateTime.Now.ToString() + "<br>";
        receiptText += "<br><h2>I-SWEEEP</h2>";
        ReceiptLabel.Text = receiptText;

        SendEmail(receiptText);
    
    }

    private void SendEmail(string receiptText)
    {
        EmailSender es = new EmailSender();
        es.sendMail(receiptText, "I-SWEEEP Donation", "info@isweeep.org", txtEmail.Text);
    }
    protected void SetMessage(string text, Color color)
    {
        lblMessage.Text = lblMessage0.Text = text;
        lblMessage0.ForeColor = lblMessage.ForeColor = color;
    }
}
