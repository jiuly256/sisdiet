function procesarCalculosTiendaVirtual(mensaje_final , primera_vez )
{
    var haberes = parseFloat(document.getElementById("haberes").value);
    document.getElementById( "creditoHtml").style.color='#000000';
    
  
    if( document.getElementById("efectivo").value=="" || document.getElementById("efectivo").value=="0" )
	  document.getElementById( "efectivo").value = "0,00";
  
    
    var efectivo = document.getElementById("efectivo").value; //12.4512,45
    if( efectivo!="0" && efectivo!="0,00" && efectivo!="" )
    {
	efectivo  = str_replace (".", "" , efectivo);  //124512,45
	efectivo  = str_replace (",", ".", efectivo);  //124512.45
	efectivo  = parseFloat(efectivo);
    }else
	efectivo  = 0;
    
    
    //Total compra
    total  = document.getElementById( "total").innerHTML;
    total  = str_replace(".", "" , total);  //124512,45
    total  = str_replace(",", ".", total);  //124512.45
    total  = parseFloat(total);
    
    
    //SI LA COMPRA ES POR EFECTIVO
    if( parseFloat(efectivo)==parseFloat(total) )
    {
	      document.getElementById("detallecredito").innerHTML="";
	      document.getElementById("tipo_credito").selectedIndex = "0";
    }
	      
    
    
    //VALIDANDO QUE EL EFECTIVO NO SEA MAYOR A AL MONTO TOTAL DE COMPRA
    //document.getElementById( "muestra").innerHTML = parseFloat(efectivo)+">="+parseFloat(total);
    if( parseFloat(efectivo)>parseFloat(total) )
    {
	  document.getElementById( "muestra").innerHTML     = "";
	  document.getElementById("efectivo").value         = number_format( parseFloat(total)  , 2, ",", ".");
	  document.getElementById( "creditoHtml").innerHTML = "0,00";
	  document.getElementById( "credito").value         = 0;
    }else
    if( parseFloat(efectivo)<=parseFloat(total) )
    {
	  
          var var_efectivo = 0;
	  var var_credito  = 0;
	  
	  if( primera_vez==1 ) //Si es primera vez que valida
	  {
		
		if( haberes>total )
		{
		    var_efectivo = total;
		    var_credito  = 0;
		}else
		if( haberes<=total )
		{
		    var_efectivo = haberes;
		    var_credito  = round( parseFloat(total)-parseFloat(haberes)   , 2 );
		}
	  }else
	  if( primera_vez==2 || primera_vez==3 ) //Si es segunda vez que valida
	  {
	      var_credito  = round(  parseFloat(total)-parseFloat(efectivo)  ,  2);
	  }
	  
	  if( parseFloat(var_credito)>parseFloat(haberes) )
	  {
		  //alert("El credito no puede ser mayor a los haberes")
		  document.getElementById( "creditoHtml").style.color='#FF0000'; 
	  }
	  
	  
	  document.getElementById( "creditoHtml").innerHTML =  number_format ( var_credito , 2, ",", ".");
	  document.getElementById( "credito").value         =  var_credito;
    }
    

    
    if( mensaje_final==1 ||  mensaje_final==3  )
    {  
	//VALIDANDO QUE EL EFECTIVO NO SEA MAYOR A AL MONTO TOTAL DE COMPRA
	if( parseFloat(efectivo)<parseFloat(total) )
	{ 
	      if( parseFloat(document.getElementById("credito").value)>parseFloat(haberes) )
	      {  
		  document.getElementById( "creditoHtml").style.color='#FF0000'; 
		  alert("El credito no puede ser mayor a los haberes")
	      }
	      else
	      {
		    if( parseFloat(document.getElementById("credito").value)>0 &&  parseFloat(document.getElementById( "tipo_credito").value)==0 )
		    {
			  alert("Debe seleccionar el tipo de credito")
		    }else
		    if( parseFloat(document.getElementById("credito").value)>0 &&  parseFloat(document.getElementById( "tipo_credito").value)>0 )
		    {
			  if( strlen(document.getElementById("Credito_cuenta").value)<20 )
			  {
				  alert("Debe colocar los 20 digitos del numero de cuenta");
			  }else
			  if( strlen(document.getElementById("Credito_cuenta").value)==20 )
			  {
			    	//document.calculadora.submit();
				
				document.getElementById("Credito_monto_credito").value = parseFloat(document.getElementById("credito").value);
				document.getElementById("totaldisponible").value       = parseFloat(document.getElementById("haberes").value);
				document.getElementById("Credito_tipo_credito").value  = parseFloat(document.getElementById( "tipo_credito").value);
				
				detallecredito(); //Activa ajax que calcula las cuotas
				
				if( primera_vez!=3 ) //Si es diferente del boton calcular
				{
				      if( document.getElementById("detallecredito").innerHTML!="" )
				      {
					      if(  !confirm("¿ Esta seguro de enviar la solicitudd ?" )  )
					      {
						    return false;
					      } 
					      else 
					      {
						    document.calculadora.submit();
					      }
				      }
				}
			  }
		    }
	      }
	}else
	if( parseFloat(efectivo)==parseFloat(total) )
	{
	      document.getElementById("detallecredito").innerHTML="";
	  
	      //alert("Todo bien decontado");
	      if(!confirm("¿ Esta seguro de enviar la solicitud ?")) 
	      {
		    return false;
	      } 
	      else 
	      {
		    document.calculadora.submit();
	      }
	}
    }
}


