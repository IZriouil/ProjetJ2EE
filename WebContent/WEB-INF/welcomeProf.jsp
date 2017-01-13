<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/slick.css"/>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/slick.min.js"></script>
<title>Bienvenue...</title>
</head>
<%@ taglib prefix="tf" uri="/WEB-INF/functionsJSP.tld"%>
 <script type="text/javascript">
 	$(document).ready(function(){
	  $('.addChapitre').slick({
	  	initialSlide:0,
	    accessibility:false,
	    adaptiveHeight: true,
	    autoplay:false,
	    centerPadding: '0px',
	    dots:false,
	    arrows:false
	  });
	
	$('.startslick').click(function(e){
        e.preventDefault();
        console.log("Start Ajout...")
		$('.addChapitre').slick('slickGoTo',0);
		var list = document.getElementsByClassName("avant");
		for (var i = 0; i < list.length; i++) {
    		list[i].setAttribute("disabled", "disabled");
		}
		$('.apres').removeClass("hidden");
		$('.ajouterQuestion').addClass("hidden");

	
	})
	$('.avant').click(function(){

  			})

	$('.apres').click(function(){

		console.log("Start function apres...");
  		var currentSlide = $('.addChapitre').slick('slickCurrentSlide'); 
  		var nextSlide=currentSlide+1;
  		console.log("    "+currentSlide+" -->") 
  		if(currentSlide==0)
  		{
  			$('.addChapitre').slick('slickNext');	
  		}
  		if(currentSlide==1)
  		{
  			$('.addChapitre').slick('slickNext');
  			$('.apres').addClass("hidden");
  			$('.ajouterQuestion').removeClass("hidden");
  			 
  		}  		
	})	

	$('.ajouterQuestion').click(function(){

		var currentSlide = $('.addChapitre').slick('slickCurrentSlide'); 
  		var nextSlide=currentSlide+1;
		$('.addChapitre').slick('slickAdd','<div class="div'+currentSlide+'"></div>');
		var module_id=$('.addChapitre').prev('input').val();
		var nbr=$('input#nombreQ'+module_id).val();
		var a = parseInt(nbr); 
		a++
		console.log(a);
		$('input#nombreQ'+module_id).val(a);
		console.log($('input#nombreQ'+module_id).val());
		var id=module_id.concat(currentSlide);
		$('.div'+currentSlide).append('<div  class="form-group form-group-lg">	<label class="col-sm-2 control-label" for="formGroupInputLarge">Question</label>		<div class="col-sm-9">  		<input class="form-control" type="text"  name="titre_'+id+'" id="titre" placeholder="Question">	</div></div><div  class="form-group form-group-sm">    <label class="col-sm-2 control-label">Reponse: </label>    <div class="col-sm-8">      <div class="form-group form-group-lg checkbox" style = "margin-left : 1cm" >	     <input type="checkbox" name = "reponse 1c_'+id+'"  style = "margin-top : 0.5cm">	     <input class="form-control input-sm" name = "reponse 1_'+id+'" type="text" placeholder="reponse 1">      </div>      <div class="form-group form-group-lg checkbox" style = "margin-left : 1cm" >	     <input type="checkbox" name = "reponse 2c_'+id+'"  style = "margin-top : 0.5cm">	     <input class="form-control input-sm" name = "reponse 2_'+id+'" type="text" placeholder="reponse 2">      </div>      <div class="form-group form-group-lg checkbox" style = "margin-left : 1cm" >	     <input type="checkbox" name = "reponse 3c_'+id+'"  style = "margin-top : 0.5cm">	     <input class="form-control input-sm" name = "reponse 3_'+id+'" type="text" placeholder="reponse 3">      </div>      <div class="form-group form-group-lg checkbox" style = "margin-left : 1cm" >	     <input type="checkbox" name = "reponse 4c_'+id+'"  style = "margin-top : 0.5cm">	     <input class="form-control input-sm" name = "reponse 4_'+id+'" type="text" placeholder="reponse 4">      </div>         </div>     </div>');
		$('.addChapitre').slick('slickNext');

	})

	});
