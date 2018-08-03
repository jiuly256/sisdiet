<?php /* @var $this Controller */ ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />

    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/styles.css" />
    <link rel="shortcut icon" href="<?php echo Yii::app()->request->baseUrl; ?>/images/obras2.png" type="image/x-icon" /> 
    <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl;?>/js/zeta.js"></script>

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>

	<?php Yii::app()->bootstrap->register(); ?>
</head>

<body>

<?php

 $id=Yii::app()->user->id;
    $id=0;
    $id = Yii::app()->user->id;
    if ($id!=""){
     $id=Yii::app()->user->id;
  $sql='select * from maquinaria.usuario where id='.$id.';';
    $connection=Yii::app()->db;
    $command=$connection->createCommand($sql);
    $row=$command->queryRow();
    $id_perfil=$row["id_perfil_direccion"];
    $perfil=$row["id_perfil"];
    $id_estado=$row["id_estado"];
    
  $sql1='select * from maquinaria.perfil_direccion where id_perfil_sistema='.$id_perfil.';';
    $connection=Yii::app()->db;
    $command=$connection->createCommand($sql1);
    $row=$command->queryRow();
    $nombre=$row["nombre_descripcion"];
//    echo $perfil;
      }else{$idu=0;$id_perfil=0; $nombre="";$perfil=0;}
     
      if ($perfil=='1' || $perfil=='5')
      {

   $this->widget('bootstrap.widgets.TbNavbar',array(
    'items'=>array(
        array(
            'class'=>'bootstrap.widgets.TbMenu',
            'items'=>array(
                        array('label'=>'Obra','url'=>array('/obra/admin'), 
                            'items'=>array(
                                 array('label'=>'Año 13-15', 'url'=>array('/obra/admin'),'visible'=>$id_perfil=='2'|| $id_perfil=='11' || $id_perfil=='13'),
                                 array('label'=>'Año 08-12', 'url'=>array('/obra/admin_4'),'visible'=>$id_perfil=='2'|| $id_perfil=='11' || $id_perfil=='13'),
                                 array('label'=>'Libro Diario', 'url'=>array('/actividadDiaria/admin'),'visible'=>$id_perfil=='2' || $id_perfil=='11' || $id_perfil=='13'),
                                 array('label'=>'Reporte de Ctm', 'url'=>array('/ctm/admin'),'visible'=>$id_perfil=='2'|| $id_perfil=='11' || $id_perfil=='13'),
   				 array('label'=>'Reporte General Material Actividad', 'url'=>array('/materialesActividad/admin'),'visible'=>$id_perfil=='2'|| $id_perfil=='11' || $id_perfil=='13'),
                                 array('label'=>'Inspecciones', 'url'=>array('/obra/admin_2'),'visible'=>$id_perfil=='2' || $id_perfil=='11' || $id_perfil=='6' || $id_perfil=='13'),
                                 array('label'=>'Valuaciones','url'=>array('/valuaciones/admin'),
                                     'items'=>array(
                                       array('label'=>'Punto de Cuenta', 'url'=>array('/tblpuntocuenta/admin'),'visible'=>$id_perfil=='2' || $id_perfil=='11' || $id_perfil=='6' || $id_perfil=='13'),  
                                              ),),
                                array('label'=>'Maquinaria','url'=>array('/sismaq/admin'), 'visible'=>$id_perfil=='2' || $id_perfil=='11' || $id_perfil=='13'),
                                array('label'=>'Planta','url'=>array('/tblplanta/admin'), 'visible'=>$id_perfil=='2' || $id_perfil=='11' || $id_perfil=='13'),
                                
                                        ),),
                             /////////////////    GRAFICAS   /////////////////////////////////
                               
                                array('label'=>'Gráficas','items'=>array(
                                array('label'=>'Grafica Por Estatus', 'url'=>array('/obra/pdfgrafica')), 
                                array('label'=>'Grafica Por Estatus Por Estado', 'url'=>array('/obra/pdfgrafica3')), 
                                array('label'=>'Grafica Por Inversion', 'url'=>array('/obra/pdfgrafica2')), 
                                        )),

			      array('label'=>'Sistema de Mantenimiento', 'items'=>array(
                              array('label'=>'Soluciones Viales', 'url'=>array('/actividadDiaria/admin_2')),
                              array('label'=>'Mantenimiento de Obras', 'url'=>array('/obramantenimiento/admin')),
                                      )), 
                              array('label'=>'Soporte','visible'=>!Yii::app()->user->isGuest,
                               'items'=>array(
                                    array('label'=>'Obras', 'items'=>array(
                                    array('label'=>'Estatus Obra', 'url'=>array('/estatusObra/admin')),
                                    array('label'=>'Ejercicio', 'url'=>array('/accionobra/admin')),
                                    array('label'=>'Tipo Obra', 'url'=>array('/clasificacionObra/admin')), 
                                    array('label'=>'Tipo de Vias', 'url'=>array('/troncalOVia/admin')),
		                    array('label'=>'Regiones', 'url'=>array('/tblRedi/admin')),
                                    array('label'=>'Regimen de seguimiento', 'url'=>array('/accionTipo/admin')),
                                    array('label'=>'Organismo Ejecutor', 'url'=>array('/enteEjecutor/admin')), 
                                    array('label'=>'Fuente Financiamiento', 'url'=>array('/fuenteFinanciamiento/admin')),
 				    array('label'=>'Historial de Obras', 'url'=>array('/obraAuditoria/admin'),'visible'=>$id_perfil=='2'|| $id_perfil=='11' || $id_perfil=='13'),
 				    array('label'=>'Historial de Actividades', 'url'=>array('/auditoriaActividad/admin'),'visible'=>$id_perfil=='2'|| $id_perfil=='11' || $id_perfil=='13'),
                                      )), 
                                    array('label'=>'Materiales', 'url'=>array('/tblmateriales/admin')), 

                                   ///////////////////////////   VALUACIONES  ////////////////////////////////////////////                        
                                   array('label'=>'Valuaciones','items'=>array(
                                   array('label'=>'Tipo Valuacion', 'url'=>array('/tipovaluacion/admin')), 
                                   array('label'=>'Estatus Vvaluacion', 'url'=>array('/estatusvaluacion/admin')), 
                                   array('label'=>'Tipo de Movimiento', 'url'=>array('/tipoMovimiento/admin')), 
                                     )),
                                   //////////////////////////  MAQUINARIA SISMAQ ///////////////////////////////////////////                        
                                  array('label'=>'Maquinaria', 'items'=>array( 
                                  array('label'=>'Estatus de la Maquinaria', 'url'=>array('/estatus/admin')), 
                                  array('label'=>'Operadores de Maquinaria', 'url'=>array('/funcionario/admin')),
                                  array('label'=>'Tipo de Maquinaria', 'url'=>array('/tblClase/admin')),     
                                  array('label'=>'Marca de Maquinaria', 'url'=>array('/tblModelo/admin')),     
                                  array('label'=>'Modelo Maquinaria', 'url'=>array('/tblTipoModelo/admin')), 
 				  array('label'=>'Listado de Custodia', 'url'=>array('/tblCustodia/admin')), 
                                      )),
                                  array('label'=>'Contratista', 'url'=>array('/tblContratista/admin')), 
                                  array('label'=>'Ingeniero',  'items'=>array( 
                                  array('label'=>'Ingeniero De Contacto', 'url'=>array('/ingContacto/admin')),
                                  array('label'=>'Cargos', 'url'=>array('/Cargo/admin')),  
                                      )),
                                  array('label'=>'Perfiles', 'url'=>array('/perfilDireccion/admin')), 
                                  array('label'=>'Usuario', 'url'=>array('/usuario/admin')),  
                            )),
                            array('label' => 'Cambiar Password', 'url' => array('/usuario/update_1/'.$id = Yii::app()->user->id), 'visible' =>  Yii::app()->authManager->checkAccess("Medio", Yii::app()->user->id)),   
                            array('label'=>'Inicio', 'url'=>array('/site/login'), 'visible'=>Yii::app()->user->isGuest),
                            array('label'=>'Salir ( '.Yii::app()->user->name.', Perfil: '.$nombre.' )', 'url'=>array('/site/logout'), 'visible'=>!Yii::app()->user->isGuest)
            ),
        ),
    ),
));    

   ?>

<div class="container" id="page">

	<?php if(isset($this->breadcrumbs)):?>
		<?php $this->widget('bootstrap.widgets.TbBreadcrumbs', array(
			'links'=>$this->breadcrumbs,
		)); ?><!-- breadcrumbs -->
	<?php endif?>

	<?php echo $content; ?>

	<div class="clear"></div>

	<div class="footer text-center">
                <?php echo CHtml::link('Cumpliendo con la Ley de InfoGobierno, publicado en Gaceta No. 406.192',
				'http://190.9.128.124/home/Ley%20Infogobierno_Gaceta%20Oficial.pdf?set_language=en&cl=en',array('target'=>'_blank')); ?><br/>
		<?php //echo Yii::powered(); ?>
		<i>Del Software Libre al Software Socialista</i><br/>
                Copyleft &copy; <?php echo date('Y'); ?> Ministerio del Poder Popular para Transporte y Obras Publicas.<br>
                    Desarrollado por:<b> Oficina de Tecnología de La Información y La Comunicación</b>
	</div><!-- footer --> 

</div><!-- page -->

</body>
      <?php 
      
      // ver perfil 4 y 3
      // ver perfil por defecto
      
      } ?>
</html>