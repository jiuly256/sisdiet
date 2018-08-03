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
<div class="span4">
<?php echo $form->labelEx($model,'fecha'); ?>
<?php  $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                           'model'=>$model,
                           'attribute'=>'fecha',
                           'value'=>$model->fecha,
                           'language' => 'es',
                           'htmlOptions' => array('readonly'=>"readonly",'class'=>'span11','onchange'=>'fechajq()'),
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
 
  <?php echo $form->hiddenField($model,'id_cliente');  ?>
  <?php //echo $form->textFieldRow($model,'id_cliente',array('class'=>'span11')); ?>
  <?php
  if ($model->isNewRecord==true){
 $this->widget('zii.widgets.jui.CJuiAutoComplete',
   array(
    'name'=>'cliente_descripcion', // Nombre para el campo de autocompletar
    'attribute'=>'cliente_descripcion', 
       
    'model'=>$model,
    'value'=>$model->isNewRecord ? '' : $model->idCliente->cedula.' '.$model->idCliente->cedula,
    'source'=>$this->createUrl('DietaDetalle/autocomplete'), // URL que genera el conjunto de datos
    'options'=> array(
      'showAnim'=>'fold',
      'size'=>'30',
      'minLength'=>'1', // Minimo de caracteres que hay que digitar antes de relizar la busqueda
      'select'=>"js:function(event, ui) { 
       $('#DietaDetalle_id_cliente').val(ui.item.id); // HTML-Id del campo
       $('#DietaDetalle_id_mascota').val(ui.item.id_mascota); // HTML-Id del campo
       $('#clientejq').text(ui.item.cliente); 
       $('#mascotajq').text(ui.item.nombre_mascota); 
        $('#edadjq').text(ui.item.descripcion); 
       $('#pesojq').text(ui.item.peso); 
       $('#porcionjq').text(ui.item.porcion); 
       $('#DietaDetalle_porcion').val(ui.item.porcion); 
     
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

   $cliente=Cliente::model()->findBySql("select * from cliente where id = (select id_cliente from dieta where id =(select id_dieta from dieta_detalle where id=$model->id))");
   echo $form->textField($model,'cliente_descripcion',array('class'=>'span11','value'=>$cliente->cedula.'-'.$cliente->nombre.' '.$cliente->apellido,'readonly'=>true));
 }
?>

</div>
<div class="span4">

<?php 
if ($model->isNewRecord==true){
  echo $form->dropDownListRow($model,'id_mascota', CHtml::listData(Mascota::model()->findAll(
  ), 'id_mascota', 'nombre'), array('class'=>'span11', 'prompt' => 'Seleccione...','disabled'=>false));

}else{
    echo $form->dropDownListRow($model,'id_mascota', CHtml::listData(Mascota::model()->findAllBySql
      ("select * from mascota where id_mascota = (select id_mascota from dieta where id =(select id_dieta from dieta_detalle where id=$model->id limit 1))"), 'id_mascota', 'nombre'), array('class'=>'span11', 'prompt' => 'Seleccione...','readonly'=>true));
}

   ?>
</div>
</div>

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
</div>
<?php $this->endWidget(); ?>
<?php $this->endWidget(); ?>

<table class="table table-bordered table-hover">
       <thead >
        <tr>
            <th  style="text-align: center">Fecha</th>
            <th rowspan="4"  style="text-align: center">Nombre cliente</th>
            <th colspan="3" style="text-align: center">Mascota</th>
            
        </tr>
    </thead>
    <tbody>
        <tr >
         <td rowspan="4"><label id="fechajq"></label></td>
         <td rowspan="4"><label id="clientejq"></label></td>
          <td class="info"><b>Nombre</b></td>
           <td><label id="mascotajq"></label></td>
        </tr>
          <tr class="success">
           
          <td><b>Edad</b></td>
            <td><label id="edadjq"></label></td>
          
        </tr>
          <tr class="active">
         
          <td><b>Peso</b></td>
            <td><label id="pesojq"></label></td>
          
        </tr>
          <tr class="success">
         
          <td><b>Porción</b></td>
            <td><p id="porcionjq"></p></td>
         
        </tr>
     
    </tbody>
</table>

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
  function fechajq(){
    $("#fechajq").text($("#DietaDetalle_fecha").val());
  }

     
$(function(){
 $("#btn_enviar").click(function(){
 var url = "verprecio"; // the script where you handle the form input.
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