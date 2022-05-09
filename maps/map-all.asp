<%
lat = 20
lng = 0
SchoolName = "Cosmos Foundation, The Organizer"
SchoolAddress = "9431 W. Sam Houston Pkwy. S., Houston, Texas 77099"
Key= "ABQIAAAA3I7GB3pNPnYyG36gsAjPhhTnP6XrIqP9vYMziWpFL3rUwdRjGxRXv2WqyAz5UhunQG61rwo8N5qt2w"
%>

<html>
<head>
    <title>Where I-SWEEEP project come from?</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>

<script src="http://maps.google.com/maps?file=api&amp;v=2.69&amp;key=<%=Key%>"
    type="text/javascript"></script>

<script type="text/javascript">
    //<![CDATA[
    var data = [];
    var name;
    var map;
    var geocoder;
    function load() {
        map = new GMap2(document.getElementById("map"));
        map.addControl(new GSmallMapControl());
        map.addControl(new GMapTypeControl());
        map.addControl(new GOverviewMapControl());
        map.setCenter(new GLatLng(<%=lat%>, <%=lng%>),2);/* This should be schools lat/long */
        geocoder = new GClientGeocoder()

    }

    function createMarker(point, address, name1, num) {
        var marker = new GMarker(point);
        GEvent.addListener(marker, "click", function() {

            marker.openInfoWindowHtml("" + name1 + "<br/>" + address);
        });
        return marker;
    }

    function addAddressToMap(response) {
        if(response.Status.code==620)
	{
		alert("too many requests in a short time, will not continue");return;
	}
        if (!response || response.Status.code != 200) {
            //document.getElementById("2").innerHTML += "<font color='red'>" + "Not found: " + document.forms[0].q.value + "</font><br/>";
        }

        else {
            place = response.Placemark[0];
            point = new GLatLng(place.Point.coordinates[1], place.Point.coordinates[0]);
//map.setCenter(point, 10);
            map.addOverlay(createMarker(point, place.address, name, no - 1));
            var accuracy = place.AddressDetails.Accuracy;
            /*if (accuracy < 8 )
                document.getElementById("2").innerHTML += "<span style='cursor:hand;color:red;text-decoration:underline' title='Address should be: " + document.forms[0].q.value + "' > " + place.address + "</span><br/>";
            else
                document.getElementById("2").innerHTML += "<span title='Address in the database: " + document.forms[0].q.value + "' > " + place.address + "</span><br/>";
          */
}
        if (data.length > 1)
		setTimeout("continueFinding()",400);
    }
function continueFinding()
{
	findLocation(data.pop(), data.pop());	
}
    function showLocation() {
        var address = document.forms[0].q.value;
        geocoder.getLocations(address, addAddressToMap);
    }

    var no = 1;
    function findLocation(name1, address) {
        document.forms[0].q.value = address;
        name = name1;
        //document.getElementById("1").innerHTML += "" + (no++) + ": " + name1 + ":<br/> ";
        showLocation();
    }

    //]]>
</script>

<body onload="load();s();">
    <div id="1" style="position: absolute; left: 650px; top: 20px;  padding: 2px;
        border: 3px solid black; background: #aaccff;">
    </div>
    <div id="2" style="position: absolute; left: 850px; top: 20px;width:600px;  padding: 2px;
        border: 3px solid black; background: #aaccff;">
    </div>
    <div style="display: none">
        <form onsubmit="showLocation(); return false;" action="#">
        <p>
            <b>Search for an address:</b>
            <input size="40" name="q" />
            <input type="submit" value="Search" name="find"/>
        </p>
        </form>
    </div>
    <div id="map" style="border: 2px solid black; width: 100%; height: 100%"></div>
    </form>
</body>

<script type="text/javascript">
function s() {
    //var data = [];
    /*Okulun adres/adini ilk olarak ekleyelim*/
    data.push('<%=SchoolAddress%>', '<%=SchoolName%>');
    //all address/name pairs here...data.push() icine...    
<%
DatabasePath = "E:\Web\isweeep\app_data\isweeep-2008.mdb"

set conn = Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.Jet.OLEDB.4.0"
conn.Open databasepath
set rst = Server.CreateObject("ADODB.RecordSet")
sql="SELECT * from Project_places" 
rst.open sql,conn

do while not rst.eof
    Title = rst("Title")
    Category = rst("Category")
    name = "<b>" & Title & "</b><br>Category: " & Category
    ProjectAddress=rst("City") & " " & rst("state") & ", " & rst("Country")

    Response.write("data.push(" & Chr(34) & ProjectAddress  & Chr(34) & ", " & Chr(34) & Name  & Chr(34) & ")" & "; " & Chr(10))
    rst.movenext
loop
rst.close

%>
    //this function should stay here...
    findLocation(data.pop(), data.pop());

}
</script>

</html> 