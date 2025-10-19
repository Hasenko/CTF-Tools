<?php
/*************************
Securité 1
-------------
Falsification de formulaires
*************************/

if(isset($_POST['sexe']) AND isset($_POST['date']))
{
	if(checkDateValide($_POST['date'])==true)
	{
		$sexe = $_POST['sexe'];
		$sexes_valides = "/^(homme|femme)$/";
		if(preg_match($sexes_valides,$sexe))
		{
			echo 'votre sexe est : '.$_POST['sexe'].'<br />';
		}
		else
		{
			echo 'erreur de sexe !!<br />';
		}
	}
	else
	{
		echo 'bad date';
	}
}

function checkDateValide($_date)
{
	$validite = range(0, 10) ; 
	$valide = false ; 
	foreach($validite as $v) 
	{
		$valide |= ($_POST['date'] == md5('SeL'.date("Y-m-d h:i:00 ", time() - $v * 60));
	}
	return $validite;
}

// 
/*
• isset() pour vérifier si la variable existe avant de l’utiliser ;
• is_array() pour vérifier si la variable est un tableau ;
• is_string() pour vérifier si la variable est une chaîne ;
• s_int(), is_integer(), is_long() pour vérifier si la variable est un entier ;
• is_float(), is_real(), ou is_double() pour vérifier si la variable contient un nombre décimal ;
• is_bool() pour vérifier si la variable contient une valeur booléenne ;
• is_numeric() pour vérifier si la variable contient un nombre décimal ou entier ;
• is_scalar() pour vérifier si la variable contient une valeur scalaire : nombre, booléen, chaîne.
• is_object(), is_resource(), is_callable() et is_null()

*/
/*
• ctype_alnum() vérifie qu’une chaîne est alphanumérique.
• ctype_alpha() vérifie qu’une chaîne est alphabétique.
• ctype_cntrl() vérifie qu’un caractère est un caractère de contrôle.
• ctype_digit() vérifie qu’une chaîne est un entier.
• ctype_graph() vérifie qu’une chaîne est imprimable (hors espaces).
• ctype_lower() vérifie qu’une chaîne est en minuscules.
• ctype_print() vérifie qu’une chaîne est imprimable (y compris les espaces).
• ctype_punct() vérifie qu’une chaîne contient de la ponctuation.
• ctype_space() vérifie qu’une chaîne n’est faite que de caractères blancs (espaces).
• ctype_upper() vérifie qu’une chaîne est en majuscules.
• ctype_xdigit() vérifie qu’un caractère représente un nombre hexadécimal.
*/

/*
extension filter
$_CLEAN['email'] = filter_data($_GET['email'], FILTER_VALIDATE_EMAIL);

PEAR_Validate
ini_set('include_path',ini_get('include_path').':/usr/lib/php/'); include('/usr/lib/php/Validate/FR.php');
$v = new Validate_BE();
if ($v->postalCode('1950')) { print 'Code postal valide'; }

*/

/*
horodatage
// publication du formulaire
$date = md5('SeL'.date('Y-m-d h:i:00 ");
// test du formulaire
$validite = range(0, 10) ; 
$valide = false ; 
foreach($validite as $v) 
{
	$valide |= ($_POST['date'] == md5('SeL'.date('Y-m-d h:i:00 ", time() - $v * 60));
}
*/