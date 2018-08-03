<?php

/**
 * This is the model class for table "edad_mascota".
 *
 * The followings are the available columns in table 'edad_mascota':
 * @property integer $id
 * @property string $tipo
 * @property string $descripcion
 * @property double $edad_desde
 * @property double $edad_hasta
 *
 * The followings are the available model relations:
 * @property Porcion[] $porcions
 */
class EdadMascota extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'edad_mascota';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('edad_desde, edad_hasta', 'numerical'),
			array('tipo, descripcion', 'length', 'max'=>30),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, tipo, descripcion, edad_desde, edad_hasta', 'safe', 'on'=>'search'),
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
			'porcions' => array(self::HAS_MANY, 'Porcion', 'id_edad'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'tipo' => 'Tipo',
			'descripcion' => 'Descripcion',
			'edad_desde' => 'Edad Desde',
			'edad_hasta' => 'Edad Hasta',
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
		$criteria->compare('tipo',$this->tipo,true);
		$criteria->compare('descripcion',$this->descripcion,true);
		$criteria->compare('edad_desde',$this->edad_desde);
		$criteria->compare('edad_hasta',$this->edad_hasta);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return EdadMascota the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
