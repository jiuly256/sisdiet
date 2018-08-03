<script type="text/javascript">
jQuery(function($){
        $.datepicker.regional['es'] = {
                closeText: 'Cerrar',
                prevText: '&#x3c;Ant',
                nextText: 'Sig&#x3e;',
                currentText: 'Hoy',
                monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
                'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
                monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
                'Jul','Ago','Sep','Oct','Nov','Dic'],
                dayNames: ['Domingo','Lunes','Martes','Mi&eacute;rcoles','Jueves','Viernes','S&aacute;bado'],
                dayNamesShort: ['Dom','Lun','Mar','Mi&eacute;','Juv','Vie','S&aacute;b'],
                dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','S&aacute;'],
                weekHeader: 'Sm',
                dateFormat: 'dd/mm/yy',
                firstDay: 1,
                isRTL: false,
                showMonthAfterYear: false,
                yearSuffix: ''};
        $.datepicker.setDefaults($.datepicker.regional['es']);
});
</script>

<?php

Yii::import('zii.widgets.grid.CDataColumn');

class SYDateColumn extends CDataColumn
{
//
	/**
	 * if filter is false then no show filter
	 * else if filter is 'range' string then show from input to input
	 * else if filter is 'single' string then show input
	 * @var mixed 
	 */
	public $filter='range';
	
	public $language = false;
	
	/**
	 * jquery-ui theme name
	 * @var string
	 */
	public $theme = 'base';
	
	public $fromText = false;
	
	public $toText = false;
	
	public $dateFormat = 'dd-mm-yy';
	
	public $dateInputStyle="width:100%;display:inline;float:left;";


	public $dateLabelStyle="width:100%;display:inline;float:left;";
	
	public $dateOptions = array('changeMonth' => 'true', 'changeYear' => 'true');

	/**
	 * Renders the filter cell content.
	 */
	protected function renderFilterCellContent()
	{
		if($this->filter!==false && $this->grid->filter!==null && $this->name!==null && strpos($this->name,'.')===false)
		{
			
			$cs=Yii::app()->getClientScript();
			$cs->registerCssFile($cs->getCoreScriptUrl().'/jui/css/'. $this->theme .'/jquery-ui.css');
			if ($this->language!==false) {
				$cs->registerScriptFile($cs->getCoreScriptUrl().'/jui/js/jquery-ui-i18n.min.js');
			}
			$cs->registerScriptFile($cs->getCoreScriptUrl().'/jui/js/jquery-ui.min.js');
			
	/*		if ($this->filter=='range') {
				echo CHtml::tag('div', array(), "<span style='". $this->dateLabelStyle ."'>". $this->fromText ."</span>" . CHtml::activeTextField($this->grid->filter, $this->name.'_range[from]', array('style'=>$this->dateInputStyle, 'class'=>'filter-date')));

				echo CHtml::tag('div', array(), "<span style='". $this->dateLabelStyle ."'>". $this->toText ."</span>". CHtml::activeTextField($this->grid->filter, $this->name.'_range[to]', array('style'=>$this->dateInputStyle, 'class'=>'filter-date')));
			}*/
			if ($this->filter=='range') {
				echo CHtml::tag('div', array(), "<span style='". $this->dateLabelStyle ."'>". $this->fromText ."</span>" . CHtml::activeTextField($this->grid->filter, $this->name.'_range[from]', array('style'=>$this->dateInputStyle, 'class'=>'filter-date'))    );

				echo CHtml::tag('div', array(), "<span style='". $this->dateLabelStyle ."'>". $this->toText ."</span>". CHtml::activeTextField($this->grid->filter, $this->name.'_range[to]', array('style'=>$this->dateInputStyle, 'class'=>'filter-date')));
			}
			else {
				echo CHtml::tag('div', array(), CHtml::activeTextField($this->grid->filter, $this->name.'_range[to]', array('class'=>'filter-date')));
			}
			$options=CJavaScript::encode($this->dateOptions);

			if ($this->language!==false) {
$js=<<<EOD
$(filter_date).datepicker(jQuery.extend({dateFormat:'dd-mm-yy'}, {$options}));
EOD;
			}
			else {
$js=<<<EOD
$(filter_date).datepicker(jQuery.extend({dateFormat:'dd-mm-yy'}, {$options}));

EOD;
			}
$js=<<<EOD
	var filter_date='#{$this->grid->id} input[class="filter-date"]';
	$('body').delegate(filter_date, 'mousedown', function(){
	{$js}
	});
EOD;

			$cs->registerScript(__CLASS__, $js);
	}
		else
			parent::renderFilterCellContent();
	}

}
