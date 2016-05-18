<?php
include 'config.php';

$sql = "select	o.id as ofertaid, 
				o.nombre as ofertanombre, 
        		o.descripcion as ofertadescripcion,
        		o.nombre_imagen as ofertaimagen, 
        		e.nombre as empresanombre 
		from tbl_ofertas o 
		inner join tbl_empresas e on o.tbl_empresa_id=e.id 
		where o.estado_activa=1 
		order by o.id desc 
		limit 15 offset 0";

try {
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $dbh->query($sql);  
	$ultofertas = $stmt->fetchAll(PDO::FETCH_OBJ);
	$dbh = null;
	echo '{"items":'. json_encode($ultofertas) .'}'; 
} catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}'; 
}


?>