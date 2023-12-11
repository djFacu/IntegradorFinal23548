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
	//MySqlConexion conexion = new MySqlConexion();
	
	Connection cn = MySqlConexion.conectar();

	try {
	
		Statement stm = cn.createStatement();
	
		ResultSet rsId = stm.executeQuery("SELECT MAX(id) FROM ticket");
	
		while(rsId.next()) {
			
			int  idMax = rsId.getInt(1);
			
			String query = "UPDATE ticket SET activo = '0' WHERE id = "+idMax+"";
			
			stm.executeUpdate(query);
			
		}
	}catch(Exception e){
		//out.println("No se enviaron los datos");
		e.printStackTrace();
	}
%>

<jsp:include page="../index.html"></jsp:include>

</body>
</html>