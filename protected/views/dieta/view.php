<?php
$this->breadcrumbs=array(
	'Dietas'=>array('index'),
	$model->id,
);

$this->menu=array(
	//array('label'=>'List Dieta','url'=>array('index')),
	array('label'=>'Registrar Dieta','url'=>array('dietaDetalle/create')),
	array('label'=>'Actualizar Dieta','url'=>array('update','id'=>$model->id)),
//	array('label'=>'Delete Dieta','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Dieta','url'=>array('admin')),
);
?>

<!-- <h1 style="text-align: center">Dieta #<?php echo $model->id; ?></h1> -->
<?php

 $dietadeta= DietaDetalle::model()->findBySql('
select a.*,b.tipo_alimento from dieta_detalle a,alimento b where id_dieta='.$model->id.'
and a.id_alimento=b.id'); 

if (count($dietadeta)<=0){
    echo "No hay informacion que mostrar"; exit;
}else {

$dieta= Vistadetalle::model()->find('id='.$_GET['id']);
//echo "<pre>"; print_r($dieta); exit;
$fecha=date('d-m-Y',strtotime($dieta->fecha));


$proteinas= DietaDetalle::model()->find('id_dieta='.$model->id.'');
//echo $proteinas->Alimento->descripcion;
//echo "<pre>"; print_r($proteinas); exit;
?>


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
         <td rowspan="4"><?=$fecha?></td>
         <td rowspan="4"><?=$dieta->nombre.' '.$dieta->apellido?></td>
          <td class="info"><b>Nombre</b></td>
           <td><?=$dieta->nombre_mascota?></td>
 		<td rowspan="4">Imagen</td>         
        </tr>
          <tr class="success">
           
          <td><b>Edad</b></td>
            <td><?=$dieta->tipo.' ('.$dieta->descripcion.')'?></td>
          
        </tr>
          <tr class="active">
         
          <td><b>Peso</b></td>
            <td><?=$dieta->peso.' '.$dieta->medida?></td>
          
        </tr>
          <tr class="success">
         
          <td><b>Porción</b></td>
            <td><?=$dieta->porcion?> Gr</td>
         
        </tr>
     
    </tbody>
</table>
<?php 
$this->widget('bootstrap.widgets.TbButton', array(
    'label'=>'NUTRIPETS',
    'type'=>'primary', // null, 'primary', 'info', 'success', 'warning', 'danger' or 'inverse'
    //'size'=>'large',
    'icon'=>'icon-plus',
    'url' => array('/dietaDetalle/create2/id2/'.$model->id)
// null, 'large', 'small' or 'mini'
)); 

?>
<?php $proteinas= DietaDetalle::model()->findBySql('
select a.*,b.tipo_alimento from dieta_detalle a,alimento b where id_dieta='.$model->id.'
and a.id_alimento=b.id and b.tipo_alimento=1'); 


?>

 <!--<table class="table table-bordered table-hover">
    <thead>
        <tr>
            <th >Nombre Proteinas</th>
            <th >Cantidad en Gramos</th>
            <th >Costo por Gr</th>
            <th >Total BS</th>
          
        </tr>
    </thead>
    <tbody>
        <tr >
         <td ><?=$proteinas->Alimento->descripcion?></td>
         <td ><?=$proteinas->cantidad_gramos?></td>
         <td ><?=number_format($proteinas->costo_gramos,2,",",".")?></td>
         <td ><?=number_format($proteinas->precio_gramos,2,",",".")?></td>
               
        </tr>
             
    </tbody>
</table> -->

<?php $vegetales= DietaDetalle::model()->findAllBySql('
select a.*,b.tipo_alimento from dieta_detalle a,alimento b where id_dieta='.$model->id.'
and a.id_alimento=b.id and b.tipo_alimento between 0 and 6 '); ?>


<?php $total=count($vegetales);
$cantidad=0;
$precio=0;
$precio_to=0;
?>

<?php $premio= DietaDetalle::model()->findAllBySql('
select a.*,b.tipo_alimento from dieta_detalle a,alimento b where id_dieta='.$model->id.'
and a.id_alimento=b.id and b.tipo_alimento =7 '); ?>
<?php // echo "<pre>"; print_r($premio); exit; ?>
<?php $totalpremio=count($premio);
//echo $totalpremio; exit;
$cantidadpremio=0;
$preciopremio=0;
$precio_topremio=0;
?>
<?php // echo $vegetales[0]->costo_gramos;exit;?>

 <table class="table table-bordered table-hover">
    <thead>
        <tr>
            <th >Descripcion</th>
            <th >Cantidad</th>
            <th >Dias</th>
            <th >Total</th>
            <th >Total por dias BS</th>
          
        </tr>
    </thead>
    <tbody>   
        <?php for($i=0;$i<$total;$i++) { ?>
     <!--   <tr >
          <td ><?php echo $vegetales[$i]->Alimento->descripcion; ?></td>
         <td ><?php echo $vegetales[$i]->cantidad_gramos; ?></td>
         <td ><?=number_format($vegetales[$i]->costo_gramos,2,",",".")?></td>
         <td ><?=number_format($vegetales[$i]->precio_gramos,2,",",".")?></td>
         <?php $cantidad=$vegetales[$i]->cantidad_gramos+$cantidad; ?>
         <?php $precio=$vegetales[$i]->costo_gramos+$precio; ?>
         <?php $precio_to=($vegetales[$i]->precio_gramos)+$precio_to; ?>
        </tr> -->
        
         <?php } ?> 
        <!--   <tr >
         <td ><b>Totales</b></td>
         <td ><?=number_format($cantidad,2,",",".")?></td>
         <td ><?=number_format($precio,2,",",".")?></td>
         <td ><?=number_format($precio_to,2,",",".")?></td>
              
        </tr> -->
        <?php

        $dietasub= DietaSubdieta::model()->findAll('id_dieta='.$model->id);
        $totaldietasub=count($dietasub);
//echo $totalpremio; exit;
        $cantidadietasub=0;
        $preciodietasub=0;
        $precio_todietasub=0;
        ?>
         

          <?php for($i=0;$i<$totaldietasub;$i++) { ?>
        <tr >
          <td ><?php echo $dietasub[$i]->descripcion; ?></td>
         <td ><?php echo "1"; ?></td>
         <td ><?=number_format($dietasub[$i]->dias)?></td>
         <td ><?=number_format($dietasub[$i]->total/$dietasub[$i]->dias,2,",",".")?></td>
         <td ><b><?=number_format($dietasub[$i]->total,2,",",".")?></b></td>

        </tr> 
        <?php } ?>
          <?php 
          if ($totalpremio>>0){
          //  echo $totalpremio; exit;
       

          foreach ($premio as $p ) {
            $cantidadpremio=$p->cantidad_gramos+$cantidad;
           $preciopremio=$p->costo_gramos+$precio; 
           $precio_topremio=($p->precio_gramos)+$precio_to;
          ?>
        <tr >
          <td ><?php echo $p->Alimento->descripcion; ?></td>
         <td ><?php echo $p->cantidad_gramos; ?></td>
         <td></td>
         <td ><?=number_format($p->costo_gramos,2,",",".")?></td>
         <td ><b><?=number_format($p->precio_gramos,2,",",".")?></b></td>
         <?php $cantidadpremio=$p->cantidad_gramos+$cantidad; ?>
         <?php $preciopremio=$p->costo_gramos+$precio; ?>
         <?php $precio_topremio=($p->precio_gramos)+$precio_to; ?>
        </tr> 
        
         <?php }} else {
           // echo "no"; exit;
            } ?> 
        <!--<tr >
         <td ></td>
         <td ></td>
         <td ></td>
         <td ></td>
         <!--<td ><b>Dias</b></td>
         <td ><b><?=number_format($model->dias)?></b></td>-->
              
        <!--</tr>-->
 
         <tr >
         <td ></td>
         <td ></td>
         <td ></td>
         <td ><b>Sub-total</b></td>
         <td ><b><?=number_format($model->precio_dias,2,",",".")?></b></td>
              
        </tr> 
            <tr >
         <td ></td>
         <td ></td>
         <td ></td>
         <td ><b>Iva 12 %</b></td>
         <td ><b><?=number_format($model->monto_iva,2,",",".")?></b></td>
              
        </tr>
             <tr >
         <td ></td>
         <td ></td>
         <td ></td>
         <td ><b>Total a pagar</b></td>
         <td ><b><?=number_format($model->precio_total,2,",",".")?></b></td>
              
        </tr>
    </tbody>
</table>
<table>
<tr>
<td>
<?php
 CHtml::link('Desplegar para el Reporte','#',array('class'=>'search-button btn'));
$this->widget('bootstrap.widgets.TbButtonGroup', array(
  'type' => 'action', // '', 'primary', 'info', 'success', 'warning', 'danger' or 'inverse'
  'buttons' => array(
    array('label' => 'Reporte', 'type'=>'success', 'icon' => 'icon-file icon-white', 'items' => array(
      array('label' => 'Imprimir', 'icon' => 'icon-print', 'target'=>'_blank', 'url' => array('dieta/pdf', 'id'=>$model->id)),

    )),
  ),
));
}

?>
</td>
<td>
<?php
$factura= Factura::model()->find('id_dieta='.$model->id.' and estatus=1') ;
if (!isset($factura)){
$this->widget('bootstrap.widgets.TbButton', array(
    'label'=>'Generar Factura',
    'type'=>'info', // null, 'primary', 'info', 'success', 'warning', 'danger' or 'inverse'
    //'size'=>'large',
    'icon'=>'icon-list',
    'url' => array('/factura/create/','id'=>$model->id)
// null, 'large', 'small' or 'mini'
)); 

}else{
 $this->widget('bootstrap.widgets.TbButton', array(
    'label'=>'Imprimir Factura',
    'type'=>'info', // null, 'primary', 'info', 'success', 'warning', 'danger' or 'inverse'
    //'size'=>'large',
    'icon'=>'icon-print',
    'url' => array('/factura/pdf_factura/','id'=>$factura->id_factura)
// null, 'large', 'small' or 'mini'
));   
} 
?>
</td>
<td>
<?php
$this->widget('bootstrap.widgets.TbButton', array(
    'label'=>'Ver Detalle',
    'type'=>'info', // null, 'primary', 'info', 'success', 'warning', 'danger' or 'inverse'
    //'size'=>'large',
    'icon'=>'icon-arrow-right',
    'url' => array('/dieta/view2/','id'=>$model->id)
// null, 'large', 'small' or 'mini'
));   

?>
</td>
</tr>
</table>