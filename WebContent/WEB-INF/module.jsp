<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	String type=request.getParameter("type");%>
	<ol class="breadcrumb">
	<c:choose>
		<c:when test='${type=="Etud"}'>
		  <li><a href="etudiantServlet?page=h">Home</a></li>
		  <li><a href="etudiantServlet?page=m">Modules</a></li>
		  <li><a href="etudiantServlet?page=i">Mes inscriptions</a></li>
	   </c:when>
	   <c:otherwise>
		  <li><a href="welcomeProf?page=h">Home</a></li>
		  <li><a href="welcomeProf?page=m">Mes modules</a></li>	
       </c:otherwise>
		        	
	</c:choose>
	</ol>
	
	<div class="row">
		<div style="text-align: center" class="col-md-2 col-md-offset-10">
			<kbd>Signed in as ${sessionScope.username} <a style="color: red" href="login?logout=">Logout?</a></kbd>
		</div>
	</div>
	</br></br>	
	
	<%
	String pa=request.getParameter("page");
	switch(pa){
	case "h":
	%>
		<div class="table-responsive">
		  <table class="table"> 
			    <tr>
				  <td class="success">Titre du Chapitre</td>
				  <td class="success">Enseignant</td>
				  <td class="success">Module</td>
				  <td class="success"></td>
				  <td class="success"></td>
				  
				</tr>
				
		<c:forEach items="${chapitres}" var="chapitre">
				  <tr>
					  <td class="success">${chapitre.titre}</td>
					  <td class="success">${chapitre.module.prof.id}</td>
					  <td class="success">${chapitre.module.titre}</td>
					  <td class="success"><a href="ModuleServlet?page=lire&ch_id=${chapitre.id}" >Lire</a></td>
					  <td class="success"><a href="ModuleServlet?page=qcm&qcm_id=${chapitre.controle.id}" >QCM</a></td>	
					  
					  
				 </tr>
		</c:forEach>
			
		  </table>
		</div>
	<%
	break;
	case "lire":
	%>
	<div  class="col-md-6 col-md-offset-3 ">
	<h2>${chapitre.titre}</h2>
		<h3>${chapitre.text}</h3>
	<%
		break;
		case "qcm":
	%>
			<form action="ModuleServlet" method="get">
					<div class="table-responsive">
							  <table class="table"> 								
								<c:forEach items="${listQuestionsQCM}" var="uneQuestion">
										  <tr>
											  <td class="">${uneQuestion.getEnonce()}</td>
												  	<% int i =0; %>
												  	<c:forEach items="${uneQuestion.reponses}" var="reponse">
												  	<td class="">
												  		 <label class="checkbox-inline">
															<input type="checkbox" name="${uneQuestion.getIdQuestion()}<%out.print(i);%>"  value="${reponse}"> ${reponse} 
														 </label>													 
													</td>
													<%  i ++; %>					  						  		  
												   </c:forEach>
											  <td class=""></td>
					  								  							  						  		  
										 </tr>
								</c:forEach>
							</table>
					</div>
				<input type="submit" value="Submit">
			</form>
	
	<%
		break;
		default:
	%>
	<jsp:forward page="ModuleServlet?page=h" />
	<%
			break;
		}
	%>				
				  

</body>
</html>