<?php
include 'config.php';

$sql = "select 
  			s.nombre as sucursalnombre,
  			s.direccion as sucursaldireccion,
  			s.telefono1 as sucursaltelefono1,
  			s.telefono2 as sucursaltelefono2,
  			s.posX as sucursalposX,
  			s.posY as sucursalposY
FROM tbl_ofertas_tbl_sucursales os
JOIN tbl_sucursales s ON os.tbl_sucursale_id = s.id
WHERE os.tbl_oferta_id = :ide";

try {
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $dbh->prepare($sql);  
	$stmt->bindParam('ide', $_GET['ide']);
	$stmt->execute();
	$ofertasporid = $stmt->fetchAll(PDO::FETCH_OBJ);  
	$dbh = null;
	echo '{"items":'. json_encode($ofertasporid) .'}'; 
} catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}'; 
}

?>