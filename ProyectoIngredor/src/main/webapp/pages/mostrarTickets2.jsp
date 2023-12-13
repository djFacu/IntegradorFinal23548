<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "pf.integrador.java.MySqlConexion" %>  
<%@ page import = "java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	Connection cn = MySqlConexion.conectar();
	ResultSet rs;
	String query = "SELECT * FROM ticket WHERE activo ='1'";
	
	//PreparedStatement ps;
	//ps = cn.prepareStatement(query);
	//rs = ps.executeQuery();
	
	Statement stm;
	stm = cn.createStatement();
	rs = stm.executeQuery(query);

%>

<h1>Mostrar Tickets total</h1>

	<% while(rs.next()){ %>
	<div style="text-align:center">
			<h2>Ticket de compra <%= rs.getInt(1) %></h2>
			<p><%= rs.getString(2) %></p>
			<p><%= rs.getString(3) %></p>
			<p><%= rs.getString(4) %></p>
			<p><%= rs.getString(5) %></p>
			<p><%= rs.getString(6) %></p>
			<p><%= rs.getInt(7) %></p>
			<p>Editar</p>
			<p>Eliminar</p>
	</div>
	<% } %>



</body>
</html>