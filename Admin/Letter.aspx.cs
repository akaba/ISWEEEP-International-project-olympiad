using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_Letter : System.Web.UI.Page
{
    private string adminname;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            adminname = Session["admin"].ToString();
        }
        catch (Exception ee)
        {
            //lblMessage.Text = "Session timed out. Please <a href='login.aspx?msj=1'>login</a>  to continue";
            Response.Redirect("Logon.aspx?msj=1");
            return;
        }
        if (!IsPostBack)
            Fill();

    }


    private void Fill()
    {
        DataGrabber dg = new DataGrabber();
        AccessDataSource1.SelectCommand = "select * from Docs where docid=1";
        DataTable dt = dg.DB2Table(AccessDataSource1);

        if (dt.Rows.Count < 1)
        {
            Label1.Text = "<h2>No data found please fill out Letter Text and save...</h2>";
            return;
        }
        string myletter = dt.Rows[0]["letter"].ToString();

        
        dt = dg.DB2Table(SchoolsDataSource);
        if (dt.Rows.Count < 1)
        {
            Label1.Text = "<h2>No Schools data found for this Adult Superviser.</h2>";
            return;
        }
        string orgName = dt.Rows[0]["SchoolName"].ToString();
        string orgHead = dt.Rows[0]["SchoolHead"].ToString();
        string orgAddress = dt.Rows[0]["SchoolAddress"].ToString();
        string orgPhone = dt.Rows[0]["SchoolPhone"].ToString();
        string orgFax = dt.Rows[0]["SchoolFax"].ToString();
        string orgStreet = "";
        string orgCity = "";
        string orgState = "";
        string orgZip = "";
        string orgCountry = "";

        if (orgAddress != "")
        {
            string[] adresler = orgAddress.Split(';');
            orgStreet = adresler[0];
            if (adresler.Length == 5)
            {
               orgCity = adresler[1].Trim();
               orgState = adresler[2].Trim();
               orgZip = adresler[3].Trim();
               orgCountry = adresler[4].Trim();
            }
         }

        orgCountry = GetCountryName(orgCountry).ToUpper(); 

        DateTime thisDay = DateTime.Today;

        string LetterHead = thisDay.ToString("MMM d, yyyy");
        LetterHead += "<br /><br />"+orgHead+", Head of Organization";
        LetterHead += "<br />" + orgName;
        LetterHead += "<br />Address: " + orgStreet + ", " + orgCity + ", " + orgState + ", " + orgZip + ", " + orgCountry;
        LetterHead += "<br />Phone: " + orgPhone + "	Fax: " + orgFax;
        LetterHead += "<br /><br />Dear " + orgHead +",<br/><br/>";

        Label1.Text = LetterHead;


       
        myletter = myletter.Replace(char.ConvertFromUtf32(13), "<br/>");          

        string[] words = myletter.Split(new[] { "[member-list]" }, StringSplitOptions.None);

        words[0]=words[0].Replace("[country]", orgCountry);
        words[0] = words[0].Replace("[organization-name]", orgName);
        Label2.Text = words[0];
       
        Label3.Text = words[1];

        //Label1.Text = foundIt.ToString();

    }

    string  GetCountryName(string shotcode)
    {
        string Country = "";
        switch (shotcode)
        {
            case "US": Country = "United States"; break;
            case "AF": Country = "Afghanistan"; break;
            case "AL": Country = "Albania"; break;
            case "DZ": Country = "Algeria"; break;
            case "AS": Country = "American Samoa"; break;
            case "AD": Country = "Andorra"; break;
            case "AO": Country = "Angola"; break;
            case "AI": Country = "Anguilla"; break;
            case "AQ": Country = "Antarctica"; break;
            case "AG": Country = "Antigua And Barbuda"; break;
            case "AR": Country = "Argentina"; break;
            case "AM": Country = "Armenia"; break;
            case "AW": Country = "Aruba"; break;
            case "AU": Country = "Australia"; break;
            case "AT": Country = "Austria"; break;
            case "AZ": Country = "Azerbaijan"; break;
            case "BS": Country = "Bahamas"; break;
            case "BH": Country = "Bahrain"; break;
            case "BD": Country = "Bangladesh"; break;
            case "BB": Country = "Barbados"; break;
            case "BY": Country = "Belarus"; break;
            case "BE": Country = "Belgium"; break;
            case "BZ": Country = "Belize"; break;
            case "BJ": Country = "Benin"; break;
            case "BM": Country = "Bermuda"; break;
            case "BT": Country = "Bhutan"; break;
            case "BO": Country = "Bolivia"; break;
            case "BA": Country = "Bosnia And Herzegowina"; break;
            case "BW": Country = "Botswana"; break;
            case "BV": Country = "Bouvet Island"; break;
            case "BR": Country = "Brazil"; break;
            case "IO": Country = "British Indian Ocean Territory"; break;
            case "BN": Country = "Brunei Darussalam"; break;
            case "BG": Country = "Bulgaria"; break;
            case "BF": Country = "Burkina Faso"; break;
            case "BI": Country = "Burundi"; break;
            case "KH": Country = "Cambodia"; break;
            case "CM": Country = "Cameroon"; break;
            case "CA": Country = "Canada"; break;
            case "CV": Country = "Cape Verde"; break;
            case "KY": Country = "Cayman Islands"; break;
            case "CF": Country = "Central African Republic"; break;
            case "TD": Country = "Chad"; break;
            case "CL": Country = "Chile"; break;
            case "CN": Country = "China"; break;
            case "CX": Country = "Christmas Island"; break;
            case "CC": Country = "Cocos (Keeling) Islands"; break;
            case "CO": Country = "Colombia"; break;
            case "KM": Country = "Comoros"; break;
            case "CG": Country = "Congo"; break;
            case "CK": Country = "Cook Islands"; break;
            case "CR": Country = "Costa Rica"; break;
            case "CI": Country = "Cote D'Ivoire"; break;
            case "HR": Country = "Croatia (Local Name: Hrvatska)"; break;
            case "CU": Country = "Cuba"; break;
            case "CY": Country = "Cyprus"; break;
            case "CZ": Country = "Czech Republic"; break;
            case "DK": Country = "Denmark"; break;
            case "DJ": Country = "Djibouti"; break;
            case "DM": Country = "Dominica"; break;
            case "DO": Country = "Dominican Republic"; break;
            case "TP": Country = "East Timor"; break;
            case "EC": Country = "Ecuador"; break;
            case "EG": Country = "Egypt"; break;
            case "SV": Country = "El Salvador"; break;
            case "GQ": Country = "Equatorial Guinea"; break;
            case "ER": Country = "Eritrea"; break;
            case "EE": Country = "Estonia"; break;
            case "ET": Country = "Ethiopia"; break;
            case "FK": Country = "Falkland Islands (Malvinas)"; break;
            case "FO": Country = "Faroe Islands"; break;
            case "FJ": Country = "Fiji"; break;
            case "FI": Country = "Finland"; break;
            case "FR": Country = "France"; break;
            case "GF": Country = "French Guiana"; break;
            case "PF": Country = "French Polynesia"; break;
            case "TF": Country = "French Southern Territories"; break;
            case "GA": Country = "Gabon"; break;
            case "GM": Country = "Gambia"; break;
            case "GE": Country = "Georgia"; break;
            case "DE": Country = "Germany"; break;
            case "GH": Country = "Ghana"; break;
            case "GI": Country = "Gibraltar"; break;
            case "GR": Country = "Greece"; break;
            case "GL": Country = "Greenland"; break;
            case "GD": Country = "Grenada"; break;
            case "GP": Country = "Guadeloupe"; break;
            case "GU": Country = "Guam"; break;
            case "GT": Country = "Guatemala"; break;
            case "GN": Country = "Guinea"; break;
            case "GW": Country = "Guinea-Bissau"; break;
            case "GY": Country = "Guyana"; break;
            case "HT": Country = "Haiti"; break;
            case "HM": Country = "Heard And Mc Donald Islands"; break;
            case "VA": Country = "Holy See (Vatican City State)"; break;
            case "HN": Country = "Honduras"; break;
            case "HK": Country = "Hong Kong"; break;
            case "HU": Country = "Hungary"; break;
            case "IS": Country = "Icel And"; break;
            case "IN": Country = "India"; break;
            case "ID": Country = "Indonesia"; break;
            case "IR": Country = "Iran (Islamic Republic Of)"; break;
            case "IQ": Country = "Iraq"; break;
            case "IE": Country = "Ireland"; break;
            case "IL": Country = "Israel"; break;
            case "IT": Country = "Italy"; break;
            case "JM": Country = "Jamaica"; break;
            case "JP": Country = "Japan"; break;
            case "JO": Country = "Jordan"; break;
            case "KZ": Country = "Kazakhstan"; break;
            case "KE": Country = "Kenya"; break;
            case "KI": Country = "Kiribati"; break;
            case "KP": Country = "Korea, Dem People'S Republic"; break;
            case "KR": Country = "Korea, Republic Of"; break;
            case "KW": Country = "Kuwait"; break;
            case "KG": Country = "Kyrgyzstan"; break;
            case "LA": Country = "Lao People'S Dem Republic"; break;
            case "LV": Country = "Latvia"; break;
            case "LB": Country = "Lebanon"; break;
            case "LS": Country = "Lesotho"; break;
            case "LR": Country = "Liberia"; break;
            case "LY": Country = "Libyan Arab Jamahiriya"; break;
            case "LI": Country = "Liechtenstein"; break;
            case "LT": Country = "Lithuania"; break;
            case "LU": Country = "Luxembourg"; break;
            case "MO": Country = "Macau"; break;
            case "MK": Country = "Macedonia"; break;
            case "MG": Country = "Madagascar"; break;
            case "MW": Country = "Malawi"; break;
            case "MY": Country = "Malaysia"; break;
            case "MV": Country = "Maldives"; break;
            case "ML": Country = "Mali"; break;
            case "MT": Country = "Malta"; break;
            case "MH": Country = "Marshall Islands"; break;
            case "MQ": Country = "Martinique"; break;
            case "MR": Country = "Mauritania"; break;
            case "MU": Country = "Mauritius"; break;
            case "YT": Country = "Mayotte"; break;
            case "MX": Country = "Mexico"; break;
            case "FM": Country = "Micronesia, Federated States"; break;
            case "MD": Country = "Moldova, Republic Of"; break;
            case "MC": Country = "Monaco"; break;
            case "MN": Country = "Mongolia"; break;
            case "MS": Country = "Montserrat"; break;
            case "MA": Country = "Morocco"; break;
            case "MZ": Country = "Mozambique"; break;
            case "MM": Country = "Myanmar"; break;
            case "NA": Country = "Namibia"; break;
            case "NR": Country = "Nauru"; break;
            case "NP": Country = "Nepal"; break;
            case "NL": Country = "Netherlands"; break;
            case "AN": Country = "Netherlands Ant Illes"; break;
            case "NC": Country = "New Caledonia"; break;
            case "NZ": Country = "New Zealand"; break;
            case "NI": Country = "Nicaragua"; break;
            case "NE": Country = "Niger"; break;
            case "NG": Country = "Nigeria"; break;
            case "NU": Country = "Niue"; break;
            case "NF": Country = "Norfolk Island"; break;
            case "MP": Country = "Northern Mariana Islands"; break;
            case "NO": Country = "Norway"; break;
            case "OM": Country = "Oman"; break;
            case "PK": Country = "Pakistan"; break;
            case "PW": Country = "Palau"; break;
            case "PS": Country = "Palestinian Territory"; break;
            case "PA": Country = "Panama"; break;
            case "PG": Country = "Papua New Guinea"; break;
            case "PY": Country = "Paraguay"; break;
            case "PE": Country = "Peru"; break;
            case "PH": Country = "Philippines"; break;
            case "PN": Country = "Pitcairn"; break;
            case "PL": Country = "Poland"; break;
            case "PT": Country = "Portugal"; break;
            case "PR": Country = "Puerto Rico"; break;
            case "QA": Country = "Qatar"; break;
            case "RE": Country = "Reunion"; break;
            case "RO": Country = "Romania"; break;
            case "RU": Country = "Russian Federation"; break;
            case "RW": Country = "Rwanda"; break;
            case "KN": Country = "Saint K Itts And Nevis"; break;
            case "LC": Country = "Saint Lucia"; break;
            case "VC": Country = "Saint Vincent, The Grenadines"; break;
            case "WS": Country = "Samoa"; break;
            case "SM": Country = "San Marino"; break;
            case "ST": Country = "Sao Tome And Principe"; break;
            case "SA": Country = "Saudi Arabia"; break;
            case "SN": Country = "Senegal"; break;
            case "SC": Country = "Seychelles"; break;
            case "SL": Country = "Sierra Leone"; break;
            case "SG": Country = "Singapore"; break;
            case "SK": Country = "Slovakia (Slovak Republic)"; break;
            case "SI": Country = "Slovenia"; break;
            case "SB": Country = "Solomon Islands"; break;
            case "SO": Country = "Somalia"; break;
            case "ZA": Country = "South Africa"; break;
            case "GS": Country = "South Georgia , S Sandwich Is."; break;
            case "ES": Country = "Spain"; break;
            case "LK": Country = "Sri Lanka"; break;
            case "SH": Country = "St. Helena"; break;
            case "PM": Country = "St. Pierre And Miquelon"; break;
            case "SD": Country = "Sudan"; break;
            case "SR": Country = "Suriname"; break;
            case "SJ": Country = "Svalbard, Jan Mayen Islands"; break;
            case "SZ": Country = "Sw Aziland"; break;
            case "SE": Country = "Sweden"; break;
            case "CH": Country = "Switzerland"; break;
            case "SY": Country = "Syrian Arab Republic"; break;
            case "TW": Country = "Taiwan"; break;
            case "TJ": Country = "Tajikistan"; break;
            case "TZ": Country = "Tanzania, United Republic Of"; break;
            case "TH": Country = "Thailand"; break;
            case "TG": Country = "Togo"; break;
            case "TK": Country = "Tokelau"; break;
            case "TO": Country = "Tonga"; break;
            case "TT": Country = "Trinidad And Tobago"; break;
            case "TN": Country = "Tunisia"; break;
            case "TR": Country = "Turkey"; break;
            case "TM": Country = "Turkmenistan"; break;
            case "TC": Country = "Turks And Caicos Islands"; break;
            case "TV": Country = "Tuvalu"; break;
            case "UG": Country = "Uganda"; break;
            case "UA": Country = "Ukraine"; break;
            case "AE": Country = "United Arab Emirates"; break;
            case "GB": Country = "United Kingdom"; break;            
            case "UM": Country = "United States Minor Is."; break;
            case "UY": Country = "Uruguay"; break;
            case "UZ": Country = "Uzbekistan"; break;
            case "VU": Country = "Vanuatu"; break;
            case "VE": Country = "Venezuela"; break;
            case "VN": Country = "VietNam"; break;
            case "VG": Country = "Virgin Islands (British)"; break;
            case "VI": Country = "Virgin Islands (U.S.)"; break;
            case "WF": Country = "Wallis And Futuna Islands"; break;
            case "EH": Country = "Western Sahara"; break;
            case "YE": Country = "Yemen"; break;
            case "YU": Country = "Yugoslavia"; break;
            case "ZR": Country = "Zaire"; break;
            case "ZM": Country = "Zambia"; break;
            case "ZW": Country = "Zimbabwe"; break;


        }

        return Country;
    }

   


}