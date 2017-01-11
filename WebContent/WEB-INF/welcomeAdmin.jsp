<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<title>Bienvenue...</title>
</head>

<body>
	
	<ol class="breadcrumb">
	  <li><a href="AdminServlet?page=h">Home</a></li>
	  <li><a href="AdminServlet?page=u">Utilisateurs</a></li>
	</ol>
	
	<div class="row">
		<div style="text-align: center" class="col-md-2 col-md-offset-10">
			<kbd>Signed in as ${sessionScope.username} <a style="color: red" href="login?logout=">Logout?</a></kbd>
		</div>
	</div>
	<%
		String pa=request.getParameter("page");
	
		switch(pa){
		case "h":
	%>
	<div class="col-md-6 col-md-offset-3 ">
		<div style="padding: 30px" class="jumbotron">
			<h1>Hello, ${sessionScope.username} </h1>
			<p>Iwa Marhbabikom 3adna fhad site d zab !, j'espere yfidkom f chi 9alwa f hyatkom, en tous cas ceci est un message d'acceuil pour les etudiant, si jamais vous faites une autre page welcome dyal prof, c'est ici qui faut changer</p>
		</div>
	</div>
	<%
		break;
	case "u":
	%>
			<div  class="col-md-6 col-md-offset-3 ">
				<h2>LES UTILISATEURS:</h2>
				
				 <a  href="AdminServlet?page=add" >
					<button type="button" class="btn btn-primary" >ADD USER</button>
					</a>	
					 <div class="panel-group" id="accordion">
					 	  <c:forEach items="${utilisateurs}" var="user">
							  <div class="panel panel-default">
							    <div class="panel-heading">
							      <h4 class="panel-title">
							        	 ${user.getId()} <small>-   ${user.getType()}	</small> 
							        	 <a  href="AdminServlet?page=rm&id=${user.getId()}" >
								        		<button type="button" class="btn btn-primary" >remove</button>
								      	 </a>							        	 							        	 
							      </h4>
							 </div>							   
						</c:forEach>
					</div> 
			</div>
	
	<%
	break;
	default:
			%>
			<jsp:forward page="AdminServlet" />
			<%
					break;
	}
	%>

</body>
</html>