</script> 
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
<h2>LES MODULES:</h2>
	 <div class="panel-group" id="accordion">
	  <c:forEach items="${modules}" var="module" varStatus="loop">
	  	<c:if test="${tf:profOwner(module,username)}">
			  <div class="panel panel-default">
			    <div class="panel-heading" >
			      <h4 class="panel-title">
			      
			        <a data-toggle="collapse" data-parent="#accordion" href="#${module.id}">
			        	<div class="row" style="margin-right: 3px">
			        		<div class="col-md-8">
			        			${module.titre} <small>- par Mr. ${module.prof.id}	</small>
			        		</div>
			        	</div>
			        </a> 
			        
			         		
			      </h4>
			    </div>
			    
			    
			    <div id="${module.id}" class="panel-collapse collapse">
			    
			      <div class="panel-body">
			      
			      	<span> Ici la description du module, vous pouvez meme penser a integrer la liste des chapitres ici !</span>
			      	
			      	<br>
			      	<br>
			      	
			      	<h4>LES CHAPITRES:</h4>

			      		 
     					 	


    					<div class="panel panel-success">

    						<div class="panel-body" style="padding: 0px;">
					      		 <div class="list-group" style="margin-bottom: 0px;">
					      		 
					      		 	  <c:forEach items="${module.chapitres}" var="chapitre">
					      		 	  
					      		 	  	<a data-toggle="modal" href="#${chapitre.id}" class="list-group-item justify-content-between">
									  		<div class="col-md-11">
									  				${chapitre.titre}
									  		</div>
									  		<span class="btn  glyphicon glyphicon-remove" style="display: inline;"></span>
									  	</a>
									  	
									  	
									  	<!-- Modal -->
							  			<div class="modal fade " id="${chapitre.id}" tabindex="-1" role="dialog" aria-labelledby="${chapitre.id}">
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
										      									      	
										        <a class="btn btn-primary" href="etudiantServlet?page=q&chap_id=${chapitre.id}" >Examinez-vous</a>
										        
										        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										      </div>
										    </div>
										  </div>
										</div>
					      		 	  
					      		 	  
					      		 	  </c:forEach>
					      		 	  
					      		 	  	 	  
					      		 </div>
					      	</div>

					      	<div class="panel-heading" style="padding: 0px">

					      		<a  data-toggle="modal" href="#ajouter${module.id}" class="btn btn-success btn-block startslick" ><span class="glyphicon glyphicon-plus-sign" style="display: inline;"></span></a>

					      		<!-- Modal for adding Chapitre -->
			      		 		<div class="modal fade " id="ajouter${module.id}" tabindex="-1" role="dialog" aria-labelledby="ajouter">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								    	<form method="post"  class="form-horizontal" action ="AjoutChapitre">

									      <div class="modal-header">
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									        <h4 class="modal-title" id="ajouter"><strong>${module.titre}</strong> | Ajouter un chapitre</h4>
									      </div>

									      <div class="modal-body">
									      			<input type="text" class="hidden" value="${module.id}">
													<div class="addChapitre">
														<div>
															<div class="form-group form-group-lg">
															    <label class="col-sm-2 control-label" for="titre${module.id}">Titre Chapitre</label>

															    <div class="col-sm-9">
															      <input class="form-control" type="text"  name="titre${module.id}" id="titre${module.id}" placeholder="Titre Chapitre">
															    </div>
															</div>

														  	<div class="form-group form-group-sm">

														    	<label class="col-sm-2 control-label" for="texte${module.id}">Chapitre</label>

															    <div class="col-sm-9">
															      <textarea class="form-control"  name="texte${module.id}" id="texte${module.id}" placeholder="chapitre" rows="5" ></textarea>
															    </div>
														     	
														  	</div>
														  	<br>
										      				<br>
														</div>

														
														
														<div>

														  	<div class="form-group form-group-sm">
															    <label class="col-sm-2 control-label" for="formGroupInputSmall">Transition</label>
															    
															</div>

															<div class="form-group form-group-sm">
															    <label class="col-sm-2 control-label" for="scoreQ${module.id}">Score Minimum</label>
															    <div class="col-sm-5">
															      <input class="form-control" type="text" id="scoreQ${module.id}" name="scoreQ${module.id}" placeholder="Score Minimum">
															 	</div>
															
															</div>

															<div class="col-md-offset-2">
														      	<label>
										                 			<input name="afficherScore${module.id}" type="checkbox"> Afficher score
										                 		</label>
											                </div>

														</div>



													  	<div>
													  		<!-- attention loop -->
													  		<div  class="form-group form-group-lg">
														    	<label class="col-sm-2 control-label" for="formGroupInputLarge">Question</label>
														    	
														    	<div class="col-sm-9">
														      		<input class="form-control" type="text"  name="titre_${module.id}1" id="titre" placeholder="Question">
														    	</div>
														    </div>

														    <div  class="form-group form-group-sm">

															    <label class="col-sm-2 control-label">Reponses: </label>

															    <div class="col-sm-8">
															      <div class="form-group form-group-lg checkbox" style = "margin-left : 1cm" >
																     <input type="checkbox" name = "reponse 1c_"  style = "margin-top : 0.5cm">
																     <input class="form-control input-sm" name = "reponse 1_${module.id}1" type="text" placeholder="reponse 1">
															      </div>
															      <div class="form-group form-group-lg checkbox" style = "margin-left : 1cm" >
																     <input type="checkbox" name = "reponse 2c_"  style = "margin-top : 0.5cm">
																     <input class="form-control input-sm" name = "reponse 2_${module.id}1" type="text" placeholder="reponse 2">
															      </div>
															      <div class="form-group form-group-lg checkbox" style = "margin-left : 1cm" >
																     <input type="checkbox" name = "reponse 3c_"  style = "margin-top : 0.5cm">
																     <input class="form-control input-sm" name = "reponse 3_${module.id}1" type="text" placeholder="reponse 3">
															      </div>
															      <div class="form-group form-group-lg checkbox" style = "margin-left : 1cm" >
																     <input type="checkbox" name = "reponse 4c_"  style = "margin-top : 0.5cm">
																     <input class="form-control input-sm" name = "reponse 4_${module.id}1" type="text" placeholder="reponse 4">
															      </div>     
															    </div>
															     
															  </div>
													  	</div>

													  	

										      		</div>
										      		<button type="hidden" class="hidden avant btn btn-primary">Previous</button>
										      		<button type="button" class="apres btn btn-primary">Next</button>
										      		<button type="button" class="ajouterQuestion btn btn-danger hidden">Ajouter <span class="glyphicon glyphicon-plus-sign" style="display: inline;"></button>
									      		
									      </div>

									      <div class="modal-footer">
									      	<input type='hidden' name="nombreQ${module.id}" id="nombreQ${module.id}" value="1">
									      	<button name="form${loop.count}" type="submit" class="btn btn-primary" >Valider*</button>
									        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>

									      </div>

								    	</form>

								    </div>
								  </div>
								</div>

					      	</div>

			      		</div>
			      		<br>
			      		<br>

			      		<!-- //LIST etudiant -->
			      		<a role="button" data-toggle="collapse" href="#list${module.id}" aria-expanded="false" aria-controls="list${module.id}">
						  <h5>Etudiants inscrits:</h5>
						</a>
						
						<div class="collapse" id="list${module.id}">
						  <div class="well">
						  
						    <c:forEach items="${module.inscriptions}" var="inscription">
						    
						    	<div class="row justify-content-between">
						    	
						    		<div class="col-md-3">
						    			<strong>${inscription.etudiant.id}</strong>
						    		</div>
						    		
						    		<div class="col-md-3">
						    			inscrit le ${inscription.dataInscription}
						    		</div>
						    		
						    		<div class="col-md-4">
						    			<div class="progress" style="margin-bottom: 0px;background-color:#b1b1b1;">
			  								<div class="progress-bar" role="progressbar" aria-valuenow="${tf:getInscription(module.inscriptions,username).niveauAvancement}" aria-valuemin="0" aria-valuemax="100" style="width:${tf:getInscription(module.inscriptions,inscription.etudiant.id).niveauAvancement}%">${tf:getInscription(module.inscriptions,inscription.etudiant.id).niveauAvancement}%</div>
									 	</div>					    			
						    		</div>
							
									
									
									<a data-toggle="modal" href="#${inscription.etudiant.id}" data-target=".bs-example-modal-lg" class="btn btn-default justify-content-between">
								  		
								  		Details
								  		
								  		<span class="btn  glyphicon glyphicon-list-alt" style="display: inline;"></span>
								  	</a>

								  	<div class="modal fade bs-example-modal-lg" id="${inscription.etudiant.id}" tabindex="-1" role="dialog" aria-labelledby="${inscription.etudiant.id}">
									  <div class="modal-dialog modal-lg" role="document">
									    <div class="modal-content">
									      <div class="modal-header">
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									        <h5 class="modal-title" id="${chapitre.id}"><strong>${inscription.etudiant.id}:</strong></h5>
									      </div>
									      <div class="modal-body">
									      <span ><h5>Niveau d'avancement: </h5> </span>
									      <div class="progress" style="margin-bottom: 0px;background-color:#b1b1b1;">
			  								<div class="progress-bar" role="progressbar" aria-valuenow="${tf:getInscription(module.inscriptions,username).niveauAvancement}" aria-valuemin="0" aria-valuemax="100" style="width:${tf:getInscription(module.inscriptions,inscription.etudiant.id).niveauAvancement}%">${tf:getInscription(module.inscriptions,inscription.etudiant.id).niveauAvancement}%</div>
									 	  </div>
									 	  <br>
									      	<h4>LES CHAPITRES:</h4>
									      		 <div class="list-group">
					      		 	  				<li class="list-group-item justify-content-between list-group-item-primary">
									  				<div class="col-md-4">
									  					Titre chapitre
									  				</div>
									  				<div class="col-md-4">
									  					Date validation
									  				</div>
									  				<div class="col-md-3">
									  					Score/NbEssaie	
									  				</div>
									  				<span class="btn  glyphicon glyphicon-tags" style="display: inline;"></span>
									  				
									  				</li>
									      		 	  <c:forEach items="${module.chapitres}" var="chapitre">
									      		 	  	<c:set var="isValide" value="${tf:validationChapitre(chapitre,inscription.etudiant.id)}"/>
									      		 	  	<c:choose>
															<c:when test="${isValide==1}">
																	<c:set var="validation" value="${tf:getValidation(chapitre,inscription.etudiant.id)}"/>
																	<li class="list-group-item justify-content-between list-group-item-success">
													  				<div class="col-md-4">
													  					${chapitre.titre}
													  				</div>
													  				<div class="col-md-4">
													  					${validation.dateValidation}
													  				</div>
													  				<div class="col-md-3">
													  					${validation.score_validation}/${chapitre.controle.nombreQuestion} et ${validation.nbEssai}	tentatives
													  				</div>
													  				<span class="btn  glyphicon glyphicon-ok" style="display: inline;"></span>
													  				</li>
															</c:when>
															<c:when test="${isValide==2}">
																	<c:set var="validation" value="${tf:getValidation(chapitre,inscription.etudiant.id)}"/>
																	<li class="list-group-item justify-content-between">
													  				<div class="col-md-4">
													  					${chapitre.titre}
													  				</div>
													  				<div class="col-md-4">
													  					en cours...
													  				</div>
													  				<div class="col-md-3">
													  					${validation.nbEssai} tentatives
													  				</div>
													  				<span class="btn  glyphicon glyphicon glyphicon-play-circle" style="display: inline;"></span>
													  				</li>
															</c:when>
															<c:when test="${isValide==3}">
																	<li  class="list-group-item justify-content-between list-group-item-danger">
													  				<div class="col-md-4">
													  					${chapitre.titre}
													  				</div>
													  				<div class="col-md-7">
													  					En attente de validation...
													  				</div>
													  				<span class="btn  glyphicon glyphicon-remove" style="display: inline;"></span>
													  				</li>
															</c:when>

														    <c:otherwise>
														       There is a problem in had l9lawi
														    </c:otherwise>
														</c:choose>
									      		 	  

													  	
													  	
													  </c:forEach>

												</div>
  
									      </div>
									      <div class="modal-footer">
									      	<span style="color: green"><strong >Inscrit le: ${inscription.dataInscription}  </strong> </span>
									        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									      </div>
									    </div>
									  </div>
									</div>
									  	
									  							
									
						    
						    	
						    	</div>	
						    
						    </c:forEach>
						  </div>
						</div>
			      		
			      		
			      		
			      </div>
			      
			    </div>
			  </div>  
		</c:if>
	</c:forEach>
	</div>
</div>	 
<% break;
	default:
%>
<jsp:forward page="welcomeProf?page=h" />
<%
		break;
	}
%>





</body>
</html>