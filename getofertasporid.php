<?php
include 'config.php';

$sql = "select * from tbl_ofertas m where m.tbl_categoria_id=:id";

try {
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $dbh->prepare($sql);  
	$stmt->bindParam('id', $_GET['id']);
	$stmt->execute();
	$ofertasporid = $stmt->fetchObject();  
	$dbh = null;
	echo '{"item":'. json_encode($ofertasporid) .'}'; 
} catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}'; 
}

?>