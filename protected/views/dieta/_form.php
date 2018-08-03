<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'dieta-form',
	'enableAjaxValidation'=>false,
)); ?>

<?php
	$this->beginWidget('zii.widgets.CPortlet', array(
		'title'=>"Dieta",
	));
	
?>
<?php
   $this->widget('bootstrap.widgets.TbAlert', array(
        'block'=>true, // display a larger alert block?
        'fade'=>true, // use transitions?
        'closeText'=>'&times;', // close link text - if set to false, no close link is displayed
        'alerts'=>array( // configurations per alert type
        'error'=>array('block'=>true, 'fade'=>true, 'Text'=>'&times;'), // success, info, warning, error or danger
        ),
    )); 
   $this->widget('bootstrap.widgets.TbAlert', array(
        'block'=>true, // display a larger alert block?
        'fade'=>true, // use transitions?
        'closeText'=>'&times;', // close link text - if set to false, no close link is displayed
        'alerts'=>array( // configurations per alert type
        'success'=>array('block'=>true, 'fade'=>true, 'Text'=>'&times;'), // success, info, warning, error or danger
        ),
    )); 
?>
<div class="alert alert-info"><i class="icon-info-sign"></i> Los campos con <span class="required">*</span> son obligatorios.</div>

	<?php echo $form->errorSummary($model); ?>
<div class="row-fluid">
<div class="span4">
 <?php echo $form->labelEx($model,'fecha'); ?>
  <?php  $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                           'model'=>$model,
                           'attribute'=>'fecha',
                           'value'=>$model->fecha,
                           'language' => 'es',
                           'htmlOptions' => array('readonly'=>"readonly",'class'=>'span11','onchange'=>'calculaedad()'),
                             //additional javascript options for the date picker plugin
                           'options'=>array(
                          
                           'autoSize'=>true,
                           'defaultDate'=>$model->fecha,
                           'dateFormat'=>'dd-mm-yy',
                           'endDate'=>'0d',
                           //  'dateFormat'=>'d-m-yy',
//                           'buttonImage'=>Yii::app()->baseUrl.'/images/calendar.png',
//                           'buttonImageOnly'=>true,
//                           'buttonText'=>'fechainicio',
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
<div class="span4">
  <?php echo $form->labelEx($model,'id_cliente'); ?>  
  <?php echo $form->hiddenField($model,'id_cliente',array( 'onfocus'=>"cambio()"));  ?>
	<?php //echo $form->textFieldRow($model,'id_cliente',array('class'=>'span11')); ?>
  <?php
  if ($model->isNewRecord==true){
 $this->widget('zii.widgets.jui.CJuiAutoComplete',
   array(
    'name'=>'cuenta_descripcion', // Nombre para el campo de autocompletar
    'attribute'=>'cuenta_descripcion', 
       
    'model'=>$model,
    'value'=>$model->isNewRecord ? '' : $model->idCliente->cedula.' '.$model->idCliente->cedula,
    'source'=>$this->createUrl('Dieta/autocomplete'), // URL que genera el conjunto de datos
    'options'=> array(
      'showAnim'=>'fold',
      'size'=>'30',
      'minLength'=>'1', // Minimo de caracteres que hay que digitar antes de relizar la busqueda
      'select'=>"js:function(event, ui) { 
       $('#Dieta_id_cliente').val(ui.item.id); // HTML-Id del campo
        $('#Dieta_id_mascota').val(ui.item.id_mascota); // HTML-Id del campo
              }"
      ),
     
    'htmlOptions'=> array(
       //  'onchange'=>'borrarcodigo()',
        'class'=>'span11',
     'size'=>80,
     'placeholder'=>'Buscar cliente...',
//     'title'=>'Coloque el codigo a buscar.Ejm 111.00.00.00 o la Descripcion. Ejm. Efectivo'
     ),
   ));  }
 else {

   $cliente=Cliente::model()->find("id=$model->id_cliente");
   echo $form->textField($model,'cuenta_descripcion',array('class'=>'span11','value'=>$cliente->cedula.'-'.$cliente->nombre.' '.$cliente->apellido,'readonly'=>true));
 }
?>

</div>
<div class="span4">

