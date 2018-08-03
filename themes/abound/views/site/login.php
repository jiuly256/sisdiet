<?php
/* @var $this SiteController */
/* @var $model LoginForm */
/* @var $form CActiveForm  */

$this->pageTitle=Yii::app()->name . ' - Login';
$this->breadcrumbs=array(
	'Login',
);
?>
<head>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/login.css" />
</head>

<!--<div class="page-header">
	<h1>Iniciar  <small>Sesión</small></h1>
</div>-->
<div class="row-fluid">
	
    <div class="span6 offset3">
		<center>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <img width="19%" class="logo" src="../../images/logo.png">
                </center>
        </div>
    <div class="span6 offset3">
<?php
	$this->beginWidget('zii.widgets.CPortlet', array(
		'title'=>"Iniciar sesión",
	));
	
?>

    <!--<p>Por Favor Introduzca sus Datos:</p>-->
    
    <div class="form">
    <?php $form=$this->beginWidget('CActiveForm', array(
        'id'=>'login-form',
        'enableClientValidation'=>true,
        'clientOptions'=>array(
            'validateOnSubmit'=>true,
        ),
    ));
    
        foreach (Yii::app()->user->getFlashes() as $key => $message)
    {
        echo '<div class="success flash-'.$key.'">'.$message."</div>\n";
    }
    ?>
       <div class="alert alert-info"><i class="icon-info-sign"></i> Los campos con <span class="required">*</span> son obligatorios.</div>
    <center>
    
        <?php echo $form->labelEx($model,'username'); ?>
       <div class="input-append">
       <?php echo $form->textField($model, 'username', array('class'=>'input-append', 'placeholder'=>'Escriba su nombre de usuario')); ?>
       <span class="add-on"><i class="icon icon-user"></i></span>
       </div>
         <?php echo $form->error($model,'username'); ?>
         <?php echo $form->labelEx($model,'password'); ?>
        <div class="input-append">
            <?php echo $form->passwordField($model,'password', array('placeholder'=>'Escriba su contraseña')); ?>
            <span class="add-on"><i class="icon icon-lock"></i></span>
        </div>
        <?php echo $form->error($model,'password'); ?>
    
        <div class="row rememberMe">
            <?php echo $form->checkBox($model,'rememberMe'); ?>
            <?php echo $form->label($model,'rememberMe'); ?>
            <?php echo $form->error($model,'rememberMe'); ?>
        </div>
    
        <div class="row buttons">
            <?php echo CHtml::submitButton('Entrar',array('class'=>'btn btn btn-primary')); ?>
        </div>
    </center>
    <?php $this->endWidget(); ?>
    </div><!-- form -->

<?php $this->endWidget();?>

    </div>

</div>