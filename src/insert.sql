INSERT INTO Utilisateur (type,id,mdp) VALUES ('Admin','admin', 'admin');
INSERT INTO Utilisateur (type,id,mdp) VALUES ('Etud','Issam', 'sa');
INSERT INTO Utilisateur (type,id,mdp) VALUES ('Prof','Ben', 'sa');
INSERT INTO Utilisateur (type,id,mdp) VALUES ('Prof','Moha', 'sa');
INSERT INTO Utilisateur (type,id,mdp) VALUES ('Prof','sdba', 'sdba');
INSERT INTO Module (id,titre,prof_id) VALUES ('12','Java', 'Ben');
INSERT INTO Module (id,titre,prof_id) VALUES ('13','SWIFT', 'Ben');
INSERT INTO Module (id,titre,prof_id) VALUES ('14','l9wada', 'Moha');
INSERT INTO Module (id,titre,prof_id) VALUES ('4','Beans', 'Moha');
INSERT INTO INSCRIPTION  VALUES ('12-12-2015','33', '12','Issam');
INSERT INTO INSCRIPTION  VALUES ('12-08-2017','37', '4','Issam');
INSERT INTO QCM(id,AFFICHERSCORE,minscore,nombreQuestion)  VALUES ('40','true', '12','2');
INSERT INTO QCM(id,AFFICHERSCORE,minscore,nombreQuestion)  VALUES ('50','true', '12','2');
INSERT INTO CHAPITRE (id,titre,text,controle_id,module_id)  VALUES ('20','heritage java', 'contenu chapitre...','40','12');
INSERT INTO CHAPITRE  (id,titre,text,controle_id,module_id)  VALUES ('30','interfaces', 'contenu chapitre...contenu   is simply dummy text of the printing and typesetting industry industry chapitre...contenu chapitre...contenu chapitre...contenu chapitre...contenu chapitre...contenu chapitre...contenu chapitre...','50','12');
//Question

//question 100
//qyestion 1001
//Question Issam2211 quimarque
INSERT INTO Question  VALUES ('100', 'en quelle annngage java ?','40');
INSERT INTO QUESTION_REPONSES VALUES ('100', 'en 1993');
INSERT INTO QUESTION_REPONSES VALUES ('100', 'en 1995');
INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('100', 'en 1995');
//question 200

INSERT INTO Question  VALUES ('200', 'Java est un langage ?','40');
INSERT INTO QUESTION_REPONSES VALUES ('200', 'compil');
INSERT INTO QUESTION_REPONSES VALUES ('200', 'int');
INSERT INTO QUESTION_REPONSES VALUES ('200', 'ni compi');

INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('200', 'int');
INSERT INTO QUESTION_REPONSESJUSTE  VALUES ('200', 'compil');

  
