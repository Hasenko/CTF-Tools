<?php
/*************************
Securité 1
-------------
Falsification de formulaires
*************************/
$date = md5('SeL'.date("Y-m-d h:i:00 "));

$formulaire = <<<EOT
<p>Formulaire pirate</p>
<form action="http://localhost:8888/ig2/securite/securite1_traite_formulaire_POST_securise_DATE.php" method="POST">
	<select name="sexe">
		<option value="enorme">enorme</option>
		<option value="petit">petit</option>
		<option value="homme">homme</option>
		<option value="jaune">jaune</option>
		<option value="inexistant">inexistant</option>
	</select>
	<input type="hidden" name="date" value="{$date}" />
	<input type="submit" value="valider"/>
</form>

EOT;

echo $formulaire;