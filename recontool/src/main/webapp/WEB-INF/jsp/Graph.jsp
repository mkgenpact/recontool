<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

   <script type = "text/javascript">
      google.charts.load('current', {packages: ['corechart']});
      function drawChart() {
          // Define the chart to be drawn.
          var smcount = parseInt("${smcount}");
          var stcount = parseInt("${stcount}");
          var amcount = parseInt("${amcount}");

          var data = google.visualization.arrayToDataTable([
             ['Category', 'Count'],
             ['SM Count',  smcount],
             ['ST Count',  stcount],
             ['AM Count',  amcount]
          ]);

          var options = {title: 'Category wise exceptions'}; 

          // Instantiate and draw the chart.
          var chart = new google.visualization.ColumnChart(document.getElementById('container'));
          chart.draw(data, options);
       }
       google.charts.setOnLoadCallback(drawChart);
   </script>

    <div id = "container" style = "width: 33%; height: 300px;">
    </div>
