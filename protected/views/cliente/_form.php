<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'cliente-form',
	'enableAjaxValidation'=>false,
)); ?>
<?php
	$this->beginWidget('zii.widgets.CPortlet', array(
		'title'=>"Datos de cliente",
	));
	
?>
<div class="alert alert-info"><i class="icon-info-sign"></i> Los campos con <span class="required">*</span> son obligatorios.</div>

	<?php echo $form->errorSummary($model); ?>

<div class="row-fluid">
    <div class="span4">
	<?php echo $form->textFieldRow($model,'cedula',array('class'=>'span11')); ?>
    </div>
    <div class="span4">
	<?php echo $form->textFieldRow($model,'nombre',array('class'=>'span11','maxlength'=>100)); ?>
        
    </div>
    <div class="span4">
	<?php echo $form->textFieldRow($model,'apellido',array('class'=>'span11','maxlength'=>100)); ?>
    </div>
</div>
<div class="row-fluid">
    <div class="span4">
	<?php echo $form->dropDownListRow($model,'sexo', CHtml::listData(Sexo::model()->findAll(array('condition'=>'id in (1,2)','order'=>'descripcion asc')), 'id', 'descripcion'), array('prompt' => 'Seleccione...','class'=>'span11')); ?>
    </div>
    <div class="span8">
	<?php echo $form->textAreaRow($model,'direccion',array('rows'=>6, 'cols'=>50, 'class'=>'span11')); ?>
    </div>
</div>
<div class="row-fluid">
    <div class="span4">
    <?php echo $form->labelEx($model,'telefono'); ?>
    <?php
    $this->widget('CMaskedTextField', array(
      'model' => $model,
      'attribute' => 'telefono',
      'mask' => '(9999)-999-9999',
      'htmlOptions' => array('size' => 16,'class' => 'span11')
    ));
    ?> 
    </div>
    <div class="span4">
    <?php echo $form->labelEx($model,'telefono_casa'); ?>
    <?php
    $this->widget('CMaskedTextField', array(
      'model' => $model,
      'attribute' => 'telefono_casa',
      'mask' => '(9999)-999-9999',
      'htmlOptions' => array('size' => 16,'class' => 'span11')
    ));
    ?> 
    </div>
    <div class="span4">
	<?php echo $form->textFieldRow($model,'correo_electronico',array('class'=>'span11','maxlength'=>100)); ?>
    </div>
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