function validar_pago_contado()
{
    var mal=0;
  
    if( document.getElementById("PagoExtra_idbanco_destino").value=="" )
    {
	  alert("Debe seleccionar el banco")
	  mal++;
    }
    
    if( document.getElementById("PagoExtra_cuenta_destino").value=="" )
    {
	  alert("Debe colocar la cuenta")
	  mal++;
    }
    
    if( document.getElementById("PagoExtra_referencia").value=="" )
    {
	  alert("Debe colocar la referencia del pago")
	  mal++;
    }    
    
    if( document.getElementById("PagoExtra_fechapago").value=="" )
    {
	  alert("Debe colocar la fecha del pago")
	  mal++;
    }
    
    if( mal==0 )
    {
	  document.pago.submit();
    }
}


function habilitar_boton_calculo()
{
    if( parseFloat(document.getElementById("credito").value) >0   )
    {
	      document.getElementById("calcular_cuotas").style.display = "block";
	      if( strlen(document.getElementById("Credito_cuenta").value)==20 )
	      {
		  procesarCalculosTiendaVirtual(1,3)
	      }
    }
    else
    if( parseFloat(document.getElementById("credito").value) ==0  )
      	      document.getElementById("calcular_cuotas").style.display = "none";
}


function enviar_desde_calculos_credito()
{

}




function formateo_numeros(fld, milSep, decSep, e)
{
    if(  fld.value=="" )
    {
	 fld.value="0,00"; 
	 return true;
    }
    
    var tb = document.getElementById("efectivo");
    var cursor = -1;
  
    
    
    var whichCode = (window.Event) ? e.which : e.keyCode; 
	//alert(whichCode)
    
    //document.getElementById( "prueba").innerHTML = "<br>whichCode: "+whichCode;
    if (whichCode == 37 ) return true; // flecha izquierda
    if (whichCode == 39 ) return true; // flecha derecha
    if (whichCode == 13 ) return true; // Enter 
    if (whichCode == 8  ) return true; // Enter 
    if (whichCode == 127) return true; // Enter 	
    if (whichCode == 9  ) return true; // Enter
    if (whichCode == 0  ) return true; // Tabulador
    
    
    //0=>48  1=>49  2=>50  ......  9=>57      .=>190      ,188
    
    //          0 1 2 3 4 5 6 7 8 9                      .                 ,
    //if( (whichCode>=48 && whichCode<=57) || (whichCode==190 || whichCode==188) )
    if( (whichCode>=48 && whichCode<=57) )
    {
	var numero = fld.value;
	numero     = str_replace   (".", "" , numero);
	numero     = str_replace   (",", ".", numero);
	//numero     = parseFloat(numero)+0;
	
	//document.getElementById( "prueba").innerHTML = "<br>numeroSF: "+numero;
	
	//document.getElementById( "prueba").innerHTML = document.getElementById( "prueba").innerHTML+"<br>cursor: "+cursor;
	
	//numero_def = str_replace   (".", "", numero      );
	//numero_def = str_replace   (",", ".", numero_def );
	numero_def = number_format (numero, 2, ",", ".");
	
	
	
	fld.value  = numero_def;
	//fld.focus();
	
	//cursor = tb.selectionStart;
	//tb.selectionStart = cursor;
	document.getElementById( "prueba").innerHTML = "<br>P1: "+tb.selectionStart+"<br>P2: "+tb.selectionEnd;
	//selectionEnd
        
	
	
	return true;
    }else
	return false;
    
 
}



