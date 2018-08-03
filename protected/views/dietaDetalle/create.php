<?php
$this->breadcrumbs=array(
	'Dieta Detalles'=>array('index'),
	'Create',
);

$this->menu=array(
//	array('label'=>'List DietaDetalle','url'=>array('index')),
//	array('label'=>'Manage DietaDetalle','url'=>array('admin')),
);
?>

<?php
//$dieta= Vistadetalle::model()->find('id='.$_GET['id']);
//echo "<pre>"; print_r($dieta); exit;
//$fecha=date('d-m-Y',strtotime($dieta->fecha));
?>

<!-- <h1>Detalle</h1>
 -->
 <!-- <table class="table table-bordered table-hover">
    <thead>
        <tr>
            <th >Fecha</th>
            <th rowspan="4">Nombre cliente</th>
            <th >Mascota</th>
            
        </tr>
    </thead>
    <tbody>
        <tr >
         <td rowspan="4"><?php //$fecha?></td>
         <td rowspan="4"><?php //$dieta->nombre.' '.$dieta->apellido?></td>
          <td class="info"><b>Nombre</b></td>
           <td><?php //$dieta->nombre_mascota?></td>
 		<td rowspan="4">Imagen</td>         
        </tr>
          <tr class="success">
           
          <td><b>Edad</b></td>
            <td><?php //$dieta->tipo.' ('.$dieta->descripcion.')'?></td>
          
        </tr>
          <tr class="active">
         
          <td><b>Peso</b></td>
            <td><?php //$dieta->peso.' '.$dieta->medida?></td>
          
        </tr>
          <tr class="success">
         
          <td><b>Porción</b></td>
          <td><?php //$dieta->porcion?> Gr</td>
         
        </tr>
     
    </tbody>
</table>
 -->
<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>