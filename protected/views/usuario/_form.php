<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'usuario-form',
	'enableAjaxValidation'=>false,
)); ?>

<?php
	$this->beginWidget('zii.widgets.CPortlet', array(
		'title'=>"Datos de usuario",
	));
	
?>

<div class="alert alert-info"><i class="icon-info-sign"></i> Los campos con <span class="required">*</span> son obligatorios.</div>

	<?php echo $form->errorSummary($model); ?>

<div class="row-fluid">
    <div class="span4">
	<?php echo $form->textFieldRow($model,'username',array('class'=>'span11','maxlength'=>128)); ?>
    </div>
    <div class="span4">
	<?php 
        if ($model->isnewrecord){
        echo $form->passwordFieldRow($model,'password',array('class'=>'span11','maxlength'=>128)); 
        }else{
        echo $form->textFieldRow($model,'password',array('class'=>'span11','maxlength'=>128,'disabled'=>true)); 
        }
        ?>
    </div>
    <div class="span4">
         <?php echo $form->dropDownListRow($model,'id_perfil', CHtml::listData(Perfil::model()->findAll(array('order'=>'nombre_perfil asc')), 'id', 'nombre_perfil'), array('prompt' => 'Seleccione...','class'=>'span11')); ?>
    </div>
</div>
<div class="row-fluid">
    <div class="span4">
	<?php echo $form->textFieldRow($model,'str_nombre',array('class'=>'span11','maxlength'=>150)); ?>
    </div>
    <div class="span4">
	<?php echo $form->textFieldRow($model,'str_apellido',array('class'=>'span11','maxlength'=>150)); ?>
        
    </div>
    <div class="span4">
	<?php echo $form->textFieldRow($model,'int_cedula',array('class'=>'span11')); ?>
        
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
