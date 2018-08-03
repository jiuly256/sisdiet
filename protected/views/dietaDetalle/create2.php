<?php
$this->breadcrumbs=array(
	'Dieta Detalles'=>array('index'),
	'Create',
);

$this->menu=array(
//	array('label'=>'List DietaDetalle','url'=>array('index')),
//	array('label'=>'Manage DietaDetalle','url'=>array('admin')),
);
?>

<?php
//echo $_GET['id']; exit;
$dieta= Vistadetalle::model()->find('id='.$_GET['id2']);
//echo "<pre>"; print_r($dieta); exit;
$fecha=date('d-m-Y',strtotime($dieta->fecha));
?>

<!-- <h1>Detalle</h1>
 -->
 <table class="table table-bordered table-hover">
    <thead>
        <tr>
            <th >Fecha</th>
            <th rowspan="4">Nombre cliente</th>
            <th >Mascota</th>
            
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
 
<?php echo $this->renderPartial('_form2', array('model'=>$model)); ?>