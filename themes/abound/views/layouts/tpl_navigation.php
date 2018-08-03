<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
    <div class="container">
        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
     
          <!-- Be sure to leave the brand out there if you want it shown -->
          <a class="brand" href="#">SysDiet - <small>Control de Dieta para mascotas</small></a>
          
          <div class="nav-collapse">
			<?php
             
 $id=Yii::app()->user->id;
    $id=0;
    $id = Yii::app()->user->id;
    if ($id!=""){
     $id=Yii::app()->user->id;
  $sql='select * from usuario where id='.$id.';';
    $connection=Yii::app()->db;
    $command=$connection->createCommand($sql);
    $row=$command->queryRow();
    $perfil=$row["id_perfil"];
    

    $cuentao=0;
    $nombre=0;
      }else{$idu=0;$id_perfil=0; $nombre="";$perfil=0;$cuentao=0;}           
                        
                        
                        
                        $this->widget('zii.widgets.CMenu',array(
                    'htmlOptions'=>array('class'=>'pull-right nav'),
                    'submenuHtmlOptions'=>array('class'=>'dropdown-menu'),
					'itemCssClass'=>'item-test',
                    'encodeLabel'=>false,
                    'items'=>array(
//                        array('label'=>'Obras <span class="badge badge-info pull-right">'.$cuentao.'</span>', 'url'=>array('/obra/admin')),
//                        array('label'=>'Contrato', 'url'=>array('/contrato/admin')),
//                        array('label'=>'Graphs & Charts', 'url'=>array('/site/page', 'view'=>'graphs')),
//                        array('label'=>'Forms', 'url'=>array('/site/page', 'view'=>'forms')),
//                        array('label'=>'Tables', 'url'=>array('/site/page', 'view'=>'tables')),
//						array('label'=>'Interface', 'url'=>array('/site/page', 'view'=>'interface')),
////                        array('label'=>'Typography', 'url'=>array('/site/page', 'view'=>'typography')),
//                        array('label'=>'Gii generated', 'url'=>array('customer/index')),
                        array('label'=>'Cliente', 'url'=>array('/cliente/create', 'visible' => !Yii::app()->user->isGuest)),
                        array('label'=>'Mascota', 'url'=>array('/mascota/admin', 'visible' => !Yii::app()->user->isGuest)),
                         array('label'=>'Alimento', 'url'=>array('/alimento/admin', 'visible' => !Yii::app()->user->isGuest)),
                        
                          array('label'=>'Compras', 'url'=>array('/entradaAlmacen/admin', 'visible' => !Yii::app()->user->isGuest)),
                         array('label'=>'Dieta', 'url'=>array('/dieta/admin', 'visible' => !Yii::app()->user->isGuest)),
                        array('label'=>'Mantenimiento <span class="caret"></span>', 'url'=>'#','itemOptions'=>array('class'=>'dropdown','tabindex'=>"-1"),'linkOptions'=>array('class'=>'dropdown-toggle','data-toggle'=>"dropdown"), 
                        'items'=>array(
     array('label'=>'Porcion', 'url'=>array('/porcion/admin', 'visible' => !Yii::app()->user->isGuest)),
                                  array('label'=>'Usuario', 'url'=>array('/usuario/admin')),  
                             array('label' => 'Cambiar Password', 'url' => array('/usuario/update_1/'.$id = Yii::app()->user->id), 'visible' => !Yii::app()->user->isGuest),  
                   
                        )),
            
                           
                          array('label'=>'Inicio', 'url'=>array('/site/login'), 'visible'=>Yii::app()->user->isGuest),
                          array('label'=>'Salir ( '.Yii::app()->user->name.' )', 'url'=>array('/site/logout'), 'visible'=>!Yii::app()->user->isGuest)
                    ),
                )); ?>
    	</div>
    </div>
	</div>
</div>

<div class="subnav navbar navbar-fixed-top" >
<!--    <div class="navbar-inner">
    	<div class="container" >
        
        	<div class="style-switcher pull-left" >
                <a href="javascript:chooseStyle('none', 60)" checked="checked"><span class="style" style="background-color:#0088CC;"></span></a>
                <a href="javascript:chooseStyle('style2', 60)"><span class="style" style="background-color:#7c5706;"></span></a>
                <a href="javascript:chooseStyle('style3', 60)"><span class="style" style="background-color:#468847;"></span></a>
                <a href="javascript:chooseStyle('style4', 60)"><span class="style" style="background-color:#4e4e4e;"></span></a>
                <a href="javascript:chooseStyle('style5', 60)"><span class="style" style="background-color:#d85515;"></span></a>
                <a href="javascript:chooseStyle('style6', 60)"><span class="style" style="background-color:#a00a69;"></span></a>
                <a href="javascript:chooseStyle('style7', 60)"><span class="style" style="background-color:#a30c22;"></span></a>
          	</div>
           <form class="navbar-search pull-right" action="">
           	 
           <input type="text" class="search-query span2" placeholder="Buscar">
           
           </form>
    	</div> container 
    </div> navbar-inner -->
    
</div><!-- subnav -->