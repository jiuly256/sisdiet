<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id),array('view','id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_peso')); ?>:</b>
	<?php echo CHtml::encode($data->id_peso); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_edad')); ?>:</b>
	<?php echo CHtml::encode($data->id_edad); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cantidad_gramos')); ?>:</b>
	<?php echo CHtml::encode($data->cantidad_gramos); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('porcentaje_grasa')); ?>:</b>
	<?php echo CHtml::encode($data->porcentaje_grasa); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('porcentaje_proteina')); ?>:</b>
	<?php echo CHtml::encode($data->porcentaje_proteina); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('porcentaje_vegetal')); ?>:</b>
	<?php echo CHtml::encode($data->porcentaje_vegetal); ?>
	<br />


</div>