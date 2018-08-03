<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'porcion-form',
	'enableAjaxValidation'=>false,
)); ?>

<?php
	$this->beginWidget('zii.widgets.CPortlet', array(
		'title'=>"Actualiza",
	));
	
?>
	<div class="alert alert-info"><i class="icon-info-sign"></i> Los campos con <span class="required">*</span> son obligatorios.</div>

	<?php echo $form->errorSummary($model); ?>
<div class="row-fluid">

<div class="span4">
	<?php echo $form->textFieldRow($model,'cantidad_gramos',array('class'=>'span5')); ?>

</div>
<div class="span4">
	<?php echo $form->textFieldRow($model,'porcentaje_proteina',array('class'=>'span5')); ?>
</div>
<div class="span4">
	<?php echo $form->textFieldRow($model,'porcentaje_vegetal',array('class'=>'span5')); ?>
</div>
<span class="help-block"><i class=" icon-info-sign"></i>Porcentaje: los porcentajes no deberian superar 100 %</span>
</div>

	<div class="row buttons" style="text-align: center">
            <?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
			'label'=>$model->isNewRecord ? 'Guardar' : 'Guardar',
		)); ?>
</div>


<?php $this->endWidget(); ?>
<?php $this->endWidget(); ?>
