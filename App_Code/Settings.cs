using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Settings
/// </summary>
public static class Settings
{
    public static int CurrentYear = 2016;
    public static int MaxNumberOfContestantsAllowedForGroupProjects = 3;
    public static int minDateOfBirthAllowedForContestants = CurrentYear - 22;
    public static int maxDateOfBirthAllowedForContestants = CurrentYear - 14;

    // <br> alt satira gec demek, gerekli yerlere <br> konmali. 
    // <b> koyu renk yaz demek. <b> ve </b> arasindaki hersey bold olur
    public static string scholarshipAwardedMessage = @"<b>Congratulations ! 
                You are awarded with the scholarship. This scholarship covers the following expenses of contestant(s) and one adult supervisor.<br> 
                
                1.	Hotel accommodations from April 15, 2010 to April 20, 2010. See hotel information enclosed,<br>
                2.	All breakfasts, pre-arranged luncheons, and pre-arranged dinner receptions.<br>
                3.	Local transportation<br>
                4.	Fees for trip organizations during the fair.<br>
                </b>";
    public static string scholarshipNotAwardedMessage = @"<b>You are eligible to participate in I-SWEEEP " + CurrentYear + @". 
                You should pay the cost of attendance ( $150 per day per person) to Organizing Committee to attend all I-SWEEEP events.
                Please, contact us at info@isweeep.org</b>";

}
