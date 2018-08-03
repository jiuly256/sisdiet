<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'alimento-form',
	'enableAjaxValidation'=>false,
)); ?>
<?php
	$this->beginWidget('zii.widgets.CPortlet', array(
		'title'=>"Datos de alimento",
	));
	
?>
	<p class="help-block">Campos con <span class="required">*</span> son obligatorios.</p>


    <?php echo $form->errorSummary($model); ?>
<div class="row-fluid">
<div class="span6">
<?php echo $form->textFieldRow($model,'descripcion',array('class'=>'span11','maxlength'=>50,)); ?>
</div>
<div class="span6">
<?php echo $form->dropDownListRow($model,'tipo_alimento', CHtml::listData(TipoAlimento::model()->findAll(array('order'=>'id asc')), 'id', 'descripcion'), array('class'=>'span11','prompt' => 'Seleccione...')); ?>
</div>
</div>
<div class="row-fluid">
<div class="span6">

	<?php echo $form->dropDownListRow($model,'id_unidad', CHtml::listData(UnidadMedida::model()->findAll(array('order'=>'id asc','condition'=>"tipo='peso'")), 'id', 'descripcion'), array('class'=>'span11')); ?>
</div>
<div class="span6">
<?php echo $form->textAreaRow($model,'observaciones',array('class'=>'span11')); ?>
</div>
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
