<?php
$this->breadcrumbs=array(
	'Dieta Detalles'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List DietaDetalle','url'=>array('index')),
	array('label'=>'Create DietaDetalle','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('dieta-detalle-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Dieta Detalles</h1>

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
	'id'=>'dieta-detalle-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'id_dieta',
		'id_alimento',
		'cantidad_gramos',
		'costo_gramos',
		'precio_gramos',
		/*
		'created_date',
		'modified_date',
		'created_by',
		'modified_by',
		*/
		array(
			'class'=>'bootstrap.widgets.TbButtonColumn',
		),
	),
)); ?>
