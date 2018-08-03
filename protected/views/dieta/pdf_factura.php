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

$cliente= Cliente::model()->find('id='.$model->id_cliente);
//echo "<pre>"; print_r($cliente); exit;

$dietasubdieta= DietaSubdieta::model()->findAll('id_dieta='.$model->id);
$descripcion= $dietasubdieta['0']->descripcion;
$cuenta=count($dietasubdieta);
$suma=0;
foreach ($dietasubdieta as $key => $value) {

    $suma+=$dietasubdieta[$key]->total;
}
$sumaf=number_format($suma,2,',','.');
//echo "<pre>"; print_r($dietasubdieta); exit;

$premios= DietaDetalle::model()->findAllBySql('select * from dieta_detalle,alimento where id_dieta='.$model->id.'
and alimento.id=dieta_detalle.id_alimento
and alimento.tipo_alimento=7');
$descripcionp= 'PREMIO';
$cuentap=count($premios);
$sumap=0;
foreach ($premios as $key => $value) {

    $sumap+=$premios[$key]->precio_gramos;
}
$sumapf=number_format($sumap,2,',','.');

$sumasubtotal=$suma+$sumap;
$sumasubtotalf=number_format($sumasubtotal,2,',','.');
$iva=$sumasubtotal*0.12;
$ivaf=number_format($iva,2,',','.');
$total=$sumasubtotal+$iva;
$totalf=number_format($total,2,',','.');

$fecha=date('d/m/Y',strtotime($model->fecha));
 $html.="
 <br/><br/><br/>
 <table>
     <tr>
            <td style='width:25cm'></td>
            <td class='titulo'><b>$model->id</b></td>
     </tr>
</table>

<br/><br/><br/><br/>
 <table>
     <tr>   
            <td style='width:20cm'></td>
            <td ><b>Fecha</b></td>
            <td ><b>$fecha</b></td>
     </tr>
</table>


 <table width='50%' class='detail-view2' id='yw0'>
        <tr>
            <td rowspan='4' class='titulo'><b>Datos del Cliente</b></td>
            <td class=''>Nombre o Razón social</td>
            <td class=''>$dieta->nombre $dieta->apellido</td>
        </tr>
        <tr>
            <td class=''>RIF/CI</td>
            <td class=''>$cliente->cedula</td>
        </tr>
        <tr>
            <td class=''>Domicilio</td>
            <td class=''>$cliente->direccion</td>
        </tr>    
        <tr>
            <td class=''>Telefono</td>
            <td class=''>$cliente->telefono</td>
        </tr>
       
 </table>                       
<br/><br/>     
<table width='60%' class='detail-view2' id='yw0'>
        <tr>
            <td><b>Cantidad(Cant)</b></td>
            <td>$cuenta</td>
        </tr>
        <tr>
            <td><b>Descripcion</b></td>
            <td>$descripcion</td>
        </tr>
        <tr>
            <td><b>Precio Unitario</b></td>
            <td>$sumaf</td>
        </tr> ";
        if ($cuentap>0){
        $html.= "
        <tr>
            <td><b>Cantidad(Cant)</b></td>
            <td>$cuentap</td>
        </tr>
        <tr>
            <td><b>Descripcion</b></td>
            <td>$descripcionp</td>
        </tr>
        <tr>
            <td><b>Precio Unitario</b></td>
            <td>$sumapf</td>
        </tr> "; }
 $html.= "
        <tr>
            <td><b>% Alic</b></td>
            <td>12 %</td>
        </tr>
        <tr>
            <td><b>Subtotal</b></td>
            <td>$sumasubtotalf</td>
        </tr>
        <tr>
            <td><b>Iva</b></td>
            <td>$ivaf</td>
        </tr>  
        <tr>
            <td><b>Total</b></td>
            <td>$totalf</td>
        </tr>  

    
 </table>        
";
 
 



  //$mpdf=new mPDF('win-1252','LETTER','','',10,10,5,5,55,55);

  //izq der banner
//$header=$header.'<img width="100%" height="100" src="images/banner.png">';
 // $mpdf->SetHTMLHeader($header);
//$mpdf->SetDisplayMode('fullpage');
//$mpdf->SetMargins($left, $right, $top=50);
//$mpdf->SetAutoPageBreak($auto,$margin=95);
//  $mpdf->SetFooter('Creado por: {DATE j/m/Y}|Página {PAGENO}/{nbpg}|Sysdiet');
$mpdf=new mPDF('win-1252','LETTER-L','','',5,5,45,20,5,7);
  $mpdf->WriteHTML($html);
  $mpdf->Output("Reporte_dieta_$dieta->nombre.$dieta->apellido_$fecha.pdf",'D');
//echo $html; 

exit;
