<?php

/**
 * This is the model class for table "dieta_detalle".
 *
 * The followings are the available columns in table 'dieta_detalle':
 * @property integer $id
 * @property integer $id_dieta
 * @property integer $id_alimento
 * @property integer $cuenta_descripcion
 * @property double $cantidad_gramos
 * @property double $costo_gramos
 * @property double $precio_gramos
 * @property string $created_date
 * @property string $modified_date
 * @property integer $created_by
 * @property integer $modified_by
 */
class DietaDetalle extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'dieta_detalle';


	}

	public $suma;
	public $cuenta_descripcion;
	public $cliente_descripcion;
	public $dias;
	public $descripcion;
	public $cuenta;
	public $fecha;
    public $id_cliente;
    public $id_mascota;
    public $premio;
    public $envase;
    public $maximo;
    public $porcion;

    public $envase_cantidad_0;
    public $envase_cantidad_1;
    public $envase_cantidad_2;
    public $envase_cantidad_3;
    public $envase_cantidad_4;
    public $envase_cantidad_5;
    public $envase_cantidad_6;
    public $envase_cantidad_7;
    public $envase_cantidad_8;


    public $premio_cantidad_0;
    public $premio_cantidad_1;
    public $premio_cantidad_2;
    public $premio_cantidad_3;
    public $premio_cantidad_4;
    public $premio_cantidad_5;
    public $premio_cantidad_6;
    public $premio_cantidad_7;
    public $premio_cantidad_8;
    public $premio_cantidad_9;
    public $premio_cantidad_10;

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_dieta, id_alimento, created_by, modified_by,dias,envase_cantidad_0,envase_cantidad_1,envase_cantidad_2', 'numerical', 'integerOnly'=>true),
			array('cantidad_gramos, costo_gramos, precio_gramos,', 'numerical'),
		  	  array('id_alimento,id_cliente,cliente_descripcion,id_mascota,fecha,cuenta_descripcion,dias','required','on'=>'crear'),
		//	array('cantidad_gramos','required'),
			array('created_date, modified_date', 'safe'),

		//	array ('id_alimento','comprobar','on'=>'crear'),

			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, id_dieta, id_alimento, cantidad_gramos, costo_gramos, precio_gramos, created_date, modified_date, created_by, modified_by,cuenta_descripcion,cliente_descripcion,premio,envase,id_cliente,id_mascota,fecha', 'safe', 'on'=>'search'),
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
			'Alimento' => array(self::BELONGS_TO, 'Alimento', 'id_alimento'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'id_dieta' => 'Id Dieta',
			'id_cliente' => 'Cliente',
			'id_mascota' => 'Mascota',
			'id_alimento' => '<b>Proteínas</b>',
			'cuenta_descripcion' => '<b>Vegetales-Complementos</b>',
			'cantidad_gramos' => 'Cantidad Gramos',
			'costo_gramos' => 'Costo Gramos',
			'precio_gramos' => 'Precio Gramos',
			'premio' => '<b>Premios</b>',
			'envase' => '<b>Envases</b>',
			'created_date' => 'Created Date',
			'modified_date' => 'Modified Date',
			'created_by' => 'Created By',
			'modified_by' => 'Modified By',
			'dias' => '<b>Dias</b>',

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

		$criteria->compare('id',$this->id);
		$criteria->compare('id_dieta',$this->id_dieta);
		$criteria->compare('id_alimento',$this->id_alimento);
		$criteria->compare('cantidad_gramos',$this->cantidad_gramos);
		$criteria->compare('costo_gramos',$this->costo_gramos);
		$criteria->compare('precio_gramos',$this->precio_gramos);
		$criteria->compare('created_date',$this->created_date,true);
		$criteria->compare('modified_date',$this->modified_date,true);
		$criteria->compare('created_by',$this->created_by);
		$criteria->compare('modified_by',$this->modified_by);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return DietaDetalle the static model class
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

public function decimales ($param){

		$param=number_format($param,2,',','.');

		return $param;
	}

	}