function currencyFormatTiendaVirtual(fld, milSep, decSep, e) 
{ 
    //procesarCalculosTiendaVirtual()
    var sep = 0; 
    var key = ''; 
    var i = j = 0; 
    var len = len2 = 0; 
    var strCheck = '0123456789'; 
    var aux = aux2 = ''; 
    var whichCode = (window.Event) ? e.which : e.keyCode; 
	//alert(whichCode)
    if (whichCode == 13 ) return true; // Enter 
    if (whichCode == 8  ) return true; // Enter 
    if (whichCode == 127) return true; // Enter 	
    if (whichCode == 9  ) return true; // Enter
    if (whichCode == 0  ) return true; // Tabulador

    key = String.fromCharCode(whichCode); // Get key value from key code 
    if (strCheck.indexOf(key) == -1)
	  return false; // Not a valid key 
	  
	  
	  
    len = fld.value.length; 
    for(i = 0; i < len; i++) 
      if ((fld.value.charAt(i) != '0') && (fld.value.charAt(i) != decSep)) break; 
    aux = ''; 
    
    for(; i < len; i++) 
	if (strCheck.indexOf(fld.value.charAt(i))!=-1) 
	      aux += fld.value.charAt(i); 
	
    aux += key;
    
    len = aux.length; 
    if (len == 0) fld.value = ''; 
    if (len == 1) fld.value = '0'+ decSep + '0' + aux; 
    if (len == 2) fld.value = '0'+ decSep +aux;
    if (len > 2) 
    { 
	aux2 = ''; 
	for (j = 0, i = len - 3; i >= 0; i--)
	{ 
	    if (j == 3)
	    { 
		aux2 += milSep; 
		j = 0; 
	    } 
	    aux2 += aux.charAt(i);
	    j++; 
	} 
	fld.value = ''; 
	len2 = aux2.length; 
	for (i = len2 - 1; i >= 0; i--) 
	  fld.value += aux2.charAt(i); 
	fld.value += decSep + aux.substr(len - 2, len); 
    } 
    //procesarCalculosTiendaVirtual();
    return false; 
}

function currencyFormat(fld, milSep, decSep, e) 
{ 
   //alert(milSep)
    var sep = 0; 
    var key = ''; 
    var i = j = 0; 
    var len = len2 = 0; 
    var strCheck = '0123456789'; 
    var aux = aux2 = ''; 
    var whichCode = (window.Event) ? e.which : e.keyCode; 
	//alert(whichCode)
    if (whichCode == 13) return true; // Enter 
	if (whichCode == 8) return true; // Enter 
	if (whichCode == 127) return true; // Enter 	
	if (whichCode == 9) return true; // Enter
	if (whichCode == 0) return true; // Tabulador
    key = String.fromCharCode(whichCode); // Get key value from key code 
    if (strCheck.indexOf(key) == -1) return false; // Not a valid key 
    len = fld.value.length; 
    for(i = 0; i < len; i++) 
     if ((fld.value.charAt(i) != '0') && (fld.value.charAt(i) != decSep)) break; 
    aux = ''; 
    for(; i < len; i++) 
     if (strCheck.indexOf(fld.value.charAt(i))!=-1) aux += fld.value.charAt(i); 
    aux += key; 
    len = aux.length; 
    if (len == 0) fld.value = ''; 
    if (len == 1) fld.value = '0'+ decSep + '0' + aux; 
    if (len == 2) fld.value = '0'+ decSep +aux;
    if (len > 2) { 
     aux2 = ''; 
     for (j = 0, i = len - 3; i >= 0; i--) { 
      if (j == 3) { 
       aux2 += milSep; 
       j = 0; 
      } 
      aux2 += aux.charAt(i);
      j++; 
     } 
     fld.value = ''; 
     len2 = aux2.length; 
     for (i = len2 - 1; i >= 0; i--) 
      fld.value += aux2.charAt(i); 
     fld.value += decSep + aux.substr(len - 2, len); 
    } 
    return false; 
}
   
   

