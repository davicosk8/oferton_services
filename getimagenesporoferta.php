<?php
include 'config.php';
$sql = "select
			i.dir as imagendir,
			i.descripcion_imagen as imagedescripcion
		from tbl_imageofertas i
		where i.tbl_oferta_id = :ido";
try {
		$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $dbh->prepare($sql);
	$stmt->bindParam('ido', $_GET['ido']);
	$stmt->execute();
	$imagenesporid = $stmt->fetchAll(PDO::FETCH_OBJ);
	$dbh = null;
	echo '{"items":'. json_encode($imagenesporid) .'}';
} catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}';
}
?>