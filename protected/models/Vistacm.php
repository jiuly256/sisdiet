<?php

/**
 * This is the model class for table "vistacm".
 *
 * The followings are the available columns in table 'vistacm':
 * @property integer $id
 * @property integer $cedula
 * @property string $nombre
 * @property string $apellido
 * @property integer $sexo
 * @property string $direccion
 * @property string $telefono
 * @property string $telefono_casa
 * @property string $correo_electronico
 * @property string $created_date
 * @property string $modified_date
 * @property integer $created_by
 * @property integer $modified_by
 * @property string $nombre_mascota
 * @property integer $id_mascota
 * @property double $porcion
 * @property string $descripcion
 * @property double $peso
 */
class Vistacm extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'vistacm';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id, cedula, sexo, created_by, modified_by, id_mascota', 'numerical', 'integerOnly'=>true),
			array('porcion, peso', 'numerical'),
			array('nombre, apellido, correo_electronico, nombre_mascota', 'length', 'max'=>100),
			array('telefono, telefono_casa', 'length', 'max'=>16),
			array('descripcion', 'length', 'max'=>30),
			array('direccion, created_date, modified_date', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, cedula, nombre, apellido, sexo, direccion, telefono, telefono_casa, correo_electronico, created_date, modified_date, created_by, modified_by, nombre_mascota, id_mascota, porcion, descripcion, peso', 'safe', 'on'=>'search'),
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
			'cedula' => 'Cedula',
			'nombre' => 'Nombre',
			'apellido' => 'Apellido',
			'sexo' => 'Sexo',
			'direccion' => 'Direccion',
			'telefono' => 'Telefono',
			'telefono_casa' => 'Telefono Casa',
			'correo_electronico' => 'Correo Electronico',
			'created_date' => 'Created Date',
			'modified_date' => 'Modified Date',
			'created_by' => 'Created By',
			'modified_by' => 'Modified By',
			'nombre_mascota' => 'Nombre Mascota',
			'id_mascota' => 'Id Mascota',
			'porcion' => 'Porcion',
			'descripcion' => 'Descripcion',
			'peso' => 'Peso',
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
		$criteria->compare('cedula',$this->cedula);
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('apellido',$this->apellido,true);
		$criteria->compare('sexo',$this->sexo);
		$criteria->compare('direccion',$this->direccion,true);
		$criteria->compare('telefono',$this->telefono,true);
		$criteria->compare('telefono_casa',$this->telefono_casa,true);
		$criteria->compare('correo_electronico',$this->correo_electronico,true);
		$criteria->compare('created_date',$this->created_date,true);
		$criteria->compare('modified_date',$this->modified_date,true);
		$criteria->compare('created_by',$this->created_by);
		$criteria->compare('modified_by',$this->modified_by);
		$criteria->compare('nombre_mascota',$this->nombre_mascota,true);
		$criteria->compare('id_mascota',$this->id_mascota);
		$criteria->compare('porcion',$this->porcion);
		$criteria->compare('descripcion',$this->descripcion,true);
		$criteria->compare('peso',$this->peso);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Vistacm the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
