<?php
/* @var $this FacturaController */
/* @var $model Factura */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'factura-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>
<?php
	$this->beginWidget('zii.widgets.CPortlet', array(
		'title'=>"Factura",
	));
	
?>
<?php
if ($model->isNewRecord=true){
$dieta= Vistadetalle::model()->find('id='.$_GET['id']);
//echo "<pre>"; print_r($dieta); exit;
$fecha=date('d-m-Y',strtotime($dieta->fecha));


$proteinas= DietaDetalle::model()->find('id_dieta='.$_GET['id'].'');
//echo $proteinas->Alimento->descripcion;
//echo "<pre>"; print_r($proteinas); exit;


$dietac= Dieta::model()->find('id='.$_GET['id']);

$cliente= Cliente::model()->find('id='.$dietac->id_cliente);
//echo "<pre>"; print_r($cliente); exit;

$dietasubdieta= DietaSubdieta::model()->findAll('id_dieta='.$_GET['id']);
$descripcion= $dietasubdieta['0']->descripcion;
$cuenta=count($dietasubdieta);
$suma=0;
foreach ($dietasubdieta as $key => $value) {

    $suma+=$dietasubdieta[$key]->total;
}
$sumaf=number_format($suma,2,',','.');
//echo "<pre>"; print_r($dietasubdieta); exit;

$premios= DietaDetalle::model()->findAllBySql('select * from dieta_detalle,alimento where id_dieta='.$_GET['id'].'
and alimento.id=dieta_detalle.id_alimento
and alimento.tipo_alimento=7');
$descripcionp= 'PREMIO';
$cuentap=count($premios);
$sumap=0;
foreach ($premios as $key => $value) {

    $sumap+=$premios[$key]->precio_gramos;
}
$sumapf=number_format($sumap,2,',','.');

$sumasubtotal=$suma+$sumap;
$sumasubtotalf=number_format($sumasubtotal,2,',','.');
$iva=$sumasubtotal*0.12;
$ivaf=number_format($iva,2,',','.');
$total=$sumasubtotal+$iva;
$totalf=number_format($total,2,',','.');

$fecha=date('Y-m-d');
}
?>
<div class="alert alert-info"><i class="icon-info-sign"></i> Los campos con <span class="required">*</span> son obligatorios.</div>
	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'fecha'); ?>
		<?php echo $form->textField($model,'fecha',array('value'=>$fecha,'readonly'=>false)); ?>
		<?php echo $form->error($model,'fecha'); ?>
	</div>
<table >
        <tr>
            <td class=''><?php echo $form->labelEx($model,'nombre'); ?></td>
            <td class=''><?php echo $form->textField($model,'nombre',array('size'=>60,'maxlength'=>80,'value'=>$cliente->nombre.' '.$cliente->apellido,'readonly'=>false)); ?></td>
        </tr>
        <tr>
            <td class=''><?php echo $form->labelEx($model,'rif'); ?></td>
            <td class=''><?php echo $form->textField($model,'rif',array('value'=>$cliente->cedula,'readonly'=>false)); ?></td>
        </tr>
        <tr>
            <td class=''><?php echo $form->labelEx($model,'domicilio'); ?></td>
            <td class=''><?php echo $form->textArea($model,'domicilio',array('rows'=>3, 'cols'=>50,'value'=>$cliente->direccion,'readonly'=>false)); ?></td>
        </tr>    
        <tr>
            <td class=''><?php echo $form->labelEx($model,'telefono'); ?></td>
            <td class=''><?php echo $form->textField($model,'telefono',array('value'=>$cliente->telefono,'readonly'=>false)); ?></td>
        </tr>
       
 </table>    
	<div class="col-6">
		<?php echo $form->labelEx($model,'tipo_pago'); ?>
		<?php echo $form->dropDownList($model,'tipo_pago', CHtml::listData(Tipopago::model()->findAll(array('order'=>'id asc')), 'id', 'descripcion'), array('class'=>'span11')); ?>
		<?php echo $form->error($model,'tipo_pago'); ?>
	</div>
   



	<div class="row buttons" style="text-align: center">
            <?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
			'label'=>$model->isNewRecord ? 'Guardar' : 'Guardar',
		)); ?>

<?php $this->endWidget(); ?>
<?php $this->endWidget(); ?>

</div><!-- form -->