<?php

/**
 * This is the model class for table "peso_mascota".
 *
 * The followings are the available columns in table 'peso_mascota':
 * @property integer $id
 * @property double $cantidad
 * @property string $medida
 * @property integer $unidad_medida
 * @property double $cantidad_hasta
 *
 * The followings are the available model relations:
 * @property UnidadMedida $unidadMedida
 * @property Porcion[] $porcions
 */
class PesoMascota extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'peso_mascota';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('unidad_medida', 'numerical', 'integerOnly'=>true),
			array('cantidad, cantidad_hasta', 'numerical'),
			array('medida', 'length', 'max'=>12),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, cantidad, medida, unidad_medida, cantidad_hasta', 'safe', 'on'=>'search'),
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
			'unidadMedida' => array(self::BELONGS_TO, 'UnidadMedida', 'unidad_medida'),
			'porcions' => array(self::HAS_MANY, 'Porcion', 'id_peso'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'cantidad' => 'Cantidad',
			'medida' => 'Medida',
			'unidad_medida' => 'Unidad Medida',
			'cantidad_hasta' => 'Cantidad Hasta',
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
		$criteria->compare('cantidad',$this->cantidad);
		$criteria->compare('medida',$this->medida,true);
		$criteria->compare('unidad_medida',$this->unidad_medida);
		$criteria->compare('cantidad_hasta',$this->cantidad_hasta);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PesoMascota the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
