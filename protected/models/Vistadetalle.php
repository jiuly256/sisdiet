<?php

/**
 * This is the model class for table "vistadetalle".
 *
 * The followings are the available columns in table 'vistadetalle':
 * @property integer $id
 * @property string $fecha
 * @property string $nombre_mascota
 * @property integer $clasificacion
 * @property double $peso
 * @property string $medida
 * @property string $tipo
 * @property string $descripcion
 * @property string $nombre
 * @property string $apellido
 * @property double $porcion
 */
class Vistadetalle extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'vistadetalle';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id, clasificacion', 'numerical', 'integerOnly'=>true),
			array('peso, porcion', 'numerical'),
			array('nombre_mascota, nombre, apellido', 'length', 'max'=>100),
			array('medida', 'length', 'max'=>12),
			array('tipo, descripcion', 'length', 'max'=>30),
			array('fecha', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, fecha, nombre_mascota, clasificacion, peso, medida, tipo, descripcion, nombre, apellido, porcion', 'safe', 'on'=>'search'),
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
			'nombre_mascota' => 'Nombre Mascota',
			'clasificacion' => 'Clasificacion',
			'peso' => 'Peso',
			'medida' => 'Medida',
			'tipo' => 'Tipo',
			'descripcion' => 'Descripcion',
			'nombre' => 'Nombre',
			'apellido' => 'Apellido',
			'porcion' => 'Porcion',
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
		$criteria->compare('fecha',$this->fecha,true);
		$criteria->compare('nombre_mascota',$this->nombre_mascota,true);
		$criteria->compare('clasificacion',$this->clasificacion);
		$criteria->compare('peso',$this->peso);
		$criteria->compare('medida',$this->medida,true);
		$criteria->compare('tipo',$this->tipo,true);
		$criteria->compare('descripcion',$this->descripcion,true);
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('apellido',$this->apellido,true);
		$criteria->compare('porcion',$this->porcion);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Vistadetalle the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
