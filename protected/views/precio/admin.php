<?php
$this->breadcrumbs=array(
	'Precios'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List Precio','url'=>array('index')),
	array('label'=>'Create Precio','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('precio-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Precios</h1>

<p>
You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button btn')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('bootstrap.widgets.TbGridView',array(
	'id'=>'precio-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'id_alimento',
		'precio',
		'fecha',
		'cantidad',
		'precio_venta',
		/*
		'fecha_vencimiento',
		'id_entrada_almacen',
		'id_unidad',
		*/
		array(
			'class'=>'bootstrap.widgets.TbButtonColumn',
		),
	),
)); ?>
