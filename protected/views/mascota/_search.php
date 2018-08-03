<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<?php echo $form->textFieldRow($model,'id_mascota',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'id_cliente',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'nombre',array('class'=>'span5','maxlength'=>100)); ?>

	<?php echo $form->textFieldRow($model,'tipo',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'raza',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'fecha_nacimiento',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'edad',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'clasificacion',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'sexo',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'color',array('class'=>'span5','maxlength'=>100)); ?>

	<?php echo $form->textFieldRow($model,'esterilizado',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'longitud',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'longitud_medida',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'peso',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'peso_medida',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'foto',array('class'=>'span5','maxlength'=>100)); ?>

	<?php echo $form->textAreaRow($model,'observacion',array('rows'=>6, 'cols'=>50, 'class'=>'span8')); ?>

	<?php echo $form->textFieldRow($model,'created_date',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'modified_date',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'created_by',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'modified_by',array('class'=>'span5')); ?>

	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
			'label'=>'Search',
		)); ?>
	</div>

<?php $this->endWidget(); ?>
