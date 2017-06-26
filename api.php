<?php

//load file xml sent in http request

if(!$response = file_get_contents('php://input')){
	trigger_error('Error reading XML file',E_USER_ERROR);}

else
{
	$xml= simplexml_load_string($response );
}

try {
	//get the sending method and the server adress
	   $adresse = $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'] ;
	   $methode=$_SERVER['REQUEST_METHOD'];
	  
	   

//Connexion à la base dse données
	   $link = pg_connect("host=localhost port=5432 dbname=Donnees_Application_Mobile user=postgres password=postgres");
	  
	  
 	//$requete = "SELECT * FROM appli_personne";


	
switch($methode) {
  case "POST":
  echo "appel methode post <br>";

  	$id= $xml->id;
	$menage_id=$xml->menage_id;
	$sexe=$xml->sexe;
	$permis=$xml->permis;
	$mot_de_passe= $xml->mot_de_passe;
	$date_de_naissance=$xml->date_naissance;
	$login=$xml->login;
	$utilise_velo=$xml->utilise_velo;
	$pratique_deux_roues= $xml->pratique_deux_roues;
	$vehicule_preferentiel=$xml->vehicule_preferentiel;
	$travail_maison=$xml->travail_maison;
	$utilise_voiture=$xml->utilise_voiture;

	$login=pg_escape_string($login);
	

   //Formation de la requête 
	    $requete = "INSERT INTO appli_personne (id_personne,id_menage,code_sexe,code_frequence_usage,code_occupation,code_permis,
	    	date_de_naissance,login,mot_de_passe) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9)";
  		if($result = pg_query_params($link, $requete,array($id,$menage_id,$sexe,1,1,$permis,$date_de_naissance, $login,$mot_de_passe))) 
			{
		    	  echo 'requete BDD executee ';
				} 
		else {
				  echo "Erreur de requete de base de donnees";
					}



      break;
 
  case "UPDATE":
  echo "appel methode Post";
      break;

       case "GET":
  echo "appel methode Get ";
  

      break;

 
  default:
      header('HTTP/1.1 405 Method Not Allowed');
      header('Allow: POST,UPDATE');
      break;
  }



  	//Exécution de la requête et récupération du résultat
		


//load file

 /* 
	$javas=json_encode($xml);
	echo $javas;
	*/
	//print_r($xml);
	
	}

/*$xml = simplexml_load_file($_SERVER['REQUEST_URI']);
print_r($xml);

echo 

*/
catch (Exception $e) { //Gesetion du message d'exception
	echo 'Exception reçue : ',  $e->getMessage(), "\n";
}



 ?>