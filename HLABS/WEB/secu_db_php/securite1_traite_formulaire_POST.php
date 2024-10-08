<?php
/*************************
Securité 1
-------------
Falsification de formulaires
*************************/
if(isset($_POST['sexe']))
{
	echo 'votre sexe est : '.$_POST['sexe'].'<br/>';
}
?>