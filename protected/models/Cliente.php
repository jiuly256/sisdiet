<?php

/**
 * This is the model class for table "cliente".
 *
 * The followings are the available columns in table 'cliente':
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
 *
 * The followings are the available model relations:
 * @property Mascota[] $mascotas
 */
class Cliente extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'cliente';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('cedula, sexo, created_by, modified_by', 'numerical', 'integerOnly'=>true),
			array('nombre, apellido, correo_electronico', 'length', 'max'=>100),
			array('nombre, apellido, cedula,sexo,direccion,telefono', 'required'),
                        array('correo_electronico', 'email','message'=>"El email no es correcto"),
			array('telefono, telefono_casa', 'length', 'max'=>16),
			array('direccion, created_date, modified_date', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, cedula, nombre, apellido, sexo, direccion, telefono, telefono_casa, correo_electronico, created_date, modified_date, created_by, modified_by', 'safe', 'on'=>'search'),
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
			'mascotas' => array(self::HAS_MANY, 'Mascota', 'id_cliente'),
			'idSexo' => array(self::BELONGS_TO, 'Sexo', 'sexo'),
			'idDieta' => array(self::HAS_MANY, 'Dieta', 'id_cliente')
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
			'Sexoid.descripcion' => 'Sexo',
			'direccion' => 'Direccion',
			'telefono' => 'Telefono celular',
			'telefono_casa' => 'Telefono local',
			'correo_electronico' => 'Correo electronico',
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

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Cliente the static model class
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



}