<?php //echo $form->textField($model,'id_mascota'); ?>
<?php 
if ($model->isNewRecord==true){
  echo $form->dropDownListRow($model,'id_mascota', CHtml::listData(Mascota::model()->findAll(
  ), 'id_mascota', 'nombre'), array('class'=>'span11', 'prompt' => 'Seleccione...','readonly'=>true));

}else{
    echo $form->dropDownListRow($model,'id_mascota', CHtml::listData(Mascota::model()->findAll
      ('id_cliente='.$model->id_cliente.''
  ), 'id_mascota', 'nombre'), array('class'=>'span11', 'prompt' => 'Seleccione...','readonly'=>true));
}

   ?>
</div>
</div>
	

<?php if ($model->isNewRecord==false) { 
$dietadetalle=new CActiveDataProvider('DietaSubdieta', array(
    'criteria'=>array(
    'condition'=>'id_dieta='.$model->id.'' 
    ),
    'pagination'=>array(
    'pageSize'=>10,
    ),
    ));


    $this->widget('bootstrap.widgets.TbGridView',array(
    'id'=>'detalle-dieta-detalle-grid',
    'enableSorting'=>false,
    'dataProvider'=>$dietadetalle,
    'columns'=>array(
        //'id',
        array(
        'header'=>'Alimento',
        'name'=>'descripcion',
        //'value'=>'$data->Alimento->descripcion',
        ),
        array(
        'header'=>'Monto',
        'name'=>'monto',
        'value'=>'$data->decimales($data->monto)',
        ),
        //'monto',
        'dias',
      array(
        'header'=>'Total',
        'name'=>'total',
        'value'=>'$data->decimales($data->total)',
        ),
       
        array(
        'class'=>'bootstrap.widgets.TbButtonColumn',
        'template'=>'{Eliminar}',
         'buttons'=>array(
                 'Eliminar' => array(
                  'url'=>"CHtml::normalizeUrl(array('eliminar', 'id'=>\$data->id))",
                  'icon'=>'trash',
                 // 'visible' =>"\$data->status==2 && \$data->eje->activo==1"
                    ), 
                )
        ),
    ),
));


$dietadetalle=new CActiveDataProvider('DietaDetalle', array(
    'criteria'=>array(
    'condition'=>'id_dieta='.$model->id.' and tipo_alimento=7' ,
    'with'=>'Alimento'
    ),
    'pagination'=>array(
    'pageSize'=>10,
    ),
    ));


    $this->widget('bootstrap.widgets.TbGridView',array(
    'id'=>'detalle-dieta-detalle-grid',
    'enableSorting'=>false,
    'dataProvider'=>$dietadetalle,
    'columns'=>array(
        //'id',
        array(
        'header'=>'Premio',
        'name'=>'id_alimento',
        'value'=>'$data->Alimento->descripcion',
        ),
         array(
        'header'=>'Cantidad',
        'name'=>'cantidad_gramos',
    //   'value'=>'$data->Alimento->descripcion',
        ),
         array(
        'header'=>'Costo',
        'name'=>'costo_gramos',
        'value'=>'$data->decimales($data->costo_gramos)',
        ),
        array(
        'header'=>'Precio total',
        'name'=>'precio_gramos',
       'value'=>'$data->decimales($data->precio_gramos)',
        ),
      //  'cantidad_gramos',
      //  'costo_gramos',
      //  'precio_gramos',
       
        array(
        'class'=>'bootstrap.widgets.TbButtonColumn',
        'template'=>'{Eliminar}',
         'buttons'=>array(
               'Eliminar' => array(
                  'url'=>"CHtml::normalizeUrl(array('dietaDetalle/eliminar', 'id'=>\$data->id))",
                  'icon'=>'trash',
                 // 'visible' =>"\$data->status==2 && \$data->eje->activo==1"
                    ), 
                
                )
        ),
    ),
));    
  }
?>

<!--
	<?php echo $form->textFieldRow($model,'precio_diario',array('class'=>'span5')); ?>

 	<?php echo $form->textFieldRow($model,'dias',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'precio_dias',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'iva',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'monto_iva',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'precio_total',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'created_date',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'modified_date',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'created_by',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'modified_by',array('class'=>'span5')); ?> -->

<div class="row buttons" style="text-align: center">
            <?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
      'icon'=>'icon-plus',
			'label'=>$model->isNewRecord ? 'Continuar' : 'NUTRIPETS',
		)); ?>
</div>

<?php $this->endWidget(); ?>
<?php $this->endWidget(); ?>

