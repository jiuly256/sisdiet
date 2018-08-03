<?php
/* @var $this FacturaController */
/* @var $model Factura */

$this->breadcrumbs=array(
	'Facturas'=>array('index'),
	$model->id_factura,
);

$this->menu=array(
	array('label'=>'Registrar Dieta','url'=>array('dietaDetalle/create')),
	array('label'=>'Actualizar Dieta','url'=>array('dieta/update','id'=>$model->id_dieta)),
	array('label'=>'Dieta','url'=>array('dieta/admin')),
);
?>

<h1 style="text-align: center">Ver Factura #<?php echo $model->id_factura; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id_factura',
		'fecha',
		'tipo_pago',
		'nombre',
		'rif',
		'domicilio',
		'telefono',
		// 'cantidad',
		// 'descripcion',
		// 'precio',
		// 'cantidadp',
		// 'descripcionp',
		// 'preciop',
		// 'porcentaje',
		// 'subtotal',
		// 'iva',
		// 'total',
		array(
			'header'=>'Estatus',
			'name'=>'estatus',
			'value'=>$model->getestatus($model->estatus)
		)
		
	),
)); ?>

<?php 
$this->widget('bootstrap.widgets.TbButton', array(
    'label'=>'Imprimir Factura',
    'type'=>'info', // null, 'primary', 'info', 'success', 'warning', 'danger' or 'inverse'
    //'size'=>'large',
    'icon'=>'icon-print',
    'url' => array('/factura/pdf_factura/','id'=>$model->id_factura)
// null, 'large', 'small' or 'mini'
)); 

?>
