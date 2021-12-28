<?php
header("Content-Type: application/xls");
header("Content-Disposition: attachment; filename= archivo.xls");
/*Datos de conexion a la base de datos*/
	require_once('config.php');
	$conn=new Conexion();
	$link = $conn->conectarse();

    $query="SELECT choque.id , choque.fecha_choque , vehiculo.patente, empleado.nombre,  empleado.apellido ,
                   choque.dni_ter, choque.patente_ter, choque.poliza_ter, choque.telefono_ter, choque.fecha_carga
            FROM choque, vehiculo, empleado 
            WHERE choque.idvehiculo = vehiculo.id 
            AND choque.idempleado = empleado.id 
            ORDER BY choque.fecha_choque ASC ";

   $result=mysqli_query($link, $query);

?>
<table style='border: 1px solid black; border-collapse: collapse;'>
        <thead style='border: 1px solid black; border-collapse: collapse;'>
            <tr style='border: 1px solid black; border-collapse: collapse;'>
                <th style='background:#013ca6; color:#FFF; border: 1px solid black; border-collapse: collapse;'>#ID</th>
                <th style='background:#013ca6; color:#FFF; border: 1px solid black; border-collapse: collapse;'>Fecha Mantenimiento</th>
                <th style='background:#013ca6; color:#FFF; border: 1px solid black; border-collapse: collapse;'>Vehiculo</th>
                <th style='background:#013ca6; color:#FFF; border: 1px solid black; border-collapse: collapse;'>Nombre Empleado</th>
                <th style='background:#013ca6; color:#FFF; border: 1px solid black; border-collapse: collapse;'>Apellido Empleado</th>
                <th style='background:#013ca6; color:#FFF; border: 1px solid black; border-collapse: collapse;'>Servicio del Vehículo</th>
                <th style='background:#013ca6; color:#FFF; border: 1px solid black; border-collapse: collapse;'>Placa</th>
                <th style='background:#013ca6; color:#FFF; border: 1px solid black; border-collapse: collapse;'>Poliza</th>
                <th style='background:#013ca6; color:#FFF; border: 1px solid black; border-collapse: collapse;'>Kilometraje</th>
                <th style='background:#013ca6; color:#FFF; border: 1px solid black; border-collapse: collapse;'>Fecha Carga</th>
            </tr>
        </thead>
        <?php
           while ($row=mysqli_fetch_assoc($result)) {
             ?>
               <tr>
               	   <td style='border: 1px solid black; border-collapse: collapse;'><?php echo $row['id'];?></td>
               	   <td style='border: 1px solid black; border-collapse: collapse;'><?php echo $row['fecha_choque'];?></td>
               	   <td style='border: 1px solid black; border-collapse: collapse;'><?php echo $row['patente'];?></td>
               	   <td style='border: 1px solid black; border-collapse: collapse;'><?php echo $row['nombre'];?></td>
               	   <td style='border: 1px solid black; border-collapse: collapse;'><?php echo $row['apellido'];?></td>
               	   <td style='border: 1px solid black; border-collapse: collapse;'><?php echo $row['dni_ter'];?></td>
               	   <td style='border: 1px solid black; border-collapse: collapse;'><?php echo $row['patente_ter'];?></td>
               	   <td style='border: 1px solid black; border-collapse: collapse;'><?php echo $row['poliza_ter'];?></td>
               	   <td style='border: 1px solid black; border-collapse: collapse;'><?php echo $row['telefono_ter'];?></td>
               	   <td style='border: 1px solid black; border-collapse: collapse;'><?php echo $row['fecha_carga'];?></td>
               </tr>
 
            <?php
           }

        ?>
    </table>