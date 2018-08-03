<?php

/**
 * This is the model class for table "porcion".
 *
 * The followings are the available columns in table 'porcion':
 * @property integer $id
 * @property integer $id_peso
 * @property integer $id_edad
 * @property double $cantidad_gramos
 * @property integer $porcentaje_grasa
 * @property integer $porcentaje_proteina
 * @property double $porcentaje_vegetal
 *
 * The followings are the available model relations:
 * @property PesoMascota $idPeso
 * @property EdadMascota $idEdad
 */
class Porcion extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'porcion';
	}

	public $cantidad;
	public $tipo;
	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_peso, id_edad, porcentaje_grasa, porcentaje_proteina', 'numerical', 'integerOnly'=>true),
			array('cantidad_gramos, porcentaje_vegetal', 'numerical'),
			array('porcentaje_proteina','valida'),
				array('cantidad_gramos, porcentaje_vegetal,porcentaje_proteina', 'required'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, id_peso, id_edad, cantidad_gramos, porcentaje_grasa, porcentaje_proteina, porcentaje_vegetal', 'safe', 'on'=>'search'),
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
			'idPeso' => array(self::BELONGS_TO, 'PesoMascota', 'id_peso'),
			'idEdad' => array(self::BELONGS_TO, 'EdadMascota', 'id_edad'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'id_peso' => 'Id Peso',
			'id_edad' => 'Id Edad',
			'cantidad_gramos' => 'Cantidad Gramos',
			'porcentaje_grasa' => 'Porcentaje Grasa',
			'porcentaje_proteina' => 'Porcentaje Proteina',
			'porcentaje_vegetal' => 'Porcentaje Vegetal',
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
		$criteria->compare('id_peso',$this->id_peso);
		$criteria->compare('id_edad',$this->id_edad);
		$criteria->compare('cantidad_gramos',$this->cantidad_gramos);
		$criteria->compare('porcentaje_grasa',$this->porcentaje_grasa);
		$criteria->compare('porcentaje_proteina',$this->porcentaje_proteina);
		$criteria->compare('porcentaje_vegetal',$this->porcentaje_vegetal);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
			 'pagination'=>array(
                    'pageSize'=>15,
                ),
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Porcion the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

		public function valida(){
		 if(!$this->hasErrors('porcentaje_proteina')){

		 	if (($this->porcentaje_proteina + $this->porcentaje_vegetal)!=100){
		 		$this->addError('proteina',"La sumatoria deberia ser 100 %");
		 	}
		 	

		 }
              
}
}
