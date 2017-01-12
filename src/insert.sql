
INSERT INTO Utilisateur (type,id,mdp) VALUES ('Prof','prof', 'prof');
INSERT INTO Utilisateur (type,id,mdp) VALUES ('Admin','admin', 'admin');
INSERT INTO Utilisateur (type,id,mdp) VALUES ('Etud','etudiant', 'etudiant');

--""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
INSERT INTO Module (id,titre,prof_id) VALUES ('1','Java', 'prof');
	--QCM
	INSERT INTO QCM(id,AFFICHERSCORE,minscore,nombreQuestion)  VALUES ('100','true', '5','10');

	INSERT INTO CHAPITRE (id,titre,text,controle_id,module_id)  VALUES ('10','Heritage Java','lun des mecanismes les plus puissants de la programmation orientee objet permet de reprendre des membres dune classe mere dans une autre classe fille.','100','1');
		
	INSERT INTO VALIDATION ( CONTROLE_ID , DATEVALIDATION , NBESSAI , SCORE_VALIDATION, ETUDIANT_ID  ) VALUES ( '100',' ','0','0','etudiant')


		--Les Question du QCM 100
		--Question 100
		INSERT INTO Question  VALUES ('1000', 'en quelle annee ngage java ?','100');
		INSERT INTO QUESTION_REPONSES VALUES ('1000', '1993');
		INSERT INTO QUESTION_REPONSES VALUES ('1000', '1995');
		INSERT INTO QUESTION_REPONSES VALUES ('1000', '1997');
		INSERT INTO QUESTION_REPONSES VALUES ('1000', '1992');
		INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('1000', '1995');
		
		--Question 10001 du QCM 100 
		INSERT INTO Question  VALUES ('1001', 'La liaison tardive est essentielle pour assurer?','100');
		INSERT INTO QUESTION_REPONSES VALUES ('1001', 'Lencapsulation');
		INSERT INTO QUESTION_REPONSES VALUES ('1001', 'polymorphisme');
		INSERT INTO QUESTION_REPONSES VALUES ('1001', 'Lheritage');
		INSERT INTO QUESTION_REPONSES VALUES ('1001', 'La marginalisation');
		INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('1001', 'polymorphisme');	
		
		--Question 10002 du QCM 100 
		INSERT INTO Question  VALUES ('1002', 'Java est un langage developpe par?','100');
		INSERT INTO QUESTION_REPONSES VALUES ('1002', 'Hewlett-Packard');
		INSERT INTO QUESTION_REPONSES VALUES ('1002', 'Sun Microsystems');
		INSERT INTO QUESTION_REPONSES VALUES ('1002', 'Microsoft');
		INSERT INTO QUESTION_REPONSES VALUES ('1002', 'Oracle');
		INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('1002', 'Sun Microsystems');
		
		--Question 10003 du QCM 100 
		INSERT INTO Question  VALUES ('1003', 'Quelle nouveaute de Java 7 vous permet de simplifier votre redefinition des methodes equals() et hashCode() ?','100');
		INSERT INTO QUESTION_REPONSES VALUES ('1003', 'La classe java.util.Objects');
		INSERT INTO QUESTION_REPONSES VALUES ('1003', 'La classe java.util.Object');
		INSERT INTO QUESTION_REPONSES VALUES ('1003', 'La classe java.util.Equals et java.util.Hashcode');
		INSERT INTO QUESTION_REPONSES VALUES ('1003', 'La classe java.util.Comparable');
		INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('1003', 'La classe java.util.Comparable');
		
		--Question 10004 du QCM 100 
		INSERT INTO Question  VALUES ('1004', 'De combien de classes une classe fille peut-elle heriter ?','100');
		INSERT INTO QUESTION_REPONSES VALUES ('1004', '1');
		INSERT INTO QUESTION_REPONSES VALUES ('1004', '2');
		INSERT INTO QUESTION_REPONSES VALUES ('1004', '3');
		INSERT INTO QUESTION_REPONSES VALUES ('1004', '4');
		INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('1004', '1');
		
		--Question 1005 du QCM 100 
		INSERT INTO Question  VALUES ('1005', 'Qu’est-ce quun package ?','100');
		INSERT INTO QUESTION_REPONSES VALUES ('1005', 'Cest un endroit ou ranger nos classes.');
		INSERT INTO QUESTION_REPONSES VALUES ('1005', 'Cest une classe du langage Java.');
		INSERT INTO QUESTION_REPONSES VALUES ('1005', 'Cest un conteneur permettant dexecuter du code Java.');
		INSERT INTO QUESTION_REPONSES VALUES ('1005', 'Cest une classe du langage Java permettant de creer plusieurs objets a linterieur.');
		INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('1005', 'Cest un endroit ou ranger nos classes.');
			--Question 10006 du QCM 100 
		INSERT INTO Question  VALUES ('1006', 'Quest-ce qu’une classe abstraite ?','100');
		INSERT INTO QUESTION_REPONSES VALUES ('1006', 'une classe declaree avec le mot-cle abstract, ne pouvant pas etre instanciee et pouvant contenir des methodes abstraites donc sans corps de methode');
		INSERT INTO QUESTION_REPONSES VALUES ('1006', 'une classe ne pouvant pas être heritee.');
		INSERT INTO QUESTION_REPONSES VALUES ('1006', 'une classe ne pouvant pas avoir de constructeur.');
		INSERT INTO QUESTION_REPONSES VALUES ('1006', 'une classe du langage Java permettant de creer plusieurs objets en son sein.');
		INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('1006', 'une classe declaree avec le mot-cle abstract, ne pouvant pas etre instanciee et pouvant contenir des methodes abstraites donc sans corps de methode');
		
		INSERT INTO Question  VALUES ('1007', 'Avec quel mot-cle peut-on restreindre l’etendue d’une variable, d’une methode ou dune classe ?','100');
		INSERT INTO QUESTION_REPONSES VALUES ('1007', 'new');
		INSERT INTO QUESTION_REPONSES VALUES ('1007', 'public');
		INSERT INTO QUESTION_REPONSES VALUES ('1007', 'private');
		INSERT INTO QUESTION_REPONSES VALUES ('1007', 'this');
		INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('1007', 'private');
		--Question 1008 du QCM 100 
		INSERT INTO Question  VALUES ('1008', 'Quel mot-cle doit-on utiliser pour instancier un objet ?','100');
		INSERT INTO QUESTION_REPONSES VALUES ('1008', 'new');
		INSERT INTO QUESTION_REPONSES VALUES ('1008', 'this');
		INSERT INTO QUESTION_REPONSES VALUES ('1008', 'public');
		INSERT INTO QUESTION_REPONSES VALUES ('1008', 'class');
		INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('1008', 'new');
		
		--question 1009 du QCM 100 
		INSERT INTO Question  VALUES ('1009', 'Java est un langage ?','100');
		INSERT INTO QUESTION_REPONSES VALUES ('1009', 'compil');
		INSERT INTO QUESTION_REPONSES VALUES ('1009', 'interprete');
		INSERT INTO QUESTION_REPONSES VALUES ('1009', 'ni compil ni interprete');
		INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('1009', 'interprete');
		INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('1009', 'compil');


		-----------------------------------------------------------------------------------------------------------
