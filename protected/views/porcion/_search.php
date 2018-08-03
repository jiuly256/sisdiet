<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<?php echo $form->textFieldRow($model,'id',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'id_peso',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'id_edad',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'cantidad_gramos',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'porcentaje_grasa',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'porcentaje_proteina',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'porcentaje_vegetal',array('class'=>'span5')); ?>

	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
			'label'=>'Search',
		)); ?>
	</div>

<?php $this->endWidget(); ?>
