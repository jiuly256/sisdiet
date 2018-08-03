<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id),array('view','id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_dieta')); ?>:</b>
	<?php echo CHtml::encode($data->id_dieta); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_alimento')); ?>:</b>
	<?php echo CHtml::encode($data->id_alimento); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cantidad_gramos')); ?>:</b>
	<?php echo CHtml::encode($data->cantidad_gramos); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('costo_gramos')); ?>:</b>
	<?php echo CHtml::encode($data->costo_gramos); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('precio_gramos')); ?>:</b>
	<?php echo CHtml::encode($data->precio_gramos); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('created_date')); ?>:</b>
	<?php echo CHtml::encode($data->created_date); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('modified_date')); ?>:</b>
	<?php echo CHtml::encode($data->modified_date); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('created_by')); ?>:</b>
	<?php echo CHtml::encode($data->created_by); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('modified_by')); ?>:</b>
	<?php echo CHtml::encode($data->modified_by); ?>
	<br />

	*/ ?>

</div>