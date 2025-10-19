<?php
/**********************
Securité 2
-------------
Requetes HTTP falsifiées
**********************/

/*Methode préconstruite*/
/*
$postdata = http_build_query(
	array
	(
		'sexe'=>'trop mega drole'
	)
);

$options = array('http' =>
	array(
		'method' => 'POST',
		'header' => 'Content-type: application/x-www-form-urlencoded',
		'content' => $postdata
	)
);
$context = stream_context_create($options);
$result = file_get_contents('http://localhost:8888/ig2/securite/securite1_traite_formulaire_POST.php',false,$context);
echo $result;
*/

// Methode avec socket

header('Content-Type: text/plain');
$name = 'localhost';//nom du site
$port = 8888;
$data = 'sexe=tropdrole';
//la requête
$envoi  = "POST /ig2/securite/securite1_traite_formulaire_POST.php HTTP/1.1\r\n";
$envoi .= "Host: ".$name."\r\n";
$envoi .= "Connection: Close\r\n";
$envoi .= "Content-type: application/x-www-form-urlencoded\r\n";
$envoi .= "Content-Length: ".strlen($data)."\r\n\r\n";
$envoi .= $data."\r\n";
$socket = fsockopen($name,$port);
fputs($socket,$envoi);
while(!feof($socket))
{
	$http_response .= fgets($socket,128);
}
fclose($socket);
echo ($http_response);

?>
