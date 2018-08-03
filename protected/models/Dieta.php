<?php

/**
 * This is the model class for table "dieta".
 *
 * The followings are the available columns in table 'dieta':
 * @property integer $id
 * @property string $fecha
 * @property integer $id_cliente
 * @property integer $id_mascota
 * @property double $precio_diario
 * @property integer $dias
 * @property double $precio_dias
 * @property integer $iva
 * @property double $monto_iva
 * @property double $precio_total
 * @property string $created_date
 * @property string $modified_date
 * @property integer $created_by
 * @property integer $modified_by
 *
 * The followings are the available model relations:
 * @property Cliente $idCliente
 * @property Mascota $idMascota
 */
class Dieta extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'dieta';
	}
	
	public $cuenta_descripcion;
	  public $fecha_range = array();
	  public $nombre;
	  public $apellido;
	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_cliente, id_mascota, dias, iva, created_by, modified_by', 'numerical', 'integerOnly'=>true),
			array('precio_diario, precio_dias, monto_iva, precio_total', 'numerical'),
			array('fecha, created_date, modified_date', 'safe'),
					array('fecha, id_cliente, id_mascota', 'required'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, fecha, id_cliente, id_mascota, precio_diario, fecha_range,dias, precio_dias, iva, monto_iva, precio_total, created_date, modified_date, created_by, modified_by,nombre,apellido', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'idCliente' => array(self::BELONGS_TO, 'Cliente', 'id_cliente'),
			'idMascota' => array(self::BELONGS_TO, 'Mascota', 'id_mascota'),
		    'idAlimento' => array(self::BELONGS_TO, 'Alimento', 'id_alimento'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'fecha' => 'Fecha',
			'id_cliente' => 'Cliente',
			'id_mascota' => 'Mascota',
			'precio_diario' => 'Precio Diario',
			'dias' => 'Dias',
			'precio_dias' => 'Precio Dias',
			'iva' => 'Iva',
			'monto_iva' => 'Monto Iva',
			'precio_total' => 'Precio Total',
			'created_date' => 'Created Date',
			'modified_date' => 'Modified Date',
			'created_by' => 'Created By',
			'modified_by' => 'Modified By',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;
		$criteria->with='idCliente';
		$criteria->order='t.id desc';
		



//$criteria->compare('idCliente.apellido',$this->apellido);
//$criteria->compare('idCliente.nombre',$this->nombre);

		$criteria->compare('t.id',$this->id);
		$criteria->compare('fecha',$this->fecha,true);
	//	$criteria->compare('t.id_cliente',$this->id_cliente);
		$criteria->compare('id_mascota',$this->id_mascota);
		$criteria->compare('precio_diario',$this->precio_diario);
		$criteria->compare('dias',$this->dias);
		$criteria->compare('precio_dias',$this->precio_dias);
		$criteria->compare('iva',$this->iva);
		$criteria->compare('monto_iva',$this->monto_iva);
		$criteria->compare('precio_total',$this->precio_total);
		$criteria->compare('created_date',$this->created_date,true);
		$criteria->compare('modified_date',$this->modified_date,true);
		$criteria->compare('created_by',$this->created_by);
		$criteria->compare('modified_by',$this->modified_by);


		$criteria->compare('UPPER(nombre)',  strtoupper($this->nombre),true);
		$criteria->compare('UPPER(apellido)',strtoupper($this->apellido),true);

	//	echo "<pre>"; print_r($criteria); exit;
	  //        $criteria->join = "inner join cliente c c.id on = t.id_cliente";
            
              $from = $to = '';
             if (count($this->fecha_range)>=1) {
              if (isset($this->fecha_range['from'])) {
                  $from = $this->fecha_range['from'];
              }
              if (isset($this->fecha_range['to'])) {
                  $to= $this->fecha_range['to'];
              }
          }
          if ($from!='' || $to !='') {
              if ($from!='' && $to!='') {
                  $from = date("d-m-Y", strtotime($from));
                  $to = date("d-m-Y", strtotime($to));
                  $criteria->compare('fecha',">= $from",false);
                  $criteria->compare('fecha',"<= $to",false);
              }
              else {
                  if ($from!='') $creation_time = $from;
                  if ($to != '') $creation_time = $to;
                  $creation_time = date("d-m-Y", strtotime($creation_time));
                  $criteria->compare('fecha', "$creation_time" ,false);
              }
          }
		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Dieta the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	    public function behaviors()
{
    return array(
        'CTimestampBehavior' => array(
            'class' => 'zii.behaviors.CTimestampBehavior',
            'createAttribute' => 'created_date',
            'updateAttribute' => 'modified_date',
            'setUpdateOnCreate' => true,
        ),
        'BlameableBehavior' => array(
            'class' => 'application.components.behaviors.BlameableBehavior',
            'createdByColumn' => 'created_by', 
            'updatedByColumn' => 'modified_by',  
        ),
    );
}

public function pegar($a,$b){

	$parametro=$a.' '.$b;

	return $parametro;
}

public function decimales ($param){

		$param=number_format($param,2,',','.');

		return $param;
	}

}
