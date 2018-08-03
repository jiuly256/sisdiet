<?php
$pdf = Yii::createComponent('application.extensions.MPDF53.mpdf');

//$id=Yii::app()->user->id;
//$usuariosql= Usuario::model()->find('id='.$id.'');
//$usuario=$usuariosql->str_nombre.' '.$usuariosql->str_apellido;
// $url=Yii::app()->request->baseUrl;
// echo $url;
$html='   <link rel="stylesheet" type="text/css" href="'.Yii::app()->request->baseUrl.'/css/pdf.css" />'; 

$sumaf=number_format($model->precio,2,',','.');
$sumapf=number_format($model->preciop,2,',','.');
$sumasubtotalf=number_format($model->subtotal,2,',','.');
$ivaf=number_format($model->iva,2,',','.');
$totalf=number_format($model->total,2,',','.');
$fecha=date('d/m/Y',strtotime($model->fecha));
$tipopago=Tipopago::model()->find('id='.$model->tipo_pago);

 $html.="
 <br/><br/><br/>
 <table>
     <tr>
            <td style='width:18cm'></td>
            <td class='titulo'><b>Factura: $model->id_factura</b></td>
     </tr>
</table>

<br/><br/><br/><br/>
 <table>
     <tr>   
            <td style='width:15cm'></td>
            <td >Fecha: </td>
            <td ><b>$fecha</b></td>
     </tr>
     <tr>   
            <td style='width:15cm'></td>
            <td >Tipo de pago: </td>
            <td ><b>$tipopago->descripcion</b></td>
     </tr>
</table>


 <table class='detail-view2' id='yw0'>
        <tr>
            <td rowspan='4' class='titulo'><b>Datos del Cliente</b></td>
            <td class=''>Nombre o Razón social</td>
            <td class=''>$model->nombre</td>
        </tr>
        <tr>
            <td class=''>RIF/CI</td>
            <td class=''>$model->rif</td>
        </tr>
        <tr>
            <td class=''>Domicilio</td>
            <td class=''>$model->domicilio</td>
        </tr>    
        <tr>
            <td class=''>Telefono</td>
            <td class=''>$model->telefono</td>
        </tr>
       
 </table>                       
<br/><br/>     
<table class='detail-view2' id='yw0'>
        <tr>
            <td><b>Cantidad(Cant)</b></td>
            <td>$model->cantidad</td>
        </tr>
        <tr>
            <td><b>Descripcion</b></td>
            <td>$model->descripcion</td>
        </tr>
        <tr>
            <td><b>Precio Unitario</b></td>
            <td>$sumaf</td>
        </tr> ";
        if ($model->cantidadp>0){
        $html.= "
        <tr>
            <td><b>Cantidad(Cant)</b></td>
            <td>$model->cantidadp</td>
        </tr>
        <tr>
            <td><b>Descripcion</b></td>
            <td>$model->descripcionp</td>
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
$mpdf=new mPDF('win-1252','LETTER','','',5,5,45,20,5,7);
  //izq der banner
$header='<img width="100%" height="100" src="images/banner.png">';
$mpdf->SetHTMLHeader($header);
//$mpdf->SetHTMLHeader($header);
//$mpdf->SetDisplayMode('fullpage');
//$mpdf->SetMargins($left, $right, $top=50);
//$mpdf->SetAutoPageBreak($auto,$margin=95);
$mpdf->SetFooter('Creado por: {DATE j/m/Y}|Página {PAGENO}/{nbpg}|Sysdiet');

  $mpdf->WriteHTML($header.$html);
  $mpdf->Output('Reporte_dieta_'.$model->nombre.'_'.$fecha.'.pdf','D');
//echo $html; 

exit;