--Module Java Chapitre Collection
	INSERT INTO QCM(id,AFFICHERSCORE,minscore,nombreQuestion)  VALUES ('200','true', '2','3');
	INSERT INTO CHAPITRE (id,titre,text,controle_id,module_id)  VALUES ('20','Les collections', 'contenu chapitre collection en Java ...','200','1');


		--Les Question du QCM 100
		--Question 2000
		INSERT INTO Question  VALUES ('2000', 'Qu’offre Java avec les interfaces java.util.Collection et java.util.Map ? ','200');
		INSERT INTO QUESTION_REPONSES VALUES ('2000', 'Les interfaces dont heritent les collections presentes.');
		INSERT INTO QUESTION_REPONSES VALUES ('2000', 'Rien, ces interfaces n’existent pas.');
		INSERT INTO QUESTION_REPONSES VALUES ('2000', 'Rien, ce ne sont pas des interfaces mais des classes.');
		INSERT INTO QUESTION_REPONSES VALUES ('2000', 'Rien, ces interfaces nont pas dimplementation.');
		INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('2000', 'Les interfaces dont heritent les collections presentes.');
		
		---Question 10001 du QCM 2001 
		INSERT INTO Question  VALUES ('2001', 'A quel indice commence le compte dans les List ?','200');
		INSERT INTO QUESTION_REPONSES VALUES ('2001', '0');
		INSERT INTO QUESTION_REPONSES VALUES ('2001', '1');
		INSERT INTO QUESTION_REPONSES VALUES ('2001', '2');
		INSERT INTO QUESTION_REPONSES VALUES ('2001', '3');
		INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('2001', '0');	
		
		--Question 2002 du QCM 200 
		INSERT INTO Question  VALUES ('2002', 'Quil est le type de collection le plus optimal pour les operations de recherche?','200');
		INSERT INTO QUESTION_REPONSES VALUES ('2002', 'ArrayList ');
		INSERT INTO QUESTION_REPONSES VALUES ('2002', 'Hash map');
		INSERT INTO QUESTION_REPONSES VALUES ('2002', 'Vector');
		INSERT INTO QUESTION_REPONSES VALUES ('2002', 'Hashset');
		INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('2002', 'Hash map');



		-----------------------------------------------------------------------------------------------------------
