<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
 
try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:sqlserver://"
                + "localhost:1433;"
                + "databaseName=BIRD_FARM_SHOP;"
                + "instanceName=SQLEXPRESS", "sa", "12345");
	Statement statement = connection.createStatement();
	String xVal, yVal;
	
	ResultSet resultSet = statement.executeQuery("select deliveryCost, Total from [Order]");
	
	while(resultSet.next()){
		xVal = resultSet.getString("x");
		yVal = resultSet.getString("y");
		map = new HashMap<Object,Object>(); map.put("x", Double.parseDouble(xVal)); map.put("y", Double.parseDouble(yVal)); list.add(map);
		dataPoints = gsonObj.toJson(list);
	}
	connection.close();
}
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	dataPoints = null;
}
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dashboard</title>
        <!-- Favicon-->
<link rel="icon" type="image/x-icon" href="img/bird_logo.png" />
<script type="text/javascript">
window.onload = function() { 
 
<% if(dataPoints != null) { %>
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "JSP Column Chart from Database"
	},
	data: [{
		type: "column", //change type to bar, line, area, pie, etc
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();
<% } %> 
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
</body>
</html>                      