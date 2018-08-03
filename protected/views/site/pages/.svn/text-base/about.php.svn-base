<?php
$this->pageTitle=Yii::app()->name . ' - Inicio';
$this->breadcrumbs=array(
	'index',
);
Yii::app()->clientScript->registerScript('scroll', "
        $('div.demo marquee').marquee('pointer', 40).mouseover(function () {
            $(this).trigger('stop');
        }).mouseout(function () {
            $(this).trigger('start');
        });
");
Yii::app()->clientScript->registerScriptFile(Yii::app()->baseUrl . '/js/jquery.marquee.js');
?>


<div class="row"> 
    <div class="span8">
        <div class="well">
           <center><h1><i><?php echo CHtml::encode(Yii::app()->name); ?></i></h1></center>

<br><br> <b>OFICINA DE TECNOLOGÍA DE INFORMACIÓN Y DESARROLLO ORGANIZACIONAL</b><br>
<b>   DIRECCIÓN DE SISTEMAS DE INFORMACIÓN.</b><br><br>
<b>   DIVISIÓN DE ANÁLISIS Y DESARROLLO DE SISTEMAS.</b><br>
<br>

<br>
 EXT: 34016 ---  34075 --- 34057<br>
        </div>
    </div>
    <div class="span3">
        <div class="demo well">
            <h4 class="alert-heading" style="margin-bottom: 50px"><b>Colaboradores:</b></h4>
            <marquee scrollamount="1" behavior="scroll" direction="down"  height="125">
                <p>
                    Zuleima Mendez     <br/>
                    Jiuly Rojas        <br/>
                    Francisco Garcia   <br/>
                    Andres Serrano     <br/>
                    Horacio Barrera    <br/>
                    Maria Ruiz         <br/>
                    Krupskaia Murillo  <br/>
                    Raul Tasigchana  <br/>

                </p>
            </marquee>
        </div>
    </div>
</div>
