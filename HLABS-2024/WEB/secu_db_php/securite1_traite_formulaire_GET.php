<?php
/*************************
Securité 1
-------------
Falsification de formulaires
*************************/
if(isset($_GET['sexe']))
{
	echo 'votre sexe est : '.$_GET['sexe'].'<br/>';
}
?>