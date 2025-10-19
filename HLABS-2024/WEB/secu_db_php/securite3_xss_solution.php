<?php
session_start();
/*************************
Securité 3
-------------
Cross Site Scripting (XSS)
Solution
data : <script>document.location = 'http://www.google.be'</script>
*************************/
$formulaire = <<<EOT
<p>Formulaire orignial</p>
<form action="securite3_xss_solution.php" method="GET">
	<select name="sexe">
		<option value="H">Homme</option>
		<option value="F">Femme</option>
	</select>
	<input type="submit" value="valider"/>
</form>
EOT;

/*Si le formulaire a déjà été validé alors on ne l'affiche plus
On se protège du XSS grace à 
	htmlentities() => convertit les caractères éligible en entités html
	strip_tags()	=> supprime les balises html
*/

if(isset($_GET['sexe']))
{
	$valeur_filtree = strip_tags($_GET['sexe']);	//c'est ici qu'on protège notre site !
	echo 'Votre sexe est '.$valeur_filtree;
}
else
{
	echo $formulaire;
}
?>