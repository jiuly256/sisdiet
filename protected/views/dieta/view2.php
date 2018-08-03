<?php
$this->breadcrumbs=array(
	'Dietas'=>array('index'),
	$model->id,
);

$this->menu=array(
	//array('label'=>'List Dieta','url'=>array('index')),
	array('label'=>'Registrar Dieta','url'=>array('create')),
	array('label'=>'Actualizar Dieta','url'=>array('update','id'=>$model->id)),
//	array('label'=>'Delete Dieta','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Dieta','url'=>array('admin')),
);
?>

<!-- <h1 style="text-align: center">Dieta #<?php echo $model->id; ?></h1> -->
<?php
$dieta= Vistadetalle::model()->find('id='.$_GET['id']);
//echo "<pre>"; print_r($dieta); exit;
$fecha=date('d-m-Y',strtotime($dieta->fecha));


$proteinas= DietaDetalle::model()->find('id_dieta='.$model->id.'');
//echo $proteinas->Alimento->descripcion;
//echo "<pre>"; print_r($proteinas); exit;
?>

<!-- <h1>Detalle</h1>
 --><table class="table table-bordered table-hover">
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
<?php $proteinas= DietaDetalle::model()->findAllBySql('
select a.*,b.tipo_alimento from dieta_detalle a,alimento b where id_dieta='.$model->id.'
and a.id_alimento=b.id and b.tipo_alimento=1'); 


//echo "<pre>"; print_r($proteinas); exit;
?>

<!-- <h1>Detalle</h1>
 --><table class="table table-bordered table-hover">
    <thead>
        <tr>
            <th >Nombre Proteinas</th>
            <th >Cantidad en Gramos</th>
            <th >Costo por Gr</th>
            <th >Total BS</th>
          
        </tr>
    </thead>
    <tbody>
    <?php foreach ($proteinas as $p=>$value): ?>
        <tr >
         <td ><?=$proteinas[$p]->Alimento->descripcion?></td>
         <td ><?=$proteinas[$p]->cantidad_gramos?></td>
         <td ><?=number_format($proteinas[$p]->costo_gramos,2,",",".")?></td>
         <td ><?=number_format($proteinas[$p]->precio_gramos,2,",",".")?></td>
               
        </tr>
     <?php endforeach; ?>      
    </tbody>
</table>

<?php $vegetales= DietaDetalle::model()->findAllBySql('
select a.*,b.tipo_alimento from dieta_detalle a,alimento b where id_dieta='.$model->id.'
and a.id_alimento=b.id and b.tipo_alimento in(0,2,3,4,5,7) '); ?>

<?php $total=count($vegetales);
$cantidad=0;
$precio=0;
$precio_to=0;
?>
<?php // echo $vegetales[0]->costo_gramos;exit;?>
<!-- <h1>Detalle</h1>
 --><table class="table table-bordered table-hover">
    <thead>
        <tr>
            <th >Nombre Vegetales</th>
            <th >Cantidad en Gramos</th>
            <th >Costo por Gr</th>
            <th >Total BS</th>
          
        </tr>
    </thead>
    <tbody>   
        <?php for($i=0;$i<$total;$i++) { ?>
        <tr >
          <td ><?php echo $vegetales[$i]->Alimento->descripcion; ?></td>
         <td ><?php echo $vegetales[$i]->cantidad_gramos; ?></td>
         <td ><?=number_format($vegetales[$i]->costo_gramos,2,",",".")?></td>
         <td ><?=number_format($vegetales[$i]->precio_gramos,2,",",".")?></td>
         <?php $cantidad=$vegetales[$i]->cantidad_gramos+$cantidad; ?>
         <?php $precio=$vegetales[$i]->costo_gramos+$precio; ?>
         <?php $precio_to=($vegetales[$i]->precio_gramos)+$precio_to; ?>
        </tr>
        
         <?php } ?> 
           <tr >
         <td ><b>Totales</b></td>
         <td ><?=number_format($cantidad,2,",",".")?></td>
         <td ><?=number_format($precio,2,",",".")?></td>
         <td ><?=number_format($precio_to,2,",",".")?></td>
              
        </tr>
            <tr >
         <td ></td>
         <td ></td>
         <td ><b>Total...</b></td>
         <td ><b><?=number_format($model->precio_diario,2,",",".")?></b></td>
              
        </tr>
           <tr >
         <td ></td>
         <td ></td>
         <td ><b>Dias</b></td>
         <td ><b><?=number_format($model->dias)?></b></td>
              
        </tr>
          <tr >
         <td ></td>
         <td ></td>
         <td ><b>Total por días</b></td>
         <td ><b><?=number_format($model->precio_dias,2,",",".")?></b></td>
              
        </tr>
            <tr >
         <td ></td>
         <td ></td>
         <td ><b>Iva 12 %</b></td>
         <td ><b><?=number_format($model->monto_iva,2,",",".")?></b></td>
              
        </tr>
             <tr >
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
<?php CHtml::link('Desplegar para el Reporte','#',array('class'=>'search-button btn'));
$this->widget('bootstrap.widgets.TbButtonGroup', array(
  'type' => 'action', // '', 'primary', 'info', 'success', 'warning', 'danger' or 'inverse'
  'buttons' => array(
    array('label' => 'Reporte', 'type'=>'success', 'icon' => 'icon-file icon-white', 'items' => array(
      array('label' => 'Imprimir', 'icon' => 'icon-print', 'target'=>'_blank', 'url' => array('dieta/pdf', 'id'=>$model->id)),
      

    )),
  ),
));
?>            
        </td>
        <td>
<?php
$this->widget('bootstrap.widgets.TbButton', array(
    'label'=>'Atras',
    'type'=>'info', // null, 'primary', 'info', 'success', 'warning', 'danger' or 'inverse'
    //'size'=>'large',
    'icon'=>'icon-arrow-left',
    'url' => array('/dieta/view/','id'=>$model->id)
// null, 'large', 'small' or 'mini'
));   

?>            
        </td>
    </tr>

</table>


<?php
//  $this->widget('bootstrap.widgets.TbDetailView',array(
// 	'data'=>$model,
// 	'attributes'=>array(
// 		'id',
// 		'fecha',
// 		'id_cliente',
// 		'id_mascota',
// 		'precio_diario',
// 		'dias',
// 		'precio_dias',
// 		'iva',
// 		'monto_iva',
// 		'precio_total',
// 		'created_date',
// 		'modified_date',
// 		'created_by',
// 		'modified_by',
// 	),
// )); ?>
