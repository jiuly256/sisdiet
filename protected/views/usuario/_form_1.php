
<?php
     
    //echo $id;
 ?>
<script  type="text/javaScript">
function mensaje(){
if ($("#repita").val()==$("#Usuario_password").val())  {}  
else {
alert("Las claves deben coincidir");
}
}
</script>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
        'id'=>'usuario-form',
        'enableAjaxValidation'=>false,
)); ?>

    <p class="note">Campos con <span class="required">*</span> son obligatorios.</p>

        <?php echo $form->errorSummary($model); ?>
 
        <fieldset>
         
        <div class="row">
           
             <table cellspacing="3" bgcolor="#D7D8D2">
           <tr>      
           <td>      
            <?php if ($model->isnewrecord == TRUE) {?>
                <?php echo $form->labelEx($model,'username'); ?>
                <?php echo $form->textField($model,'username',array('size'=>23,'maxlength'=>50)); ?>
                <?php echo $form->error($model,'username'); ?>
       
                 
                <?php }else{?>
                      <?php echo $form->labelEx($model,'username'); ?>
                      <?php echo $form->textField($model,'username',array('size'=>23,'maxlength'=>50,'readonly'=>true)); ?>
                      <?php echo $form->error($model,'username'); ?>
               <?php }?>
               </td>
               </tr>
               <tr>
        <td>
                <?php echo $form->labelEx($model,'Nueva Clave'); ?>
                <?php echo $form->passwordField($model,'password',array('size'=>23,'maxlength'=>50,'value'=>''));  ?>
                <?php echo $form->error($model,'password'); ?>
       
        </td>
        <tr>
        <td>
       <b>Repita la nueva clave</b><br>
       <input type="password" id="repita" name="repita" size="23" maxlength="50" onblur="mensaje()">
           
        </td></tr>
      <!--  <td>
            <input type="text" name="confirmacion" id="confirmacion" >
        </td>    -->
               
               </tr>
               
     
    </table>
        </fildset>
        <div class="row buttons">
        <center>        <?php
       
       echo CHtml::submitButton($model->isNewRecord ? 'Guardar' : 'Guardar'); ?>
        </div>
        </center>
            </div>
<?php $this->endWidget(); ?>

</div><!-- form -->
 
