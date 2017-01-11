<%@page import="java.util.List"%>
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
<%@ taglib prefix="tf" uri="/WEB-INF/functionsJSP.tld"%>
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
	String username = (String) request.getSession().getAttribute("username");
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
	 
	  <c:forEach items="${modules}" var="module">
		  <div class="panel panel-default">
		    <div class="panel-heading" >
		      <h4 class="panel-title">
		      
		        <a data-toggle="collapse" data-parent="#accordion" href="#${module.id}">
		        	<div class="row" style="margin-right: 3px">
		        		<div class="col-md-8">
		        			${module.titre} <small>- par Mr. ${module.prof.id}	</small>
		        		</div>
		        			<c:if test="${tf:isInscrit(module.inscriptions,username)}">
			        			<div class="progress" style="margin-bottom: 0px;background-color:#b1b1b1;">
	  								<div class="progress-bar" role="progressbar" aria-valuenow="${tf:getInscription(module.inscriptions,username).niveauAvancement}" aria-valuemin="0" aria-valuemax="100" style="width:${tf:getInscription(module.inscriptions,username).niveauAvancement}%">${tf:getInscription(module.inscriptions,username).niveauAvancement}%</div>
							 	</div>
						 	</c:if>
		        	</div>
		        </a> 
		        
		         		
		      </h4>
		    </div>
		    
		    
		    <div id="${module.id}" class="panel-collapse collapse">
		    
		      <div class="panel-body">
		      
		      	<span> Ici la description du module, vous pouvez meme penser a integrer la liste des chapitres ici !</span>
		      	
			    <c:if test="${tf:isInscrit(module.inscriptions,username)}">
			      	<br>
			      	<br>
			      	
			      	<h4>LES CHAPITRES:</h4>
			      		 <div class="list-group">
			      		 
			      		 	  <c:forEach items="${module.chapitres}" var="chapitre">
			      		 	  	<c:set var="isValide" value="${tf:validationChapitre(chapitre,username)}"/>
			      		 	  	<c:choose>
    								<c:when test="${isValide==1}">
       									<a data-toggle="modal" href="#${chapitre.id}" class="list-group-item justify-content-between list-group-item-success">
							  				<div class="col-md-11">
							  					${chapitre.titre}
							  				</div>
							  				<span class="btn  glyphicon glyphicon-ok" style="display: inline;"></span>
							  			</a>
    								</c:when>
    								<c:when test="${isValide==2}">
       									<a data-toggle="modal" href="#${chapitre.id}" class="list-group-item justify-content-between">
							  				<div class="col-md-11">
							  					${chapitre.titre}
							  				</div>
							  				<span class="btn  glyphicon glyphicon glyphicon-play-circle" style="display: inline;"></span>
							  			</a>
    								</c:when>
    								<c:when test="${isValide==3}">
       									<li  class="list-group-item justify-content-between list-group-item-danger">
							  				<div class="col-md-11">
							  					${chapitre.titre}
							  				</div>
							  				<span class="btn  glyphicon glyphicon-remove" style="display: inline;"></span>
							  			</li>
    								</c:when>
   
								    <c:otherwise>
								       There is a problem in had l9lawi
								    </c:otherwise>
								</c:choose>
			      		 	  

							  	<!-- Modal -->
							  	<c:choose>
							  		<c:when test="${isValide==3}">
										
									</c:when>
									<c:otherwise>
										<div class="modal fade" id="${chapitre.id}" tabindex="-1" role="dialog" aria-labelledby="${chapitre.id}">
										  <div class="modal-dialog" role="document">
										    <div class="modal-content">
										      <div class="modal-header">
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										        <h4 class="modal-title" id="${chapitre.id}"><strong>${module.titre}:</strong> ${chapitre.titre}</h4>
										      </div>
										      <div class="modal-body">
										        ${chapitre.text}
										      </div>
										      <div class="modal-footer">
										      	<c:if test="${isValide==2}">								      	
										        	<a class="btn btn-primary" href="etudiantServlet?page=q&chap_id=${chapitre.id}" >Examinez-vous</a>
										        </c:if>
										        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										      </div>
										    </div>
										  </div>
										</div>
									</c:otherwise>
								</c:choose>
							  	
							  </c:forEach>
	
						 </div>
		      	
		      		</c:if> 
		      	
		      	</div>
		      
		      
	      		<div class="panel-footer">
	      			<c:choose>
   						<c:when test="${tf:isInscrit(module.inscriptions,username)}">
   							<span style="color: green">Inscrit le  ${tf:getInscription(module.inscriptions,username).dataInscription}</span>        
   						</c:when>    
   						<c:otherwise>
       						<div class="panel-footer">
	      						<a  href="etudiantServlet?page=m&id_m=${module.id}" >
	        						<button type="button" class="btn btn-primary" >S'inscrire</button>
	      						</a>
	      					</div>         
   						</c:otherwise>
					</c:choose>
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
<h2>MES INSCRIPTIONS:</h2>
	 <div class="panel-group" id="accordion">
	 
	  <c:forEach items="${modules}" var="module">
		<c:if test="${tf:isInscrit(module.inscriptions,username)}">
		  <div class="panel panel-default">
		    <div class="panel-heading" >
		      <h4 class="panel-title">
		      
		        <a data-toggle="collapse" data-parent="#accordion" href="#${module.id}">
		        	<div class="row" style="margin-right: 3px">
		        		<div class="col-md-8">
		        			${module.titre} <small>- par Mr. ${module.prof.id}	</small>
		        		</div>
		        			
			        			<div class="progress" style="margin-bottom: 0px;background-color:#b1b1b1;">
	  								<div class="progress-bar" role="progressbar" aria-valuenow="${tf:getInscription(module.inscriptions,username).niveauAvancement}" aria-valuemin="0" aria-valuemax="100" style="width:${tf:getInscription(module.inscriptions,username).niveauAvancement}%">${tf:getInscription(module.inscriptions,username).niveauAvancement}%</div>
							 	</div>
						 	
		        	</div>
		        </a> 
		        
		         		
		      </h4>
		    </div>
		    
		    
		    <div id="${module.id}" class="panel-collapse collapse">
		    
		      <div class="panel-body">
		      
		      	<span> Ici la description du module, vous pouvez meme penser a integrer la liste des chapitres ici !</span>
		      	
			    <c:if test="${tf:isInscrit(module.inscriptions,username)}">
			      	<br>
			      	<br>
			      	
			      	<h4>LES CHAPITRES:</h4>
			      		 <div class="list-group">
			      		 
			      		 	  <c:forEach items="${module.chapitres}" var="chapitre">
			      		 	  	<c:set var="isValide" value="${tf:validationChapitre(chapitre,username)}"/>
			      		 	  	<c:choose>
    								<c:when test="${isValide==1}">
       									<a data-toggle="modal" href="#${chapitre.id}" class="list-group-item justify-content-between list-group-item-success">
							  				<div class="col-md-11">
							  					${chapitre.titre}
							  				</div>
							  				<span class="btn  glyphicon glyphicon-ok" style="display: inline;"></span>
							  			</a>
    								</c:when>
    								<c:when test="${isValide==2}">
       									<a data-toggle="modal" href="#${chapitre.id}" class="list-group-item justify-content-between">
							  				<div class="col-md-11">
							  					${chapitre.titre}
							  				</div>
							  				<span class="btn  glyphicon glyphicon glyphicon-play-circle" style="display: inline;"></span>
							  			</a>
    								</c:when>
    								<c:when test="${isValide==3}">
       									<li  class="list-group-item justify-content-between list-group-item-danger">
							  				<div class="col-md-11">
							  					${chapitre.titre}
							  				</div>
							  				<span class="btn  glyphicon glyphicon-remove" style="display: inline;"></span>
							  			</li>
    								</c:when>
   
								    <c:otherwise>
								       There is a problem in had l9lawi
								    </c:otherwise>
								</c:choose>
			      		 	  

							  	<!-- Modal -->
							  	<c:choose>
							  		<c:when test="${isValide==3}">
										
									</c:when>
									<c:otherwise>
										<div class="modal fade" id="${chapitre.id}" tabindex="-1" role="dialog" aria-labelledby="${chapitre.id}">
										  <div class="modal-dialog" role="document">
										    <div class="modal-content">
										      <div class="modal-header">
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										        <h4 class="modal-title" id="${chapitre.id}"><strong>${module.titre}:</strong> ${chapitre.titre}</h4>
										      </div>
										      <div class="modal-body">
										        ${chapitre.text}
										      </div>
										      <div class="modal-footer">
										      	<c:if test="${isValide==2}">								      	
										        	<a class="btn btn-primary" href="etudiantServlet?page=q&chap_id=${chapitre.id}" >Examinez-vous</a>
										        </c:if>
										        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										      </div>
										    </div>
										  </div>
										</div>
									</c:otherwise>
								</c:choose>
							  	
							  </c:forEach>
	
						 </div>
		      	
		      		</c:if> 
		      	
		      	</div>
		      
		      
	      		<div class="panel-footer">
	      			<span style="color: green">Inscrit le  ${tf:getInscription(module.inscriptions,username).dataInscription}</span>        
	      		</div>
		    </div>
		    
		  </div>				      
		</c:if> 
		  
		</c:forEach>	    					  
	</div> 
