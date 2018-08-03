<?php

ini_set('memory_limit','20000M');
ini_set('max_execution_time ','0');

 $pdf = Yii::createComponent('application.extensions.MPDF53.mpdf');
 
 
 $dataProvider = $_SESSION['datos_filtrados']->getData();
 //$contador=count($dataProvider);
 //echo $contador; exit;
 
 $id=Yii::app()->user->id;
     
  $i=0;
  $val=count($dataProvider);

 while($i<$val){
    
     $img=$dataProvider[$i]["imagen"];
     $img2=$dataProvider[$i]["imagen8"];
     $estatus=$dataProvider[$i]["id_estatus_obra_fk"];
     //$img=number_format($model->monto,2,',','.')$dataProvider[$i][";
      $fecha= date("d-m-Y",strtotime($dataProvider[$i]["fechainicio"]));
      $fecha2= date("d-m-Y",strtotime($dataProvider[$i]["fechacul"]));
      $estado=$dataProvider[$i]["Estado"]["descripcion"];
      $municipio=$dataProvider[$i]["Municipio"]["descripcion"];
      $ubicacion=$dataProvider[$i]["str_ubicacion"];
     
  $html.='   <link rel="stylesheet" type="text/css" href="'.Yii::app()->request->baseUrl.'/css/pdf.css" />
 
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

          <table id="yw0" class="detail-view2">
          <tr>
                
                <th colspan="3" align="center" class="grande"><b>FICHA TÉCNICA - POLÍTICA DE LA OBRA</b></th>
          </tr>
     </table><div class="detail-view2"></div>     
      

        <table id="yw0" class="detail-view2">
          <tr>
            <td  class="titulo" width="60%" >
                    
                    <b>
                    Nombre de la Obra:
                    </b>
                    </div>
                    </td>
            <td  class="titulo" ><b>Ubicación Geográfica:</b></td>
            <td  class="titulo"><b>Empresa Encargada:</b></td>
           </tr>
          <tr>
            <td  class="centro" width="60%"> '.$dataProvider[$i]["str_descripcion"].'</td>
            <td  class="centro" >'.$estado.','.$municipio.','.$ubicacion.'</td>
            <td  class="centro" >'.$dataProvider[$i]["Contratista"]["nomb_empr"].'</td>
          </tr>
          </table>
 
<div class="detail-view2"></div> 
          <table id="yw0" class="detail-view2">
          <tr>
            <td  class="titulo" width="40%"><b>Código Contrato: '.$dataProvider[$i]["str_codigo_contrato"].'</b></td>
            <td  class="titulo" colspan="1"><b>Situación de la Obra:</b>
        
           
            ';
            if($estatus==20){

            $html.='
            
            <input type="checkbox"  checked="checked">En Ejecución
            <input type="checkbox">Paralizada
            <input type="checkbox">Prorroga de Ejecución
            <input type="checkbox">Culminada</td>
            
            ';
            }
            else if($estatus==12){

            $html.='
            
          <input type="checkbox"  checked="checked">En Ejecución
                 <input type="checkbox">Paralizada
            <input type="checkbox">Por Iniciar
            <input type="checkbox">Culminada</td>
            
            ';
            }
            else if($estatus==18){

            $html.='
            
            <input type="checkbox"  >En Ejecución
            <input type="checkbox" checked="checked">Paralizada
            <input type="checkbox">Por Iniciar
            <input type="checkbox">Culminada</td>
            
            ';
            }
            else if($estatus==17){

            $html.='
            
            <input type="checkbox"  >En Ejecución
            <input type="checkbox" >Paralizada
            <input type="checkbox" checked="checked">Por Iniciar
            <input type="checkbox">Culminada</td>
            
            ';
            }
            else if($estatus==14){

            $html.='
            
            <input type="checkbox"  >En Ejecución
            <input type="checkbox" >Paralizada
            <input  type="checkbox">Por Iniciar
            <input type="checkbox" checked="checked">Culminada</td>
            ';
            }
            else{

            $html.='
            
            <input type="checkbox"  >En Ejecución
            <input type="checkbox" >Paralizada
            <input type="checkbox" >Por Iniciar
            <input type="checkbox" >Culminada
            
            </td>';
            }


          $html.='
          </tr>
          </table> 
           
          <table id="yw0" class="detail-view2">
          <tr>
          <td class="titulog" colspan="2"><b>Inversión:</b></td>
          <td class="titulog" colspan="3"><b>% de Avance Físico:</b></td>
          <th class="pequeña" colspan="2"><b>MEMORIA FOTOGRÁFICA</b></th>
          </tr>
         
          <tr>
          <td class="centro"  colspan="2"><b>'.$dataProvider[$i]["monto"].'</b></td>
          <td class="centro" colspan="3"><b>'.$dataProvider[$i]["db_avance_fisico"].' %.</b></td>';
          
           if($img!=''){
            $html.='<td   class="centro" colspan="2" rowspan="6" width="60%" height="30%"><img   width="300" align="center" src="'.Yii::app()->request->baseUrl.'./foto/'.$img.'"/></td>';
           }else{
            $html.='<td   class="centro" colspan="2" rowspan="6" width="60%"><img   width="300" align="center" src="'.Yii::app()->request->baseUrl.'./foto/sin_imagen.jpg"/></td>';
            }
          $html.='
          </tr>
          <tr>
            <td  class="titulog" ><b>Fecha de Inicio:</b></td>
            <td  class="titulog" colspan="2"><b>Fecha de Culminación:</b></td>
            <td  class="titulog" colspan="2"><b>Lapso de Ejecución:</b></td>
           </tr>
          <tr>
            <td  class="centro" colspan="1">'.$fecha.'</td>
            <td  class="centro" colspan="2">'.$fecha2.'</td>
            <td  class="centro" colspan="2">'.$dataProvider[$i]["str_lapso_ejecucion"].'</td>
           
           </tr>
          <tr>
            <td  class="titulog" colspan="5"><b>Datos de Interes:</b></td>
           </tr>
          <tr>
            <td  class="centro2" colspan="5">'.$dataProvider[$i]["txt_avances_impacto"].'</td>
            
           </tr>
           <tr>
            <th class="pequeña" colspan="5"><b>IMPACTO SOCIAL</b></th>
           </tr>
            <tr>
          <td class="titulog"  style="width:60%;"><b>Empleos Directos:</b></td>
          <td class="titulog"  style="width:50%;" colspan="4"><b>Empleos Indirectos:</b></td>
          ';
           if($img2!=''){
            $html.='<td   class="centro" colspan="3" rowspan="6" width="60%"><img   width="300" align="center" src="'.Yii::app()->request->baseUrl.'./foto/'.$img2.'"/></td>';
            }else{
            $html.='<td   class="centro" colspan="3" rowspan="6" width="60%"><img   width="300" align="center" src="'.Yii::app()->request->baseUrl.'./foto/sin_imagen.jpg"/></td>';
            }
          $html.='</tr>
            <tr>
          <td class="centro" style="width:60%;">'.$dataProvider[$i]["db_empleo_directo"].'</td>
          <td class="centro" style="width:50%;" colspan="4">'.$dataProvider[$i]["db_empleo_indirecto"].'</td>
          <td ></td>
          </tr>
          <tr>
          <td class="titulog" ><b>Sectores Atendidos:</b></td>
          <td class="titulog" colspan="4"><b>Usuarios Beneficiados:</b></td>
          </tr>
          <tr>
          <td class="centro" >'.$dataProvider[$i]["txt_sectores_atendidos"].'</td>
          <td class="centro" colspan="4">'.$dataProvider[$i]["db_cantidad_beneficiario"].'</td>
          </tr>
       
          <tr>
           <th class="pequeña"  ><b>INGENIERO RESIDENTE</b></th>
            <th class="pequeña" colspan="4"  style="width:50%;"><b>INGENIERO INSPECTOR</b></th>
           </tr>
           <tr>
           <td class="centro"  style="width:10%;">'.$dataProvider[$i]["Residente"]["nombre"].' '.$dataProvider[$i]["Residente"]["telefono"].'</td>
          <td class="centro" colspan="4" style="width:50%;">'.$dataProvider[$i]["idContacto"]["nombre"].' '.$dataProvider[$i]["idContacto"]["telefono"].'</td>
          </tr>
          </table>';  
         $i++;
 
 }

 
$header=$header.'<img width="100%" height="100" src="http://172.31.8.150/banner/banner.png">';
  $mpdf=new mPDF('win-1252','LETTER-L','','',5,5,35,8,5,5);
  $mpdf->SetHTMLHeader($header);
//$mpdf->SetDisplayMode('fullpage');
//$mpdf->SetMargins($left, $right, $top=50);
$mpdf->SetAutoPageBreak($auto,$margin=95);
  $mpdf->SetFooter('Creado por: '. $usuario.' {DATE j/m/Y}|Página {PAGENO}/{nbpg}|Sismaq');
  $mpdf->WriteHTML($html);
  $mpdf->Output('Reporte_maquinarias.pdf','D');
 exit;
?>
         
