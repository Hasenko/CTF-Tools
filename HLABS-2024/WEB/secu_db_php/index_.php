<?php
header('Content-type: text/html; charset=UTF-8'); 
echo "Securité Internet - Les erreurs de programmation PHP à ne pas commettre !<br/>";
echo "<ul>
		<li><a href = 'securite0_include.php'>Exemple 1 : include</a></li>
		<li><a href = 'securite1_formulaire_GET.php'>Exemple 2 : formulaires avec GET</a></li>
		<li><a href = 'securite1_formulaire_POST.php'>Exemple 2 : formulaires avec POST</a></li>
		<li><a href = 'securite1_formulaire_POST_falsifie.php'>Exemple 2 : formulaire POST faslifie</a></li>
		<li><a href = 'securite1_formulaire_POST_securise.php'>Exemple 2 : formulaire POST securisé</a></li>
		<li><a href = 'securite2_modifie_requete_http.php'>Exemple 1 : les dangers de include</a></li>
		<li><a href = 'securite3_xss.php'>Exemple 1 : les dangers de include</a></li>
		<li><a href = 'securite3_xss_solution.php'>Exemple 1 : les dangers de include</a></li>
		<li><a href = 'securite4_sql_injection_1.php'>Exemple 1 : les dangers de include</a></li>
	</ul>";


?>