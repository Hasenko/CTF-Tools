<?php
header('Content-type: text/html; charset=UTF-8'); // force en UTF8

echo "<a href='index.php'>retour sur index</a><br/>";

/***************
Securité 0

les dangers de 'include'
par défaut le serveur n'autorise pas de faire des include vers des fichers situés sur d'autres serveurs.
***************/

// partie affichage du menu
$menu = <<<EOT
<p>les Dangers de 'include'</p>
<ul>
	<li><a href='securite0_include.php?page=videos'>videos</a></li>
	<li><a href='securite0_include.php?page=photos'>photos</a></li>
</ul>
EOT;
echo $menu;


// partie traitement du menu : non sécurisée

echo "Mode non sécurisé<br/>";
if(isset($_GET['page']))
{
	include $_GET['page'].'.php';
}


/*
// partie traitement du menu  : sécurisé
// pages valides : 
echo "Mode sécurisé<br/>";
$pages_valides = "/^(videos|photos|defaut)$/";

if(isset($_GET['page']))
{
	$fichier_a_inclure = $_GET['page'];
	// on vérifie que le fichier à inclure est dans la zone de confiance
	if(preg_match($pages_valides,$fichier_a_inclure))
	{
		include($fichier_a_inclure).'.php';
	}
	else
	{
		include('defaut.php');
	}
}
*/

?>