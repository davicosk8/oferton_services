<?php
header("Access-Control-Allow-Origin: *");
include 'config.php';
$sql = "select distinct	o.id as ofertaid, 
				o.nombre as ofertanombre, 
		        o.nombre_imagen as ofertaimagen, 
		        date_format(o.fecha_fin,'%W %d of %b - %Y') as ofertafechafin,
		        e.nombre as empresanombre,
		        e.id as empresaid from tbl_ofertas o
		join tbl_ofertas_tbl_sucursales os on o.id=os.tbl_oferta_id
		join tbl_sucursales s on os.tbl_sucursale_id=s.id
		join tbl_empresas e on s.tbl_empresa_id=e.id
		where o.estado_activa=1 and o.tbl_categoria_id= :idc
		order by o.id desc 
		limit 15 offset 0";
try {
		$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $dbh->prepare($sql);
	$stmt->bindParam('idc', $_GET['idc']);
	$stmt->execute();
	$ofertas = $stmt->fetchAll(PDO::FETCH_OBJ);
	$dbh = null;
	echo '{"items":'. json_encode($ofertas) .'}';
} catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}';
}
?>