</div>
<%
	break;
	case "q":
%>
<div  class="col-md-6 col-md-offset-3 ">
	<h2>Controle | QCM</h2>
	<br>
	<h4><strong>${chapitre.module.titre}:</strong> ${chapitre.titre}</h4>
	<br>
	<br>
	<form action="etudiantServlet" method="get">
	
	<c:forEach items="${listQuestionsQCM}" var="question">
	
		<div class="panel panel-default">
        	<div class="panel-heading">
            	<a href="#" >${question.getEnonce()}</a>
            	<div class="btn-group" style="float:right;">
            		<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            			<span class="glyphicon glyphicon-cog"></span>
            			<span class="sr-only">Toggle Dropdown</span>
            		</button>
            		<ul class="dropdown-menu">
            			<li><a href="#"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Edit</a></li>
            			<li role="separator" class="divider"></li>
            			<li><a href="#"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span> Delete</a></li>
            		</ul>
            	</div>
            	<div class="clearfix"></div>
       		</div>
        	<div class="panel-body">
            	<div class="media">
                	<div class="media-body">
                	<h6 class="media-heading">Indication</h6>
                	<% int i=0; %>
					<c:forEach items="${question.reponses}" var="reponse">
						<div class="row col-md-offset-2">
							<label class="checkbox-inline">
								<input type="checkbox" name="${question.getIdQuestion()}<%out.print(i);%>" id="${question.getIdQuestion()}<%out.print(i);%>"  value="${reponse}"> ${reponse}
							</label>
						</div>
					<%  i ++; %>
					</c:forEach>	
                	<div class="clearfix"></div>
                	<div class="btn-group" role="group" >
                    	<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-thumbs-up"></span></button>
                    	<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-thumbs-down"></span></button>
                	</div>                 
               		</div>
            	</div>
        	</div>
    	</div>
	</c:forEach>
	<input type="hidden" name="correction" value='${chapitre.id}'>
	<input type="submit" value="Submit">
	</form>
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