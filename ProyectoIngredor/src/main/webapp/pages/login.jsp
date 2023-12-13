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
	String usuario = request.getParameter("name");
	String contrasenia = request.getParameter("pass");
	
	Connection cn = MySqlConexion.conectar();

	try {
	
		Statement stm = cn.createStatement();
	
		ResultSet rs = stm.executeQuery("SELECT usuario,contrasenia FROM login");
	
		while(rs.next()) {
			
			if( usuario.equals(rs.getString(1)) && contrasenia.equals(rs.getString(2))) {
		%>				
				<jsp:include page="tickets.jsp"></jsp:include>
		<%
			}
			else {
				
			}
		}
	}catch(Exception e){
		//out.println("No se enviaron los datos");
		e.printStackTrace();
	}
%>

</body>
</html>