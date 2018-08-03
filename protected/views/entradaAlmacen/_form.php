<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/datepicker.min.css" />
<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/datepicker3.min.css" />
<script src="<?php echo Yii::app()->request->baseUrl; ?>/js/bootstrap-datepicker.min.js"></script>


<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'entrada-almacen-form',
	'enableAjaxValidation'=>false,
)); ?>

<?php
	$this->beginWidget('zii.widgets.CPortlet', array(
		'title'=>"Datos de entrada almacen",
	));
	
?>

<div class="form">

<div class="alert alert-info"><i class="icon-info-sign"></i> Los campos con <span class="required">*</span> son obligatorios.</div>

	<?php echo $form->errorSummary($model); ?>
<div class="row-fluid">
<div class="span6">
	<?php echo $form->labelEx($model,'fecha'); ?>
  <?php  $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                           'model'=>$model,
                           'attribute'=>'fecha',
                           'value'=>$model->fecha,
                           'language' => 'es',
                           'htmlOptions' => array('readonly'=>"readonly",'class'=>'span6','onchange'=>'calculaedad()'),
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
<div class="span6">
		<?php echo $form->labelEx($model,'observacion'); ?>
		<?php echo $form->textArea($model,'observacion',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'observacion'); ?>
</div>

</div>
	

<div class="row buttons" style="text-align: center">
            <?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
			'label'=>$model->isNewRecord ? 'Continuar' : 'Continuar',
		)); ?>
</div>

<?php $this->endWidget(); ?>
<?php $this->endWidget(); ?>

</div><!-- form -->

