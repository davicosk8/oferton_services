<?php
include 'config.php';

$sql = "select * from tbl_ofertas m where m.id=:id";

try {
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $dbh->prepare($sql);  
	$stmt->bindParam('id', $_GET['id']);
	$stmt->execute();
	$oferta = $stmt->fetchObject();  
	$dbh = null;
	echo '{"item":'. json_encode($oferta) .'}'; 
} catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}'; 
}

?>