<?php

/**
 * This is the model class for table "sismaq.estatus".
 *
 * The followings are the available columns in table 'sismaq.estatus':
 * @property integer $id_estatus_pk
 * @property string $str_descripcion
 * @property boolean $bln_borrado
 *
 * The followings are the available model relations:
 * @property SismaqHistorial[] $sismaqHistorials
 * @property Sismaq[] $sismaqs
 */
class Estatus extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'sismaq.estatus';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('str_descripcion', 'length', 'max'=>100),
                        array('str_descripcion', 'required'),
			//array('bln_borrado', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_estatus_pk, str_descripcion, bln_borrado', 'safe', 'on'=>'search'),
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
			'sismaqHistorials' => array(self::HAS_MANY, 'SismaqHistorial', 'id_estatus_fk'),
			'sismaqs' => array(self::HAS_MANY, 'Sismaq', 'id_estatus_fk'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_estatus_pk' => 'Estatus',
			'str_descripcion' => 'Descripcion',
			'bln_borrado' => 'Bln Borrado',
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

                $criteria->condition= "bln_borrado=false";
		$criteria->compare('id_estatus_pk',$this->id_estatus_pk);
		$criteria->compare('LOWER(str_descripcion)',strtolower($this->str_descripcion),true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Estatus the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
