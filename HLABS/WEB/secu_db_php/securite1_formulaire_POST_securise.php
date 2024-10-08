<?php
/*************************
Securité 1
-------------
Falsification de formulaires
*************************/
?>
<p>Formulaire pirate</p>
<form action="http://localhost:8888/ig2/securite/securite1_traite_formulaire_POST_securise.php" method="POST">
	<select name="sexe">
		<option value="enorme">enorme</option>
		<option value="petit">petit</option>
		<option value="homme">homme</option>
		<option value="jaune">jaune</option>
		<option value="inexistant">inexistant</option>
	</select>
	<input type="submit" value="valider"/>
</form>