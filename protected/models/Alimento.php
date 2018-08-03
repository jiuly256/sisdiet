<?php

/**
 * This is the model class for table "alimento".
 *
 * The followings are the available columns in table 'alimento':
 * @property integer $id
 * @property string $descripcion
 * @property integer $tipo_alimento
 *
 * The followings are the available model relations:
 * @property TipoAlimento $tipoAlimento
 * @property Precio[] $precios
 */
class Alimento extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'alimento';
	}

	public $cantidad;
	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('tipo_alimento,id_unidad', 'numerical', 'integerOnly'=>true),
			array('descripcion, tipo_alimento,id_unidad', 'required'),
			array('descripcion', 'length', 'max'=>50),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, descripcion, tipo_alimento,id_unidad,observaciones,cantidad', 'safe', 'on'=>'search'),
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
			'tipoAlimento' => array(self::BELONGS_TO, 'TipoAlimento', 'tipo_alimento'),
			'idUnidad' => array(self::BELONGS_TO, 'UnidadMedida', 'id_unidad'),
			'precios' => array(self::HAS_MANY, 'Precio', 'id_alimento'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'descripcion' => 'Descripcion',
			'tipo_alimento' => 'Tipo Alimento',
			'id_unidad'=> 'Unidad de medida',
			'observaciones'=> 'Observaciones',
			'cantidad'=>'Cantidad'
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
		$criteria->compare('LOWER(descripcion)',  strtolower($this->descripcion),true);
		$criteria->compare('tipo_alimento',$this->tipo_alimento);
		$criteria->compare('id_unidad',$this->id_unidad);
		$criteria->compare('cantidad',$this->cantidad);
		$criteria->compare('LOWER(observaciones)',  strtolower($this->observaciones),true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Alimento the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function calculacantidad($id_alimento){

		$total_precio=Precio::model()->findBySql("select sum(cantidad) as suma from precio where id_alimento=$id_alimento");


		$total_dieta=DietaDetalle::model()->findBySql("select sum(cantidad_gramos/1000) as suma from dieta_detalle where id_alimento=$id_alimento");

		if (!isset($total_dieta)){
			$total_dieta->sum=0;
		}

		$total=$total_precio->suma-$total_dieta->suma;

		
		return $total;

	}
}
