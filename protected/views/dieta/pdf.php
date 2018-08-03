<?php
$pdf = Yii::createComponent('application.extensions.MPDF53.mpdf');
$id=Yii::app()->user->id;
$usuariosql= Usuario::model()->find('id='.$id.'');
$usuario=$usuariosql->str_nombre.' '.$usuariosql->str_apellido;
// $url=Yii::app()->request->baseUrl;
// echo $url;
  $html='   <link rel="stylesheet" type="text/css" href="'.Yii::app()->request->baseUrl.'/css/pdf.css" />
   '; 

// <table id="yw0" class="detail-view">
// <tr class="principal">
// <td colspan="2" align="center"><b>Dieta</b></td>
// <tr>

// </table>

// ';

$dieta= Vistadetalle::model()->find('id='.$_GET['id']);
//echo "<pre>"; print_r($dieta); exit;
$fecha=date('d-m-Y',strtotime($dieta->fecha));


$proteinas= DietaDetalle::model()->find('id_dieta='.$model->id.'');
//echo $proteinas->Alimento->descripcion;
//echo "<pre>"; print_r($proteinas); exit;



 $html.="

 <table class='table table-bordered table-hover'>
    <thead >
        <tr>
            <th  style='text-align: center'>Fecha</th>
            <th  style='text-align: center'>Nombre cliente</th>
            <th colspan='3' style='text-align: center'>Mascota</th>
            
        </tr>
    </thead>
    <tbody>
        <tr >
         <td rowspan='4' >$fecha</td>
         <td rowspan='4'>$dieta->nombre $dieta->apellido</td>
          <td class='info'><b>Nombre</b></td>
           <td>$dieta->nombre_mascota</td>
 		<td rowspan='4'>Imagen</td>         
        </tr>
          <tr class='info'>
           
          <td><b>Edad</b></td>
            <td>$dieta->tipo ($dieta->descripcion)</td>
          
        </tr>
          <tr class='active'>
         
          <td><b>Peso</b></td>
            <td>$dieta->peso $dieta->medida</td>
          
        </tr>
          <tr class='success'>
         
          <td><b>Porcion</b></td>
            <td>$dieta->porcion Gr</td>
         
        </tr>
     
    </tbody>
</table>";
 
 $proteinas= DietaDetalle::model()->findBySql('
select a.*,b.tipo_alimento from dieta_detalle a,alimento b where id_dieta='.$model->id.'
and a.id_alimento=b.id and b.tipo_alimento=1'); 
$proteinas_costo=number_format($proteinas->costo_gramos,2,",",".");
$alimento=$proteinas->Alimento->descripcion;
$cangramos=number_format($proteinas->cantidad_gramos,2,",",".");
$proteinas_precio=number_format($proteinas->precio_gramos,2,",",".");
$html.="<table class='table table-bordered table-hover'>
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
         <td >$alimento</td>
         <td >$cangramos</td>
         <td >$proteinas_costo</td>
         <td >$proteinas_precio</td>
               
        </tr>
             
    </tbody>
</table>";

$vegetales= DietaDetalle::model()->findAllBySql('
select a.*,b.tipo_alimento from dieta_detalle a,alimento b where id_dieta='.$model->id.'
and a.id_alimento=b.id and b.tipo_alimento>1'); 
$total=count($vegetales);
$cantidad=0;
$precio=0;
$precio_to=0;


 $html.="<table class='table table-bordered table-hover '>
    <thead >
        <tr class='info'>
            <th >Nombre Vegetales</th>
            <th >Cantidad en Gramos</th>
            <th >Costo por Gr</th>
            <th >Total BS</th>
          
        </tr>
    </thead>
    <tbody>";   
         for($i=0;$i<$total;$i++) { 
          $descripcion=$vegetales[$i]->Alimento->descripcion; 
          $gramos=number_format($vegetales[$i]->cantidad_gramos,2,",",".");
          $costo=number_format($vegetales[$i]->costo_gramos,2,",",".");
          $preciou=number_format($vegetales[$i]->precio_gramos,2,",",".");
     $html.="<tr >
        <td >$descripcion</td>
        <td >$gramos</td>
        <td >$costo</td>
        <td >$preciou</td>";
         $cantidad=$vegetales[$i]->cantidad_gramos+$cantidad;
         $precio+=$vegetales[$i]->costo_gramos; 
         $precio_to+=$vegetales[$i]->precio_gramos; 

         $cantidad=number_format($cantidad,2,",","."); 
         $preciof=number_format($precio,2,",","."); 
         $precio_tof=number_format($precio_to,2,",","."); 
        $html.="</tr>";
        
         }  
         $precio_diario=number_format($model->precio_diario,2,",",".");
         $dias=number_format($model->dias);
         $total_dias=number_format($model->precio_dias,2,",",".");
         $monto_iva=number_format($model->monto_iva,2,",",".");
         $precio_total=number_format($model->precio_total,2,",",".");
      $html.="<tr >
         <td ><b>Totales</b></td>
         <td >$cantidad</td>
         <td >$preciof</td>
         <td >$precio_tof</td>
              
        </tr>
            <tr >
         <td ></td>
         <td ></td>
         <td ><b>Total...</b></td>
         <td ><b>$precio_diario</b></td>
              
        </tr>
           <tr >
         <td ></td>
         <td ></td>
         <td ><b>Dias</b></td>
         <td ><b>$dias</b></td>
              
        </tr>
          <tr >
         <td ></td>
         <td ></td>
         <td ><b>Total por días</b></td>
         <td ><b>$total_dias</b></td>
              
        </tr>
            <tr >
         <td ></td>
         <td ></td>
         <td ><b>Iva 12 %</b></td>
         <td ><b>$monto_iva</b></td>
              
        </tr>
             <tr >
         <td ></td>
         <td ></td>
         <td ><b>Total a pagar</b></td>
         <td ><b>$precio_total</b></td>
              
        </tr>
    </tbody>

</table>";

$mpdf=new mPDF('win-1252','LETTER','','',15,15,25,12,5,7);
$mpdf->WriteHTML($html);
$mpdf->Output('Ficha-Contrato-'.$model->id.'.pdf','D');

  //$mpdf=new mPDF('win-1252','LETTER','','',10,10,5,5,55,55);
$mpdf=new mPDF('win-1252','LETTER','','',5,5,25,12,5,7);
  //izq der banner
$header=$header.'<img width="100%" height="100" src="images/banner.png">';
  $mpdf->SetHTMLHeader($header);
//$mpdf->SetDisplayMode('fullpage');
//$mpdf->SetMargins($left, $right, $top=50);
$mpdf->SetAutoPageBreak($auto,$margin=95);
  $mpdf->SetFooter('Creado por: {DATE j/m/Y}|Página {PAGENO}/{nbpg}|Sysdiet');
  $mpdf->WriteHTML($header.$html);
  $mpdf->Output('Reporte_dieta_'.$dieta->nombre.$dieta->apellido.'_'.$fecha.'.pdf','D');
//echo $html; 

exit;
