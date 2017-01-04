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
<%
	String username=(String)session.getAttribute("username");
%>
<ol class="breadcrumb">
  <li><a href="welcomeProf?page=h">Home</a></li>
  <li><a href="welcomeProf?page=m">Mes modules</a></li>
</ol>
<div class="row">
	<div style="text-align: center" class="col-md-2 col-md-offset-10">
		<kbd>Signed in as <%out.print(username); %> <a style="color: red" href="login?logout=">Logout?</a></kbd>
	</div>
</div>
<%
	String pa=request.getParameter("page");

	switch(pa){
	case "h":
%>
<div class="col-md-6 col-md-offset-3 ">
	<div style="padding: 30px" class="jumbotron">
		<h1>Hello, <%out.print(username); %></h1>
		<p>Iwa Marhbabikom 3adna fhad site d zab !, j'espere yfidkom f chi 9alwa f hyatkom, en tous cas ceci est un message d'acceuil pour les etudiant, si jamais vous faites une autre page welcome dyal prof, c'est ici qui faut changer</p>
		<p><a class="btn btn-primary btn-lg" href="welcomeProf?page=m">Modules</a></p>
	</div>
</div>
<%
		break;
	case "m":
%>

<div  class="col-md-6 col-md-offset-3 ">
<h2>MES MODULES:</h2>
	 <div class="panel-group" id="accordion">
	 
	  <c:forEach items="${modules}" var="module">
	  <c:choose>
		  <c:when test='${module.prof.id==username}'>
		  <div class="panel panel-default">
		    <div class="panel-heading">
		      <h4 class="panel-title">	        
		        <a href="ModuleServlet?page=h&id_m=${module.id}"><h3> ${module.titre} <small>- par Mr. ${module.prof.id}</small></h3></a> 
		        		<a class="btn btn-primary btn-lg" href="welcomeProf?page=a&id_m=${module.id}">Ajouter chapitre</a>
		        		
		        
	
		      </h4>
		    </div>
		    <div id="${module.id}" class="panel-collapse collapse">
		      <div class="panel-body">Ici la description du module, vous pouvez meme penser a integrer la liste des chapitres ici !</div>
		    </div>
		  </div>
		  </c:when>
		        	
		      	</c:choose>
		</c:forEach>
		
	  
		  <p><a class="btn btn-primary btn-lg" style ="margin-top: 2cm" href="/welcomeProf?page=m">Ajouter Module</a></p>
     
	</div> 
</div>

<%
		break;
			case "a":
				%>
				
 <form method="post" class="form-horizontal" action ="AjoutChapitre">
  <div class="form-group form-group-lg">
    <label class="col-sm-2 control-label" for="formGroupInputLarge">Titre Chapitre</label>
    <div class="col-sm-9">
      <input class="form-control" type="text"  name="titre" id="titre" placeholder="Titre Chapitre">
    </div>
  </div>
  <div class="form-group form-group-sm">
    <label class="col-sm-2 control-label" for="formGroupInputSmall">Chapitre</label>
    <div class="col-sm-9">
          <textarea class="form-control"  name="texte" id="texte" placeholder="chapitre" rows="10" ></textarea>
	  <button type="submit" class="btn btn-primary" style=" margin-top: 0.2cm;">Ajouter</button>
	  <input type="hidden" name="id_m" value="${id_m}">
	  <a class="btn btn-primary" href="welcomeProf?page=q"style=" margin-top: 0.2cm;">Ajouter QCM</a>
    </div>
     
  </div>
 
</form>
<%
		break;
			case "q":
				%>
	<form method="post" class="form-horizontal" action ="AjoutChapitre">
  <div class="form-group form-group-lg">
    <label class="col-sm-2 control-label" for="formGroupInputLarge">Question</label>
    <div class="col-sm-9">
      <input class="form-control" type="text"  name="titre" id="titre" placeholder="Question">
    </div>
  </div>
  <div class="form-group form-group-sm">
    <label class="col-sm-2 control-label" for="formGroupInputSmall">Responses</label>
    <div class="col-sm-8">
      <div class="form-group form-group-lg checkbox" style = "margin-left : 1cm" >
	     <input type="checkbox" value="" style = "margin-top : 0.5cm">
	     <input class="form-control input-sm" type="text" placeholder="reponse 1">
      </div>
      <div class="form-group form-group-lg checkbox" style = "margin-left : 1cm" >
	     <input type="checkbox" value="" style = "margin-top : 0.5cm">
	     <input class="form-control input-sm" type="text" placeholder="reponse 2">
      </div>
      <div class="form-group form-group-lg checkbox" style = "margin-left : 1cm" >
	     <input type="checkbox" value="" style = "margin-top : 0.5cm">
	     <input class="form-control input-sm" type="text" placeholder="reponse 3">
      </div>
      <div class="form-group form-group-lg checkbox" style = "margin-left : 1cm" >
	     <input type="checkbox" value="" style = "margin-top : 0.5cm">
	     <input class="form-control input-sm" type="text" placeholder="reponse 4">
      </div>
      	  <button type="submit" class="btn btn-primary" style=" margin-top: 0.2cm;">Ajouter Question</button>
      	  	  <button type="submit" class="btn btn-primary" style=" margin-top: 0.2cm;">Ajouter QCM</button>
         
    </div>
     
  </div>
 
</form>


	<% break;
	default:
%>
<jsp:forward page="welcomeProf" />
<%
		break;
	}
%>





</body>
</html>