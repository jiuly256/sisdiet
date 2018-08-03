<?php
$this->breadcrumbs=array(
	'Porcions'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
//	array('label'=>'List Porcion','url'=>array('index')),
	//array('label'=>'Create Porcion','url'=>array('create')),
//	array('label'=>'View Porcion','url'=>array('view','id'=>$model->id)),
//	array('label'=>'Manage Porcion','url'=>array('admin')),
);
?>

<h1 style="text-align: center">Actualizar Porcion <?php echo $model->id; ?></h1>

<?php
$peso= Porcion::model()->findBySql("
select (a.cantidad || ' ' || a.medida) as cantidad,b.tipo,c.* from peso_mascota a, edad_mascota b, porcion c
where a.id=c.id_peso and b.id=c.id_edad and c.id=$model->id");

//echo "<pre>"; print_r($peso); exit;
?>

<!-- <h1>Detalle</h1>
 --><table class="table table-bordered table-hover">
    <thead>
        <tr>
            <th >Peso</th>
            <th >Edad Mascota</th>
       
        </tr>
    </thead>
    <tbody>
        <tr class="success">
         <td ><?=$peso->cantidad?></td>
         <td ><?=$peso->tipo?></td>
         
         
        </tr>
     
    </tbody>
</table>


<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>