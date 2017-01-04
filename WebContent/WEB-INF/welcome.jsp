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
  <li><a href="etudiantServlet?page=h">Home</a></li>
  <li><a href="etudiantServlet?page=m">Modules</a></li>
  <li><a href="etudiantServlet?page=i">Mes inscriptions</a></li>
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
		<p><a class="btn btn-primary btn-lg" href="etudiantServlet?page=m">Modules</a></p>
	</div>
</div>
<%
		break;
	case "m":
%>
<div  class="col-md-6 col-md-offset-3 ">
<h2>LES MODULES:</h2>
	 <div class="panel-group" id="accordion">
	 
	  <c:forEach items="${modulesInscrits}" var="module">
		  <div class="panel panel-default">
		    <div class="panel-heading">
		      <h4 class="panel-title">
		        <a data-toggle="collapse" data-parent="#accordion" href="#${module.id}">
		        	 ${module.titre} <small>- par Mr. ${module.prof.id}	</small>
		        </a>  		
		      </h4>
		    </div>
		    <div id="${module.id}" class="panel-collapse collapse">
		      <div class="panel-body">
		      	Ici la description du module, vous pouvez meme penser a integrer la liste des chapitres ici !
		      	<br>
		      	<br>
		      </div>
		      <div class="panel-footer"><span style="color: green">Inscrit...</span></div>
		    </div>
		    
		  </div>
		</c:forEach>
		
		
		 <c:forEach items="${modulesNonInscrits}" var="module">
		  <div class="panel panel-default">
		    <div class="panel-heading">
		      <h4 class="panel-title">
		        <a data-toggle="collapse" data-parent="#accordion" href="#${module.id}">
		        	${module.titre} <small>- par Mr. ${module.prof.id}	</small>
		        </a>		         
		      </h4>
		    </div>
		    <div id="${module.id}" class="panel-collapse collapse">
		      <div class="panel-body">
		      	Ici la description du module, vous pouvez meme penser a integrer la liste des chapitres ici !
		      	<br>
		      	<br>		      	
		      </div>
		      <div class="panel-footer">
		      		<a  href="etudiantServlet?page=m&id_m=${module.id}" >
		        		<button type="button" class="btn btn-primary" >S'inscrire</button>
		      		</a>
		      	</div>
		    </div>
		  </div>
		</c:forEach>					  
	</div> 
</div>

<%
	break;
	case "i":
%>
<div  class="col-md-6 col-md-offset-3 ">
<h2>Mes inscriptions:</h2>
	 <div class="panel-group" id="accordion">	 
	  <c:forEach items="${Inscriptions}" var="inscri">
		  <div class="panel panel-default">
		    <div class="panel-heading">
		      <h4 class="panel-title">
		        <a href="ModuleServlet?page=h&id_m=${inscri.module.id}">
		        	<h3> ${inscri.module.titre} <small>- par Mr. ${inscri.module.prof.id}	
		        	-avancement : ${inscri.niveauAvancement} %</small> 	        			        	      
		        	</h3>		        	
		        </a> 
		      </h4>
		    </div>
		  </div>
		</c:forEach>  
	</div> 
</div>

<%
	break;
	default:
%>
<jsp:forward page="etudiantServlet" />
<%
		break;
	}
%>

</body>
</html>