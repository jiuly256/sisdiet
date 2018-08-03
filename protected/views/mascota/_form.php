<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/datepicker.min.css" />
<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/datepicker3.min.css" />
<script src="<?php echo Yii::app()->request->baseUrl; ?>/js/bootstrap-datepicker.min.js"></script>


<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
  'id'=>'mascota-form',
  'enableAjaxValidation'=>false,
)); ?>

<?php
  $this->beginWidget('zii.widgets.CPortlet', array(
    'title'=>"Datos de mascota",
  ));
  
?>

<?php    


function CalculaEdad( $fecha_ingreso ) {
    list($Y,$m,$d) = explode("-",$fecha_ingreso);
    return( date("md") < $m.$d ? date("Y")-$Y-1 : date("Y")-$Y );
}



?>
<div class="form">

<div class="alert alert-info"><i class="icon-info-sign"></i> Los campos con <span class="required">*</span> son obligatorios.</div>

	<?php echo $form->errorSummary($model); ?>

<div class="row-fluid">
    <div class="span3">
  <?php echo $form->labelEx($model,'cuenta_descripcion'); ?>  
	<?php //echo $form->textFieldRow($model,'id_cliente',array('class'=>'span11')); ?>
  <?php
  if ($model->isNewRecord==true){
 $this->widget('zii.widgets.jui.CJuiAutoComplete',
   array(
    'name'=>'cuenta_descripcion', // Nombre para el campo de autocompletar
    'attribute'=>'cuenta_descripcion', 
       
    'model'=>$model,
    'value'=>$model->isNewRecord ? '' : $model->idCliente->cedula.' '.$model->idCliente->cedula,
    'source'=>$this->createUrl('autocomplete'), // URL que genera el conjunto de datos
    'options'=> array(
      'showAnim'=>'fold',
      'size'=>'30',
      'minLength'=>'1', // Minimo de caracteres que hay que digitar antes de relizar la busqueda
      'select'=>"js:function(event, ui) { 
       $('#Mascota_id_cliente').val(ui.item.id); // HTML-Id del campo
       }"
      ),
     
    'htmlOptions'=> array(
       //  'onchange'=>'borrarcodigo()',
     'class'=>'span11',
     'size'=>80,
//     'placeholder'=>'Buscar cliente...',
     'title'=>'Coloque la cedula a buscar.Ejm 11042052 o Nombre y apellido'
     ),
   ));  }
 else {

   $cliente=Cliente::model()->find("id=$model->id_cliente");
   echo $form->textField($model,'cuenta_descripcion',array('class'=>'span11','value'=>$cliente->cedula.'-'.$cliente->nombre.' '.$cliente->apellido,'readonly'=>true));
 }
?>

    </div>
    <div class="span3">
	<?php echo $form->textFieldRow($model,'nombre',array('class'=>'span11','maxlength'=>100)); ?>
    </div>
    <div class="span3">
        <?php echo $form->dropDownListRow($model,'tipo', CHtml::listData(TipoMascota::model()->findAll(array('order'=>'id asc')), 'id', 'descripcion'), array('class'=>'span11')); ?>
    </div>
    <div class="span3">
          <?php echo $form->labelEx($model,'raza'); ?>  
  <?php echo $form->hiddenField($model,'raza',array('class'=>'span11')); ?>
  <?php
  if ($model->isNewRecord==true){
 $this->widget('zii.widgets.jui.CJuiAutoComplete',
   array(
    'name'=>'raza_descripcion', // Nombre para el campo de autocompletar
    'attribute'=>'raza_descripcion', 
       
    'model'=>$model,
    'value'=>$model->isNewRecord ? '' : $model->idCliente->cedula.' '.$model->idCliente->cedula,
    'source'=>$this->createUrl('autocomplete2'), // URL que genera el conjunto de datos
    'options'=> array(
      'showAnim'=>'fold',
      'size'=>'30',
      'minLength'=>'1', // Minimo de caracteres que hay que digitar antes de relizar la busqueda
      'select'=>"js:function(event, ui) { 
       $('#Mascota_raza').val(ui.item.id); // HTML-Id del campo
       }"
      ),
     
    'htmlOptions'=> array(
       //  'onchange'=>'borrarcodigo()',
     'class'=>'span11',
     'size'=>80,
//     'placeholder'=>'Buscar cliente...',
     'title'=>'Coloque la raza a buscar'
     ),
   ));  }
 else {

   $raza=RazaMascota::model()->find("id=$model->raza");
   echo $form->textField($model,'raza_descripcion',array('class'=>'span11','value'=>$raza->descripcion,'readonly'=>true));
 }
?>
    </div>
