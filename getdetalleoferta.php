<?php
header("Access-Control-Allow-Origin: *");
include 'config.php';

$sql = "select distinct 
			o.id AS ofertaid,
			o.nombre AS ofertanombre,
			o.nombre_imagen AS ofertaimagen,
			DATE_FORMAT(o.fecha_inicio,'%W %d of %b - %Y') AS ofertafechainicio,
			DATE_FORMAT(o.fecha_fin,'%W %d of %b - %Y') AS ofertafechafin,
			o.descripcion AS ofertadescripcion,
			e.nombre AS empresanombre,
			e.id AS empresaid
		from tbl_ofertas o
		join tbl_ofertas_tbl_sucursales os ON o.id = os.tbl_oferta_id
		join tbl_sucursales s ON os.tbl_sucursale_id = s.id
		join tbl_empresas e ON s.tbl_empresa_id = e.id
		where o.id=:id";
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