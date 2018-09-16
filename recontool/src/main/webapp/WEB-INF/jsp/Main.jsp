<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
    
<style type="text/css">
/* Style the tab */
.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

.tablinks {
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    font-size: 17px;
    width: 33.33%;
}
/* Style the buttons inside the tab */
.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
    /*background-color: #ccc;*/
    background-color: #1E90FF;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}

</style>
</head>
<body>

<div class="tab">
  <button class="tablinks" onclick="openTab(event, 'Basic')" id="defaultOpen">Basic Information</button>
  <button class="tablinks" onclick="openTab(event, 'Exception')">Load Exception Categories</button>
  <button class="tablinks" onclick="openTab(event, 'Dashboard')">Dashboard</button>
</div>

<div id="Basic" class="tabcontent">
        <iframe src='loadBasic?id="${id}"' height="500" width="100%">
        </iframe>
</div>

<div id="Exception" class="tabcontent">
        <iframe src="loadException" height="500" width="100%">
        </iframe>
</div>

<div id="Dashboard" class="tabcontent">
        <iframe src="Graph" height="400" width="47%">
            </iframe>
        <iframe src="DashboardTable" height="400" width="47%">
        </iframe>
</div>

<script>
function openTab(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
     
</body>
</html> 
