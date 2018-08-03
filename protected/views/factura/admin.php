<?php
/* @var $this FacturaController */
/* @var $model Factura */

$this->breadcrumbs=array(
	'Facturas'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'Registrar Dieta','url'=>array('dietaDetalle/create')),
	array('label'=>'Actualizar Dieta','url'=>array('dieta/update','id'=>$model->id_dieta)),
	array('label'=>'Dieta','url'=>array('dieta/admin')),
);


Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#factura-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1 style="text-align: center"> Facturas</h1>

<?php $this->widget('bootstrap.widgets.TbGridView', array(
	'id'=>'factura-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id_factura',
		'fecha',
		'tipo_pago',
		'nombre',
		'rif',
		'domicilio',
		array(
			'header'=>'Estatus',
			'name'=>'estatus',
			'value'=>'$data->idEstatus->descripcion',
			 'filter' => CHtml::listData(Estatusfactura::model()->findAll(array()), 'id', 'descripcion'), 
			),
		/*
		'telefono',
		'cantidad',
		'descripcion',
		'precio',
		'cantidadp',
		'descripcionp',
		'preciop',
		'porcentaje',
		'subtotal',
		'iva',
		'total',
		'estatus',
		*/
		array(
			'class'=>'bootstrap.widgets.TbButtonColumn',
			'template' => '{view} {pdf} ',
              'buttons'=>array(
              	 'pdf' => array(
                              'label'=>'Imprimir Factura', 
                              'url'=>"CHtml::normalizeUrl(array('pdf_factura', 'id'=>\$data->id_factura))",
                              'icon'=>'icon-print',
                         //     'imageUrl'=>Yii::app()->request->baseUrl.'/images/pdf_icon.png', 
                       //       'visible'=>'(@$data->str_alias=="" )',
                              'options' => array('class'=>'pdf'),
                      ),
              	)
		),
	),
)); ?>
