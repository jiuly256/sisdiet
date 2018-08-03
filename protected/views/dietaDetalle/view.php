<?php
$this->breadcrumbs=array(
	'Dieta Detalles'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List DietaDetalle','url'=>array('index')),
	array('label'=>'Create DietaDetalle','url'=>array('create')),
	array('label'=>'Update DietaDetalle','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete DietaDetalle','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage DietaDetalle','url'=>array('admin')),
);
?>

<!-- <h1>View DietaDetalle #<?php //echo $model->id; ?></h1> -->
<?php
$dieta= Vistadetalle::model()->find('id='.$model->id_dieta);
//echo "<pre>"; print_r($dieta); exit;
$fecha=date('d-m-Y',strtotime($dieta->fecha));
?>

<!-- <h1>Detalle</h1>
 --><table class="table table-bordered table-hover">
    <thead>
        <tr>
            <th >Fecha</th>
            <th rowspan="4">Nombre cliente</th>
            <th >Mascota</th>
            
        </tr>
    </thead>
    <tbody>
        <tr >
         <td rowspan="4"><?=$fecha?></td>
         <td rowspan="4"><?=$dieta->nombre.' '.$dieta->apellido?></td>
          <td class="info"><b>Nombre</b></td>
           <td><?=$dieta->nombre_mascota?></td>
 		<td rowspan="4">Imagen</td>         
        </tr>
          <tr class="success">
           
          <td><b>Edad</b></td>
            <td><?=$dieta->tipo.' ('.$dieta->descripcion.')'?></td>
          
        </tr>
          <tr class="active">
         
          <td><b>Peso</b></td>
            <td><?=$dieta->peso.' '.$dieta->medida?></td>
          
        </tr>
          <tr class="success">
         
          <td><b>Porción</b></td>
            <td><?=$dieta->porcion?> Gr</td>
         
        </tr>
     
    </tbody>
</table>
<?php $this->widget('bootstrap.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'id_dieta',
		'id_alimento',
		'cantidad_gramos',
		'costo_gramos',
		'precio_gramos',
		'created_date',
		'modified_date',
		'created_by',
		'modified_by',
	),
)); ?>
