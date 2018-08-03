<?php
$this->breadcrumbs=array(
	'Dietas'=>array('index'),
	'Manage',
);

$this->menu=array(
	//array('label'=>'List Dieta','url'=>array('index')),
	array('label'=>'Registrar Dieta','url'=>array('dietaDetalle/create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('dieta-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1 style="text-align: center"> Dietas</h1>

<?php $this->widget('bootstrap.widgets.TbGridView',array(
	'id'=>'dieta-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
	//	'id',
		  array(
                   'header'=>'Fecha',
                    'name'=>'fecha',
                    'value' =>'date("d-m-Y",strtotime($data->fecha))',
                    'htmlOptions'=>array('style'=>'text-align: center'),
                    'class'=>'SYDateColumn',
                    ),
		 // array(
   //                 'header'=>'Cliente',
   //                  'name'=>'id_cliente',
   //                  'value'=>'$data->pegar($data->idCliente->nombre,$data->idCliente->apellido)' ,
   //             //    'filter' => CHtml::listData(Cliente::model()->findAll(array('order'=>'cedula')), 'id', 'nombre','apellido'),
   //                //  'htmlOptions'=>array('style'=>'width:30px'),
   //                  ),
		   array (//'header'=>'Cliente',
                'name'=>'nombre',
                //'filter'=>'',
                'value' => '$data->idCliente->nombre',
                'type'=>'text',),
		   array (//'header'=>'Cliente',
                'name'=>'apellido',
                //'filter'=>'',
                'value' => '$data->idCliente->apellido',
                'type'=>'text',),
		  
		array(
                   'header'=>'Mascota',
                    'name'=>'id_mascota',
                    'value'=>'$data->idMascota->nombre' ,
                   'filter' => CHtml::listData(Mascota::model()->findAll(array('order'=>'id_mascota')), 'id_mascota', 'nombre'),
                  //  'htmlOptions'=>array('style'=>'width:30px'),
                    ),
		'precio_diario',
		'dias',
		
		'precio_dias',
		'iva',
		'monto_iva',
		'precio_total',
		/*
		idCliente
		'created_date',
		'modified_date',
		'created_by',
		'modified_by',
		*/
		array(
			'class'=>'bootstrap.widgets.TbButtonColumn',
			'template' => '{view} {update} {pdf} {delete} {vista_detalle}',
              'buttons'=>array(
              	 'pdf' => array(
                              'label'=>'Generar PDF', 
                              'url'=>"CHtml::normalizeUrl(array('pdf', 'id'=>\$data->id))",
                              'icon'=>'icon-file',
                         //     'imageUrl'=>Yii::app()->request->baseUrl.'/images/pdf_icon.png', 
                       //       'visible'=>'(@$data->str_alias=="" )',
                              'options' => array('class'=>'pdf'),
                      ),
              	  'vista_detalle' => array(
                              'label'=>'Vista detalle', 
                              'url'=>"CHtml::normalizeUrl(array('view2', 'id'=>\$data->id))",
                              'icon'=>'icon-list',
                         //     'imageUrl'=>Yii::app()->request->baseUrl.'/images/pdf_icon.png', 
                       //       'visible'=>'(@$data->str_alias=="" )',
                              'options' => array('class'=>'pdf'),
                      ),
              	)
		),
	),
)); ?>
