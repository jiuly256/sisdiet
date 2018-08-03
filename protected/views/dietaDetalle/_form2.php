<?php //$form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	//'id'=>'form',
//	'enableAjaxValidation'=>false,
//)); ?>
<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
  'id'=>'form',
  'enableClientValidation'=>true,
   'clientOptions'=>array(
     'validateOnSubmit'=>true,
  ),

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
        'success'=>array('block'=>true, 'fade'=>true, 'Text'=>'&times;'), // success, info, warning, error or danger
        ),
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
?>
<div class="alert alert-info"><i class="icon-info-sign"></i> Los campos con <span class="required">*</span> son obligatorios.</div>

	<?php echo $form->errorSummary($model); ?>

<?php // echo $form->hiddenField($model,'id_dieta',array('class'=>'span7','value'=>$_GET['id'])); ?>

<div class="row-fluid">

<div class="span12">
   <?php echo $form->radioButtonListRow($model,'id_alimento', CHtml::listData(Alimento::model()->findAllBySql("select distinct alimento.* from alimento,vistaprecios where alimento.tipo_alimento=1
and alimento.id=vistaprecios.id_alimento order by descripcion asc"), 'id', 'descripcion'), array('inline' => true,'prompt' => 'Seleccione...','class'=>'span12')); ?>

</div>
</div>
<div class="row-fluid">
<div class="span12">
   <?php echo $form->checkboxListRow($model,'cuenta_descripcion', CHtml::listData(Alimento::model()->findAllBySql("select distinct alimento.* from alimento,vistaprecios where alimento.tipo_alimento between 2 and 5
and alimento.id=vistaprecios.id_alimento order by descripcion asc"), 'id', 'descripcion'), array('inline' => true,'class'=>'span12')); ?>

</div>
</div><br/>
<div class="row-fluid">
<div class="span6">
   <?php 
   echo $form->labelEx($model,'premio');
   $premio=Alimento::model()->findAllBySql("select distinct alimento.* from alimento,vistaprecios where alimento.tipo_alimento =7
and alimento.id=vistaprecios.id_alimento order by descripcion asc");
   echo "<table>";
   for ($i=0;$i<=count($premio)-1;$i++) {
    echo "<tr><td>";
    echo '<input type="checkbox" id="DietaDetalle_premio_'.$i.'" name="DietaDetalle[premio]['.$i.']" value="'.$premio[$i]->id.'">'.
    $premio[$i]->descripcion.'</td><td>';

    //echo '<td><input type="text" id="DietaDetalle_premio_cantidad_'.$i.'" name="DietaDetalle[premiocantidad]['.$i.']" class="span3" >

   $this->widget('CMaskedTextField', array(
      'model' => $model,
      'attribute' => 'premio_cantidad_'.$i.'',
      'mask' => '99',
      'htmlOptions' => array('class'=>"span3",'placeholder'=>'01')
    ));

    echo '</td></tr>';
   }
  echo "</table>";


?>
<span class="help-block"><i class=" icon-info-sign"></i>Cantidad premio:  Debe ser 2 dígitos.<strong> Ejemplo: 01</strong></span>
</div>

<div class="span6">
   <?php
 echo $form->labelEx($model,'envase');
   $envase=Alimento::model()->findAllBySql("select distinct alimento.* from alimento,vistaprecios where alimento.tipo_alimento =0
and alimento.id=vistaprecios.id_alimento order by descripcion asc");
   echo "<table>";
   for ($i=0;$i<=count($envase)-1;$i++) {
    echo "<tr><td>";
    echo '<input type="checkbox" id="DietaDetalle_envase_'.$i.'" name="DietaDetalle[envase]['.$i.']" value="'.$envase[$i]->id.'">'.
   $envase[$i]->descripcion.'</td><td>';
  // echo '<input type="text" id="DietaDetalle_envase_cantidad_'.$i.'" name="DietaDetalle[envasecantidad]['.$i.']" class="span3" >';

   $this->widget('CMaskedTextField', array(
      'model' => $model,
      'attribute' => 'envase_cantidad_'.$i.'',
      'mask' => '99',
      'htmlOptions' => array('class'=>"span3",'placeholder'=>'01')
    ));

   echo '</td></tr>';
   }
  echo "</table>";

//    echo $form->checkboxListRow($model,'envase', CHtml::listData(Alimento::model()->findAllBySql("select distinct alimento.* from alimento,vistaprecios where alimento.tipo_alimento =0
// and alimento.id=vistaprecios.id_alimento order by descripcion asc"), 'id', 'descripcion')); 

?>
<span class="help-block"><i class=" icon-info-sign"></i>Cantidad envase: Debe ser 2 dígitos.<strong> Ejemplo: 02</strong></span>
</div>
</div><br/>
<div class="row-fluid">
<div class="span5">
   <?php //echo $form->textFieldRow($model,'dias',array('class'=>'span3','value'=>1));?>
<?php echo $form->labelEx($model,'dias'); ?>
 <?php
  $this->widget('CMaskedTextField', array(
      'model' => $model,
      'attribute' => 'dias',
      'mask' => '99',
      'htmlOptions' => array('class'=>"span3",'placeholder'=>'01','value'=>'01')
    ));

 ?>  
<span class="help-block"><i class=" icon-info-sign"></i>Dias: Cantidad de días, deberá ser 02 digitos. <strong>Ejemplo: 05</strong></span>
</div>
</div>

<div class="row buttons" style="text-align: center">
            <?php $this->widget('bootstrap.widgets.TbButton', array(
      'buttonType'=>'submit',
      'type'=>'primary',
      'label'=>$model->isNewRecord ? 'Guardar' : 'Guardar',
    )); ?>
   
<input type="button" id="btn_enviar" value="Consultar" class="btn btn-success" title="Click para consultar precios">

<input type="hidden" id="DietaDetalle_porcion" name="DietaDetalle[porcion]" value="">


<?php echo $form->hiddenField($model,'id2',array('value'=>$_GET['id2'])); ?>
<?php $dieta= Vistadetalle::model()->find('id='.$_GET['id2']); ?>
<?php echo $form->hiddenField($model,'porcion',array('value'=>$dieta->porcion)); ?>

</div>
<?php $this->endWidget(); ?>
<?php $this->endWidget(); ?>


<table class="table table-bordered table-hover" >
    <thead>
        <tr>
            <th >Descripcion</th>
            <th >Cantidad</th>
            <th >Dias</th>
            <th >Total</th>
            <th >Total por dias BS</th>
          
        </tr>
    </thead>
    <tbody id="respuesta">   
     <tr >
         <td ></td>
         <td ></td>
         <td ></td>
         <td ></td>
         <td ><b></b></td>
     </tr> 

    
    </tbody>
    </table>


<script>
     
$(function(){
 $("#btn_enviar").click(function(){

 var url = "../../verprecio"; // the script where you handle the form input.
    $.ajax({
           type: "POST",
           url: url,
           data: $("#form").serialize(), // serializes the form's elements.
           success: function(data)
           {
               $("#respuesta").html(data); // show response from the php script.
           }
         });

    return false; // avoid to execute the actual submit of the form.
 });
});

</script>