function count (mixed_var, mode) {
  // http://kevin.vanzonneveld.net
  // +   original by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // +      input by: Waldo Malqui Silva
  // +   bugfixed by: Soren Hansen
  // +      input by: merabi
  // +   improved by: Brett Zamir (http://brett-zamir.me)
  // +   bugfixed by: Olivier Louvignes (http://mg-crea.com/)
  // *     example 1: count([[0,0],[0,-4]], 'COUNT_RECURSIVE');
  // *     returns 1: 6
  // *     example 2: count({'one' : [1,2,3,4,5]}, 'COUNT_RECURSIVE');
  // *     returns 2: 6
  var key, cnt = 0;

  if (mixed_var === null || typeof mixed_var === 'undefined') {
    return 0;
  } else if (mixed_var.constructor !== Array && mixed_var.constructor !== Object) {
    return 1;
  }

  if (mode === 'COUNT_RECURSIVE') {
    mode = 1;
  }
  if (mode != 1) {
    mode = 0;
  }

  for (key in mixed_var) {
    if (mixed_var.hasOwnProperty(key)) {
      cnt++;
      if (mode == 1 && mixed_var[key] && (mixed_var[key].constructor === Array || mixed_var[key].constructor === Object)) {
        cnt += this.count(mixed_var[key], 1);
      }
    }
  }

  return cnt;
}



function str_replace (search, replace, subject, count) 
{
  // http://kevin.vanzonneveld.net
  // +   original by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // +   improved by: Gabriel Paderni
  // +   improved by: Philip Peterson
  // +   improved by: Simon Willison (http://simonwillison.net)
  // +    revised by: Jonas Raoni Soares Silva (http://www.jsfromhell.com)
  // +   bugfixed by: Anton Ongson
  // +      input by: Onno Marsman
  // +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // +    tweaked by: Onno Marsman
  // +      input by: Brett Zamir (http://brett-zamir.me)
  // +   bugfixed by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // +   input by: Oleg Eremeev
  // +   improved by: Brett Zamir (http://brett-zamir.me)
  // +   bugfixed by: Oleg Eremeev
  // %          note 1: The count parameter must be passed as a string in order
  // %          note 1:  to find a global variable in which the result will be given
  // *     example 1: str_replace(' ', '.', 'Kevin van Zonneveld');
  // *     returns 1: 'Kevin.van.Zonneveld'
  // *     example 2: str_replace(['{name}', 'l'], ['hello', 'm'], '{name}, lars');
  // *     returns 2: 'hemmo, mars'
  var i = 0,
    j = 0,
    temp = '',
    repl = '',
    sl = 0,
    fl = 0,
    f = [].concat(search),
    r = [].concat(replace),
    s = subject,
    ra = Object.prototype.toString.call(r) === '[object Array]',
    sa = Object.prototype.toString.call(s) === '[object Array]';
  s = [].concat(s);
  if (count) {
    this.window[count] = 0;
  }

  for (i = 0, sl = s.length; i < sl; i++) {
    if (s[i] === '') {
      continue;
    }
    for (j = 0, fl = f.length; j < fl; j++) {
      temp = s[i] + '';
      repl = ra ? (r[j] !== undefined ? r[j] : '') : r[0];
      s[i] = (temp).split(f[j]).join(repl);
      if (count && s[i] !== temp) {
        this.window[count] += (temp.length - s[i].length) / f[j].length;
      }
    }
  }
  return sa ? s : s[0];
}


function explode (delimiter, string, limit) 
{
      if ( arguments.length < 2 || typeof delimiter === 'undefined' || typeof string === 'undefined' ) return null;
      if ( delimiter === '' || delimiter === false || delimiter === null) return false;
      if ( typeof delimiter === 'function' || typeof delimiter === 'object' || typeof string === 'function' || typeof string === 'object'){
	return { 0: '' };
      }
      if ( delimiter === true ) delimiter = '1';

      // Here we go...
      delimiter += '';
      string += '';

      var s = string.split( delimiter );


      if ( typeof limit === 'undefined' ) return s;

      // Support for limit
      if ( limit === 0 ) limit = 1;

      // Positive limit
      if ( limit > 0 ){
	if ( limit >= s.length ) return s;
	return s.slice( 0, limit - 1 ).concat( [ s.slice( limit - 1 ).join( delimiter ) ] );
      }

      // Negative limit
      if ( -limit >= s.length ) return [];

      s.splice( s.length + limit );
      return s; 
}



