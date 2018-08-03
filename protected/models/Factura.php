<?php

/**
 * This is the model class for table "factura".
 *
 * The followings are the available columns in table 'factura':
 * @property integer $id_factura
 * @property string $fecha
 * @property integer $tipo_pago
 * @property string $nombre
 * @property integer $rif
 * @property string $domicilio
 * @property string $telefono
 * @property double $cantidad
 * @property string $descripcion
 * @property double $precio
 * @property double $cantidadp
 * @property string $descripcionp
 * @property double $preciop
 * @property integer $porcentaje
 * @property double $subtotal
 * @property double $iva
 * @property double $total
 * @property integer $estatus
 */
class Factura extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'factura';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('tipo_pago, porcentaje, estatus,id_dieta', 'numerical', 'integerOnly'=>true),
			array('cantidad, precio, cantidadp, preciop, subtotal, iva, total', 'numerical'),
			array('nombre', 'length', 'max'=>80),
			array('descripcion, descripcionp,rif', 'length', 'max'=>30),
			array('fecha, domicilio, telefono', 'safe'),
			array('tipo_pago', 'required'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_factura, fecha, tipo_pago, nombre, rif, domicilio, telefono, cantidad, descripcion, precio, cantidadp, descripcionp, preciop, porcentaje, subtotal, iva, total, estatus', 'safe', 'on'=>'search'),
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
			'idtipopago' => array(self::BELONGS_TO, 'Tipopago', 'tipo_pago'),
			'idEstatus' => array(self::BELONGS_TO, 'Estatusfactura', 'estatus'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_factura' => 'Id Factura',
			'fecha' => 'Fecha',
			'tipo_pago' => 'Tipo Pago',
			'nombre' => 'Nombre o Razón social',
			'rif' => 'RIF/CI',
			'domicilio' => 'Domicilio',
			'telefono' => 'Telefono',
			'cantidad' => 'Cantidad(Cant)',
			'descripcion' => 'Descripcion',
			'precio' => 'Precio Unitario',
			'cantidadp' => 'Cantidadp',
			'descripcionp' => 'Descripcionp',
			'preciop' => 'Preciop',
			'porcentaje' => 'Porcentaje',
			'subtotal' => 'Subtotal',
			'iva' => 'Iva',
			'total' => 'Total',
			'estatus' => 'Estatus',
			'idtipopago.descripcion'=>'Tipo Pago'
		);
	}

	public function getestatus($id){
		if ($id==1){
			$texto='Activa';
		}
		else {
			$texto='Anulada';
		}
		return $texto;
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

		$criteria->compare('id_factura',$this->id_factura);
		$criteria->compare('fecha',$this->fecha,true);
		$criteria->compare('tipo_pago',$this->tipo_pago);
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('rif',$this->rif,true);
		$criteria->compare('domicilio',$this->domicilio,true);
		$criteria->compare('telefono',$this->telefono,true);
		$criteria->compare('cantidad',$this->cantidad);
		$criteria->compare('descripcion',$this->descripcion,true);
		$criteria->compare('precio',$this->precio);
		$criteria->compare('cantidadp',$this->cantidadp);
		$criteria->compare('descripcionp',$this->descripcionp,true);
		$criteria->compare('preciop',$this->preciop);
		$criteria->compare('porcentaje',$this->porcentaje);
		$criteria->compare('subtotal',$this->subtotal);
		$criteria->compare('iva',$this->iva);
		$criteria->compare('total',$this->total);
		$criteria->compare('estatus',$this->estatus);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Factura the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
