<?php
/*************************
Securité 1
-------------
Falsification de formulaires
*************************/

$formulaire = <<<EOF
<p>Formulaire original</p>
<form action="http://localhost:8888/ig2/securite/securite1_traite_formulaire_POST.php" method="POST">
	<select name="sexe">
		<option value="H">Homme</option>
		<option value="F">Femme</option>
	</select>
	<input type="submit" value="valider"/>
</form>
EOF;

echo $formulaire;
?>