function number_format (number, decimals, dec_point, thousands_sep) {
  // http://kevin.vanzonneveld.net
  // +   original by: Jonas Raoni Soares Silva (http://www.jsfromhell.com)
  // +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // +     bugfix by: Michael White (http://getsprink.com)
  // +     bugfix by: Benjamin Lupton
  // +     bugfix by: Allan Jensen (http://www.winternet.no)
  // +    revised by: Jonas Raoni Soares Silva (http://www.jsfromhell.com)
  // +     bugfix by: Howard Yeend
  // +    revised by: Luke Smith (http://lucassmith.name)
  // +     bugfix by: Diogo Resende
  // +     bugfix by: Rival
  // +      input by: Kheang Hok Chin (http://www.distantia.ca/)
  // +   improved by: davook
  // +   improved by: Brett Zamir (http://brett-zamir.me)
  // +      input by: Jay Klehr
  // +   improved by: Brett Zamir (http://brett-zamir.me)
  // +      input by: Amir Habibi (http://www.residence-mixte.com/)
  // +     bugfix by: Brett Zamir (http://brett-zamir.me)
  // +   improved by: Theriault
  // +      input by: Amirouche
  // +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // *     example 1: number_format(1234.56);
  // *     returns 1: '1,235'
  // *     example 2: number_format(1234.56, 2, ',', ' ');
  // *     returns 2: '1 234,56'
  // *     example 3: number_format(1234.5678, 2, '.', '');
  // *     returns 3: '1234.57'
  // *     example 4: number_format(67, 2, ',', '.');
  // *     returns 4: '67,00'
  // *     example 5: number_format(1000);
  // *     returns 5: '1,000'
  // *     example 6: number_format(67.311, 2);
  // *     returns 6: '67.31'
  // *     example 7: number_format(1000.55, 1);
  // *     returns 7: '1,000.6'
  // *     example 8: number_format(67000, 5, ',', '.');
  // *     returns 8: '67.000,00000'
  // *     example 9: number_format(0.9, 0);
  // *     returns 9: '1'
  // *    example 10: number_format('1.20', 2);
  // *    returns 10: '1.20'
  // *    example 11: number_format('1.20', 4);
  // *    returns 11: '1.2000'
  // *    example 12: number_format('1.2000', 3);
  // *    returns 12: '1.200'
  // *    example 13: number_format('1 000,50', 2, '.', ' ');
  // *    returns 13: '100 050.00'
  // Strip all characters but numerical ones.
  number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function (n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}



function strlen(string) {
  //  discuss at: http://phpjs.org/functions/strlen/
  // original by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // improved by: Sakimori
  // improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  //    input by: Kirk Strobeck
  // bugfixed by: Onno Marsman
  //  revised by: Brett Zamir (http://brett-zamir.me)
  //        note: May look like overkill, but in order to be truly faithful to handling all Unicode
  //        note: characters and to this function in PHP which does not count the number of bytes
  //        note: but counts the number of characters, something like this is really necessary.
  //   example 1: strlen('Kevin van Zonneveld');
  //   returns 1: 19
  //   example 2: ini_set('unicode.semantics', 'on');
  //   example 2: strlen('A\ud87e\udc04Z');
  //   returns 2: 3

  var str = string + '';
  var i = 0,
    chr = '',
    lgth = 0;

  if (!this.php_js || !this.php_js.ini || !this.php_js.ini['unicode.semantics'] || this.php_js.ini[
    'unicode.semantics'].local_value.toLowerCase() !== 'on') {
    return string.length;
  }

  var getWholeChar = function(str, i) {
    var code = str.charCodeAt(i);
    var next = '',
      prev = '';
    if (0xD800 <= code && code <= 0xDBFF) { // High surrogate (could change last hex to 0xDB7F to treat high private surrogates as single characters)
      if (str.length <= (i + 1)) {
        throw 'High surrogate without following low surrogate';
      }
      next = str.charCodeAt(i + 1);
      if (0xDC00 > next || next > 0xDFFF) {
        throw 'High surrogate without following low surrogate';
      }
      return str.charAt(i) + str.charAt(i + 1);
    } else if (0xDC00 <= code && code <= 0xDFFF) { // Low surrogate
      if (i === 0) {
        throw 'Low surrogate without preceding high surrogate';
      }
      prev = str.charCodeAt(i - 1);
      if (0xD800 > prev || prev > 0xDBFF) { //(could change last hex to 0xDB7F to treat high private surrogates as single characters)
        throw 'Low surrogate without preceding high surrogate';
      }
      return false; // We can pass over low surrogates now as the second component in a pair which we have already processed
    }
    return str.charAt(i);
  };

  for (i = 0, lgth = 0; i < str.length; i++) {
    if ((chr = getWholeChar(str, i)) === false) {
      continue;
    } // Adapt this line at the top of any loop, passing in the whole string and the current iteration and returning a variable to represent the individual character; purpose is to treat the first part of a surrogate pair as the whole character and then ignore the second part
    lgth++;
  }
  return lgth;
}



function substr_count(haystack, needle, offset, length) 
{
  //  discuss at: http://phpjs.org/functions/substr_count/
  // original by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
  // bugfixed by: Onno Marsman
  // improved by: Brett Zamir (http://brett-zamir.me)
  // improved by: Thomas
  //   example 1: substr_count('Kevin van Zonneveld', 'e');
  //   returns 1: 3
  //   example 2: substr_count('Kevin van Zonneveld', 'K', 1);
  //   returns 2: 0
  //   example 3: substr_count('Kevin van Zonneveld', 'Z', 0, 10);
  //   returns 3: false

  var cnt = 0;

  haystack += '';
  needle += '';
  if (isNaN(offset)) {
    offset = 0;
  }
  if (isNaN(length)) {
    length = 0;
  }
  if (needle.length == 0) {
    return false;
  }
  offset--;

  while ((offset = haystack.indexOf(needle, offset + 1)) != -1) {
    if (length > 0 && (offset + needle.length) > length) {
      return false;
    }
    cnt++;
  }

  return cnt;
}




function round(value, precision, mode) {
  //  discuss at: http://phpjs.org/functions/round/
  // original by: Philip Peterson
  //  revised by: Onno Marsman
  //  revised by: T.Wild
  //  revised by: Rafał Kukawski (http://blog.kukawski.pl/)
  //    input by: Greenseed
  //    input by: meo
  //    input by: William
  //    input by: Josep Sanz (http://www.ws3.es/)
  // bugfixed by: Brett Zamir (http://brett-zamir.me)
  //        note: Great work. Ideas for improvement:
  //        note: - code more compliant with developer guidelines
  //        note: - for implementing PHP constant arguments look at
  //        note: the pathinfo() function, it offers the greatest
  //        note: flexibility & compatibility possible
  //   example 1: round(1241757, -3);
  //   returns 1: 1242000
  //   example 2: round(3.6);
  //   returns 2: 4
  //   example 3: round(2.835, 2);
  //   returns 3: 2.84
  //   example 4: round(1.1749999999999, 2);
  //   returns 4: 1.17
  //   example 5: round(58551.799999999996, 2);
  //   returns 5: 58551.8

  var m, f, isHalf, sgn; // helper variables
  precision |= 0; // making sure precision is integer
  m = Math.pow(10, precision);
  value *= m;
  sgn = (value > 0) | -(value < 0); // sign of the number
  isHalf = value % 1 === 0.5 * sgn;
  f = Math.floor(value);

  if (isHalf) {
    switch (mode) {
      case 'PHP_ROUND_HALF_DOWN':
        value = f + (sgn < 0); // rounds .5 toward zero
        break;
      case 'PHP_ROUND_HALF_EVEN':
        value = f + (f % 2 * sgn); // rouds .5 towards the next even integer
        break;
      case 'PHP_ROUND_HALF_ODD':
        value = f + !(f % 2); // rounds .5 towards the next odd integer
        break;
      default:
        value = f + (sgn > 0); // rounds .5 away from zero
    }
  }

  return (isHalf ? value : Math.round(value)) / m;
}