</div>    
<div class="row-fluid">
    <div class="span3">
  <?php echo $form->labelEx($model,'fecha_nacimiento'); ?>
	<?php  $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                           'model'=>$model,
                           'attribute'=>'fecha_nacimiento',
                           'value'=>$model->fecha_nacimiento,
                           'language' => 'es',
                           'htmlOptions' => array('readonly'=>"readonly",'class'=>'span11','onchange'=>'calculaedad()'),
                             //additional javascript options for the date picker plugin
                           'options'=>array(
                          
                           'autoSize'=>true,
                           'defaultDate'=>$model->fecha_nacimiento,
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
 <!--    <div class="span3"> -->
	<?php //echo $form->textFieldRow($model,'edad',array('class'=>'span11')); ?>
    <!-- </div> -->
    <div class="span3">
	        <?php echo $form->dropDownListRow($model,'clasificacion', CHtml::listData(EdadMascota::model()->findAll(array('order'=>'id asc')), 'id', 'tipo'), array('prompt' => 'Seleccione...','class'=>'span11')); ?>
    </div>
    <div class="span3">
	<?php echo $form->dropDownListRow($model,'sexo', CHtml::listData(Sexo::model()->findAll(array('condition'=>'id in (3,4)','order'=>'descripcion asc')), 'id', 'descripcion'), array('prompt' => 'Seleccione...','class'=>'span11')); ?>
    </div>
</div>    
<div class="row-fluid">
    <div class="span3">
	<?php echo $form->textFieldRow($model,'color',array('class'=>'span11','maxlength'=>100)); ?>
    </div>
    <div class="span3">
		<?php echo $form->dropDownListRow($model,'esterilizado', CHtml::listData(SiNo::model()->findAll(array('order'=>'descripcion asc')), 'id', 'descripcion'), array('class'=>'span11')); ?>
    </div>
    <div class="span3">
	<?php echo $form->textFieldRow($model,'longitud',array('class'=>'span11')); ?>
    </div>
    <div class="span3">
	<?php echo $form->dropDownListRow($model,'longitud_medida', CHtml::listData(UnidadMedida::model()->findAll(array('condition'=>'id in (2)','order'=>'descripcion asc')), 'id', 'descripcion'), array('class'=>'span11')); ?>
    </div>
</div>    
<div class="row-fluid">
    <div class="span3">
	<?php echo $form->textFieldRow($model,'peso',array('class'=>'span11')); ?>
    </div>
    <div class="span3">
	<?php echo $form->dropDownListRow($model,'peso_medida', CHtml::listData(UnidadMedida::model()->findAll(array('condition'=>'id in (1)','order'=>'descripcion asc')), 'id', 'descripcion'), array('class'=>'span11')); ?>
    </div>
    <div class="span3">
	<?php echo $form->textFieldRow($model,'foto',array('class'=>'span11','maxlength'=>100)); ?>
    </div>
    <div class="span3">
	<?php echo $form->textAreaRow($model,'observacion',array('rows'=>6, 'cols'=>50, 'class'=>'span8')); ?>
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

<input type="hidden" id="fecha_actual" value="<?php echo date('d-m-Y');?>">

<?php $this->endWidget(); ?>
<?php $this->endWidget(); ?>


<script type="text/javascript">
function calculaedad() {

   
  f1 = $("#Mascota_fecha_nacimiento").val();
  f2 = $("#fecha_actual").val();
 
 // f2 =  [pad(d.getDate()), pad(d.getMonth()+1), d.getFullYear()].join('/');
 // f2 = moment().format('D MMM, YYYY');
 // aF2 =f2.getFullDay()+'-'+f2.getFullMonth()+'-'+f2.getFullYear();
  //alert (f2);
  aF1 = f1.split("-");
  aF2 = f2.split("-");
  
  numMeses = aF2[2]*12 + aF2[1] - (aF1[2]*12 + aF1[1]);
  if (aF2[0]<aF1[0]){
    numMeses = numMeses - 1;
  }
  
  if (numMeses <= 12){
     // alert('0.'+numMeses)
      $("#Mascota_edad").val('0.'+numMeses);
  } 
 else {
   numMeses = aF2[2]- aF1[2];
  if (aF2[0]<aF1[0] || aF2[1]<aF1[1] ){
      numMeses = aF2[2]*12 + aF2[1] - (aF1[2]*12 + aF1[1]);
  if (aF2[0]<aF1[0]){
    numMeses = numMeses - 1;
  }
numMes = numMeses.toString().split("");
  numMeses = numMes[0]+numMes[1];
  
  }

  // numMes = numMeses.toString().split("");
  // anyo = numMes[0]+numMes[1]; 
    // numMeses= numMeses/12;
      $("#Mascota_edad").val(numMeses);

  

 // }

 
     // alert(numMeses);
 }
}

</script>
