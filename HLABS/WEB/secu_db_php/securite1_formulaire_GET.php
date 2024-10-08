<?php
/*************************
Securité 1
-------------
Falsification de formulaires
*************************/

$formulaire = <<<EOF
<p>Formulaire orignial</p>
<form action="securite1_traite_formulaire_GET.php" method="GET">
	<select name="sexe">
		<option value="H">Homme</option>
		<option value="F">Femme</option>
	</select>
	<input type="submit" value="valider"/>
</form>
EOF;

echo $formulaire;
?>