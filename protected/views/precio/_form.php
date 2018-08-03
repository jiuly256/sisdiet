<?php
/* @var $this PrecioController */
/* @var $model Precio */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'precio-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>


<?php
	$this->beginWidget('zii.widgets.CPortlet', array(
		'title'=>"Detalle de Compra",
	));
	
?>

<div class="alert alert-info"><i class="icon-info-sign"></i> Los campos con <span class="required">*</span> son obligatorios.</div>

	<?php echo $form->errorSummary($model); ?>
<div class="row-fluid">
<div class="span3">
		<?php echo $form->labelEx($model,'cuenta_descripcion'); ?>  
  <?php echo $form->hiddenField($model,'id_alimento',array('class'=>'span11')); ?>
  <?php
  if ($model->isNewRecord==true){
 $this->widget('zii.widgets.jui.CJuiAutoComplete',
   array(
    'name'=>'cuenta_descripcion', // Nombre para el campo de autocompletar
    'attribute'=>'cuenta_descripcion', 
       
    'model'=>$model,
    'value'=>$model->isNewRecord ? '' : $model->idCliente->cedula.' '.$model->idCliente->cedula,
    'source'=>$this->createUrl('autocomplete'), // URL que genera el conjunto de datos
    'options'=> array(
      'showAnim'=>'fold',
      'size'=>'30',
      'minLength'=>'1', // Minimo de caracteres que hay que digitar antes de relizar la busqueda
      'select'=>"js:function(event, ui) { 
       $('#Precio_id_alimento').val(ui.item.id); // HTML-Id del campo
       }"
      ),
     
    'htmlOptions'=> array(
       //  'onchange'=>'borrarcodigo()',
     'class'=>'span11',
     'size'=>80,
//     'placeholder'=>'Buscar cliente...',
     'title'=>'Coloque el nombre del alimento a buscar'
     ),
   ));  }
 else {

   $cliente=Alimento::model()->find("id=$model->id_alimento");
   echo $form->textField($model,'cuenta_descripcion',array('class'=>'span11','value'=>$cliente->descripcion,'readonly'=>true));
 }
?>

</div>
<div class="span2">
	<?php echo $form->textFieldRow($model,'cantidad',array('class'=>'span6')); ?>
</div>
<div class="span3">
	<?php echo $form->labelEx($model,'fecha_vencimiento'); ?>
  <?php  $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                           'model'=>$model,
                           'attribute'=>'fecha_vencimiento',
                           'value'=>$model->fecha_vencimiento,
                           'language' => 'es',
                           'htmlOptions' => array('readonly'=>"readonly",'class'=>'span6','onchange'=>'calculaedad()'),
                             //additional javascript options for the date picker plugin
                           'options'=>array(
                          
                           'autoSize'=>true,
                           'defaultDate'=>$model->fecha_vencimiento,
                           'dateFormat'=>'dd-mm-yy',
                           'endDate'=>'0d',
                           //  'dateFormat'=>'d-m-yy',
//                           'buttonImage'=>Yii::app()->baseUrl.'/images/calendar.png',
//                           'buttonImageOnly'=>true,
//                           'buttonText'=>'fecha_vencimientoinicio',
                           'selectOtherMonths'=>true,
                           'showAnim'=>'drop',
                           'showButtonPanel'=>true,
//                           'showOn'=>'button',
                           'showOtherMonths'=>true,
                           'changeMonth' => 'true',
                           'changeYear' => 'true',
                              ),
                             )); ?>
</div>
<div class="span2">
	<?php echo $form->textFieldRow($model,'precio',array('class'=>'span8','title'=>'El separador de decimal debe ser un punto (.)')); ?>
</div>
<div class="span2">
	<?php echo $form->textFieldRow($model,'precio_venta',array('class'=>'span8','title'=>'El separador de decimal debe ser un punto (.)')); ?>
</div>
</div>
<div class="row-fluid">


</div>


<div id="result"></div>
<div class="row buttons" style="text-align: center">
            <?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
			'label'=>$model->isNewRecord ? 'Guardar' : 'Guardar',
		)); ?>
</div>

<?php $this->endWidget(); ?>
<?php $this->endWidget(); ?>

</div><!-- form -->

<?php 
  $pre= Precio::model()->find('id_entrada_almacen='.$_GET['id'].'');
  
  $precio=new CActiveDataProvider('Precio', array(
            'criteria'=>array(
                'condition'=>'id_entrada_almacen='.$_GET['id'].'' ,
                'order'=>'id',
                 ),
                'pagination'=>array(
                    'pageSize'=>20,
                ),
            ));


       $this->widget('bootstrap.widgets.TbGridView',array(
        'type'=>'striped rows',
        'itemsCssClass'=>'table table-hover',   	
	'id'=>'entrada-almacen-grid',
        'enableSorting'=>false,
	'dataProvider'=>$precio,
	//'filter'=>$model,
	'columns'=>array(
                array(
                   'header'=>'Alimento',
                   'name'=>'id_alimento',
                   'value' =>'@$data->idAlimento->descripcion',
                    'htmlOptions'=>array('style'=>'text-align: justify'),
                    ),
                array(
                   'header'=>'Tipo alimento',
                    'name'=>'tipo_alimento',
                    'value'=>'@$data->idAlimento->tipoAlimento->descripcion',
                    'htmlOptions'=>array('style'=>'text-align: justify'),
                    ),
                 array(
                   'header'=>'cantidad',
                    'name'=>'cantidad',
                    'value'=>'@$data->cantidad',
                    'htmlOptions'=>array('style'=>'text-align: justify'),
                    ),
                    array(
                   'header'=>'fecha Vencimiento',
                    'name'=>'fechavencimiento',
                    'value'=>'@$data->fecha_vencimiento',
                    'htmlOptions'=>array('style'=>'text-align: justify'),
                    ),
                    array(
                   'header'=>'Precio compra',
                    'name'=>'precio',
                    'value'=>'@$data->precio',
                    'htmlOptions'=>array('style'=>'text-align: justify'),
                    ),
                     array(
                   'header'=>'Precio venta',
                    'name'=>'precio_venta',
                    'value'=>'@$data->precio_venta',
                    'htmlOptions'=>array('style'=>'text-align: justify'),
                    ),

                     array(
					'class'=>'bootstrap.widgets.TbButtonColumn',
		),
               	),

)); ?>