--Module Java Chapitre Swing
	INSERT INTO QCM(id,AFFICHERSCORE,minscore,nombreQuestion)  VALUES ('300','true', '2','0');
	INSERT INTO CHAPITRE (id,titre,text,controle_id,module_id)  VALUES ('30','Swing', 'contenu chapitre...3','300','1');
	

	--MODULE Cryptographie
	--""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
INSERT INTO Module (id,titre,prof_id) VALUES ('2','Cryptographie', 'prof');


--Module Cryptographie Chapitre Chiffrement symetrique
	INSERT INTO QCM(id,AFFICHERSCORE,minscore,nombreQuestion)  VALUES ('400','true', '2','0');
	INSERT INTO CHAPITRE (id,titre,text,controle_id,module_id)  VALUES ('40','Chiffrement symetrique', 'contenu chapitre chiffrement symetrique ...','400','2');
	INSERT INTO VALIDATION ( CONTROLE_ID , DATEVALIDATION , NBESSAI , SCORE_VALIDATION, ETUDIANT_ID  ) VALUES ( '400',' ','0','0','etudiant')


	--Les Question du QCM 100
		--Question 2000
		INSERT INTO Question  VALUES ('4000', 'Quelle est la principale limite du chiffrement symetrique ?','400');
		INSERT INTO QUESTION_REPONSES VALUES ('4000', 'Le chiffrement et le dechiffrement des messages sont beaucoup trop lents');
		INSERT INTO QUESTION_REPONSES VALUES ('4000', 'La transmission de la cle au(x) destinataire(s) est risquee');
		INSERT INTO QUESTION_REPONSES VALUES ('4000', 'Il faut des cles differentes pour chiffrer et dechiffrer');
		INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('4000', 'Le chiffrement et le dechiffrement des messages sont beaucoup trop lents');
		
		---Question 10001 du QCM 2001 
		INSERT INTO Question  VALUES ('4001', 'Que pourra-t-il se passer si quelqu un vole ma cle publique ?','400');
		INSERT INTO QUESTION_REPONSES VALUES ('4001', 'Il pourra dechiffrer les messages qui me sont destines');
		INSERT INTO QUESTION_REPONSES VALUES ('4001', 'Il pourra signer des messages en se faisant passer pour moi');
		INSERT INTO QUESTION_REPONSES VALUES ('4001', 'Il pourra menvoyer des messages chiffres');
		INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('4001', 'Il pourra menvoyer des messages chiffres');	
		
		--Question 2002 du QCM 200 
		INSERT INTO Question  VALUES ('4002', 'A quoi sert le chiffrement symetrique ?','400');
		INSERT INTO QUESTION_REPONSES VALUES ('4002', 'A verifier lorigine du message');
		INSERT INTO QUESTION_REPONSES VALUES ('4002', 'A reduire la taille du message');
		INSERT INTO QUESTION_REPONSES VALUES ('4002', 'A rendre incomprehensible le contenu du message');
		INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('4002', 'A verifier lorigine du message');
		INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('4002', 'A rendre incomprehensible le contenu du message');

		
		--Module Cryptographie Chapitre Chiffrement Asymetrique
	INSERT INTO QCM(id,AFFICHERSCORE,minscore,nombreQuestion)  VALUES ('500','true', '2','0');
	INSERT INTO CHAPITRE (id,titre,text,controle_id,module_id)  VALUES ('50','Chiffrement asymetrique', 'contenu chapitre chiffrement symetrique ...','500','2');