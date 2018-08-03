<?php /* @var $this Controller */ ?>
<?php $this->beginContent('//layouts/main'); ?>

  <div class="row-fluid">
        <div class="span2" id="dashboardj">
		<div class="sidebar-nav">
        
		  <?php $this->widget('zii.widgets.CMenu', array(
			/*'type'=>'list',*/
			'encodeLabel'=>false,
			'items'=>array(
				array('label'=>'<i class="icon icon-home"></i>  Dieta <span class="label label-info pull-right">Importantes</span>', 'url'=>array('/dieta/admin'),'itemOptions'=>array('class'=>'')),
				array('label'=>'<i class="icon icon-search"></i>  Mascota <span class="label label-warning pull-right">ver</span>', 'url'=>array('/mascota/admin'),'itemOptions'=>array('class'=>'')),
        array('label'=>'<i class="icon icon-search"></i>  Porciones <span class="label label-success pull-right">ver</span>', 'url'=>array('/porcion/admin'),'itemOptions'=>array('class'=>'')),
        array('label'=>'<i class="icon icon-print"></i>  Facturas <span class="label label-info pull-right">Imprimir</span>', 'url'=>array('/factura/admin'),'itemOptions'=>array('class'=>'')),

//				array('label'=>'<i class="icon icon-search"></i> About this theme <span class="label label-important pull-right">HOT</span>', 'url'=>'http://www.webapplicationthemes.com/abound-yii-framework-theme/'),
				// Include the operations menu
				array('label'=>'ACCIONES','items'=>$this->menu),
			),
			));?>
<?php
$alimentos=DietaDetalle::model()->findAllBySql('select a.id_alimento,b.descripcion,count(a.*) as cuenta from dieta_detalle a,alimento b
where a.id_alimento=b.id
GROUP BY id_alimento,descripcion
ORDER BY cuenta Desc limit 5');
if ($alimentos && count($alimentos)==5){

$por0=100;

$por1=($alimentos[1]->cuenta*100)/$alimentos[0]->cuenta;

$por2=($alimentos[2]->cuenta*100)/$alimentos[0]->cuenta;

$por3=($alimentos[3]->cuenta*100)/$alimentos[0]->cuenta;

$por4=($alimentos[4]->cuenta*100)/$alimentos[0]->cuenta;

$desc1=$alimentos[0]->descripcion;
$desc2=$alimentos[1]->descripcion;
$desc3=$alimentos[2]->descripcion;
$desc4=$alimentos[3]->descripcion;
$desc5=$alimentos[4]->descripcion;

}else{
$por0=0;

$por1=0;

$por2=0;

$por3=0;

$por4=0;

$desc1='';
$desc2='';
$desc3='';
$desc4='';
$desc5='';
}

//echo $por4; exit;
// 5 --------- 100
// 1--------- x
// x= 100/5 =20 %

?>
  </div>
        <br>
        <table class="table table-striped table-bordered">
          <tbody>
            <tr>
              <td width="50%"><?=$desc1?></td>
              <td>
                <div class="progress progress-success">
                  <div class="bar" style="width: <?=$por0?>%"></div>
                </div>
              </td>
            </tr>
            <tr>
              <td><?=$desc2?></td>
              <td>
              <div class="progress progress-warning">
                  <div class="bar" style="width: <?=$por1?>%"></div>
                </div>
              </td>
            </tr>
            <tr>
              <td><?=$desc3?></td>
              <td>
              <div class="progress progress-danger">
                  <div class="bar" style="width: <?=$por2?>%"></div>
                </div>
              </td>
            </tr>
            <tr>
              <td><?=$desc4?></td>
              <td>
                <div class="progress progress-info">
                  <div class="bar" style="width: <?=$por3?>%"></div>
                </div>
              </td>
            </tr>
            <tr>
              <td><?=$desc5?></td>
              <td>
                <div class="progress progress-primary">
                  <div class="bar" style="width: <?=$por4?>%"></div>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
    <div class="well">
   <?php 
$dieta=Dieta::model()->findBySql('select sum(round( CAST(float8 (precio_total::numeric) as numeric), 2)) as precio_total,avg(round( CAST((dias::integer) as integer))) as dias from dieta');
if ($dieta->precio_total!=''){
$vistadetalle=Vistadetalle::model()->findBySql('SELECT nombre,apellido,count(*) as  cuenta
FROM vistadetalle
GROUP BY nombre,apellido
ORDER BY cuenta DESC');


  $totalsuma=$dieta->precio_total;
  $dias=$dieta->dias;
  $cliente=$vistadetalle->nombre.' '.$vistadetalle->apellido;
}else{


  $totalsuma=0;
  $dias=0;
  $cliente='';
}
   ?>     
            <dl >
              <dt>Total vendido</dt>
              <dd>Bs. <?=number_format($totalsuma,2,",",".")?></dd>
              <dt>Promedio dias</dt>
              <dd><?=number_format($dias,0,",",".")?></dd>
              <dt>Mejor cliente</dt>
              <dd><?=$cliente?></dd>
              
            </dl>
      </div>           
        <?php
        
//              $sql="select count(*) from maquinaria.obra where bln_borrado=false";
//                    $connection=Yii::app()->db;
//                    $command=$connection->createCommand($sql);
//                    $row=$command->queryRow();
//                    $total=$row['count'];
//                
//          $sql1="select b.str_descripcion as estatus,count (a.*) as cuenta 
//        from maquinaria.obra a,maquinaria.estatus_obra b where a.id_estatus_obra_fk=b.id_estatus_obra_fk and a.bln_borrado=false
//        group by b.str_descripcion,a.id_estatus_obra_fk order by estatus";
//                $connection=Yii::app()->db;
//                $command=$connection->createCommand($sql1);
//                $row=$command->queryAll();
////                echo print_r($row1); exit;
//                $contar=count($row);
////                echo $contar; exit;
//                if ($contar>0){
//                $a=0;
//                $html='';
//                while ($a<$contar){
//                    $nombre=$row[$a]['estatus'];
//                    $valor=$row[$a]['cuenta'];
//                    $valorr=number_format(($valor*100/$total), 2, '.', '');
//                    
//                 $html.='<tr>
//                  <td width="50%">'.$nombre.'</td>
//                  <td>';
//                   if ($nombre=='CULMINADA'){
//                   $html.=' <div class="progress progress-success">';
//                   }else if ($nombre=='EN EJECUCIÓN'){
//                   $html.=' <div class="progress progress-info">';
//                   }else if ($nombre=='PARALIZADA'){
//                   $html.=' <div class="progress progress-danger">';
//                   }else if ($nombre=='POR INICIAR'){
//                   $html.=' <div class="progress progress-warning">';
//                   }else if ($nombre=='EJECUCION DISCONTINUA'){
//                   $html.=' <div class="progress progress-warning">';
//                   }else if ($nombre=='EN ESTUDIO'){
//                   $html.=' <div class="progress progress-success">';
//                   }else if ($nombre=='EN RESCISION'){
//                   $html.=' <div class="progress progress-info">';
//                   }else {
//                        $html.=' <div class="progress progress-info">';
//                   }
//                   
//                   $html.=' <div class="bar" style="width: '.$valorr.'%"> </div>
//                    </div>
//                  </td>
//                    </tr>';
//                      
//                    $a++;;
//                    
//                    }
//                  echo $html;
//                } else {}
                ?>
                 </tbody>
                </table>

	
		
    </div><!--/span-->
    <div class="span9">
    
   
    
    <!-- Include content pages -->
    <?php echo $content; ?>

	</div><!--/span-->
  </div><!--/row-->


<?php $this->endContent(); ?>