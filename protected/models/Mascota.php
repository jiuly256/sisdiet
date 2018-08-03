<?php

/**
 * This is the model class for table "mascota".
 *
 * The followings are the available columns in table 'mascota':
 * @property integer $id_mascota
 * @property integer $id_cliente
 * @property string $nombre
 * @property integer $tipo
 * @property integer $raza
 * @property string $fecha_nacimiento
 * @property integer $edad
 * @property integer $clasificacion
 * @property integer $sexo
 * @property string $color
 * @property integer $esterilizado
 * @property integer $longitud
 * @property integer $longitud_medida
 * @property integer $peso
 * @property integer $peso_medida
 * @property string $foto
 * @property string $observacion
 * @property string $created_date
 * @property string $modified_date
 * @property integer $created_by
 * @property integer $modified_by
 *
 * The followings are the available model relations:
 * @property Cliente $idCliente
 */
class Mascota extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'mascota';
	}

	public $cuenta_descripcion;
	public $raza_descripcion;
public $apellido;
public $nombre2;
	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_cliente, tipo, raza, edad, clasificacion, sexo, esterilizado, longitud_medida, peso_medida, created_by, modified_by', 'numerical', 'integerOnly'=>true),
			array('nombre, color, foto', 'length', 'max'=>100),
			array('fecha_nacimiento, observacion, created_date, modified_date,longitud,peso', 'safe'),
			array('fecha_nacimiento,nombre,tipo,raza,clasificacion,sexo,peso,peso_medida,cuenta_descripcion', 'required'),
                         array('cuenta_descripcion','verificarcodigocuenta','on'=>array('create','update')),
                         array('raza_descripcion','verificarraza','on'=>array('create')),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_mascota, id_cliente, nombre, tipo, raza, fecha_nacimiento, edad, clasificacion, sexo, color, esterilizado, longitud, longitud_medida, peso, peso_medida, foto, observacion, created_date, modified_date, created_by, modified_by,nombre2,apellido', 'safe', 'on'=>'search'),
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
			'idCliente' => array(self::BELONGS_TO, 'Cliente', 'id_cliente'),
			'idTipo' => array(self::BELONGS_TO, 'TipoMascota', 'tipo'),
			'idClasificacion' => array(self::BELONGS_TO, 'EdadMascota', 'clasificacion'),
			'idSexo' => array(self::BELONGS_TO, 'Sexo', 'sexo'),
			'idRaza' => array(self::BELONGS_TO, 'RazaMascota', 'raza'),
			'idSino' => array(self::BELONGS_TO, 'SiNo', 'esterilizado'),
			'idMedida' => array(self::BELONGS_TO, 'UnidadMedida', 'longitud_medida'),
			'idMedida2' => array(self::BELONGS_TO, 'UnidadMedida', 'peso_medida'),
			'idDieta' => array(self::HAS_MANY, 'Dieta', 'id_cliente')
		);
	}
        
        public function verificarcodigocuenta(){
            if(!$this->hasErrors('cuenta_descripcion')){

                $codigo = explode("-",$this->cuenta_descripcion);
                if (!isset($codigo[0])){
                  $this->addError('cuenta_descripcion','Este cliente no esta en base de datos.');
                }else{
                $cuentas= Cliente::model()->find('cedula::text=\''.$codigo[0].'\'');
                
//                echo "<pre>"; print_r($cuentas); exit;
                if(!$cuentas){
                  $this->addError('cuenta_descripcion','Este cliente no esta en base de datos.');
                }
            }
            }
        }

           public function verificarraza(){
            if(!$this->hasErrors('raza_descripcion')){

                $codigo = $this->raza_descripcion;
                if (!isset($codigo)){
                  $this->addError('raza_descripcion','Esta raza no esta en base de datos.');
                }else{
                $cuentas= RazaMascota::model()->find('descripcion::text=\''.$codigo.'\'');
                
//                echo "<pre>"; print_r($cuentas); exit;
                if(!$cuentas){
                  $this->addError('raza_descripcion','Esta raza no esta en base de datos.');
                }
            }
            }
        }
	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_mascota' => 'Id Mascota',
			'id_cliente' => 'Cliente',
			'cuenta_descripcion' => 'Cliente',
			'nombre' => 'Nombre',
			'nombre2'=> 'Nombre Cliente',
			'apellido'=> 'Apellido Cliente',
			'tipo' => 'Tipo',
			'idTipo.descripcion'=>'Tipo',
			'raza' => 'Raza',
			'idRaza.descripcion' => 'Raza',
			'fecha_nacimiento' => 'Fecha Nacimiento',
			'edad' => 'Edad',
			'clasificacion' => 'Clasificacion',
				'idClasificacion.tipo' => 'Clasificacion',
			
			'sexo' => 'Sexo',
			'	idSexo.descripcion' => 'Sexo',
		
			'color' => 'Color',
			'esterilizado' => 'Esterilizado',
			'idSino.descripcion' => 'Esterilizado',
			
			'longitud' => 'Longitud',
			'longitud_medida' => 'Longitud Medida',
				'	idMedida.descripcion' => 'Longitud Medida',
		
			'peso' => 'Peso',
			'peso_medida' => 'Peso Medida',
			'idMedida2.descripcion' => 'Peso Medida',
			
			'foto' => 'Foto',
		/*	'observacion' => 'Observacion',
			'created_date' => 'Created Date',
			'modified_date' => 'Modified Date',
			'created_by' => 'Created By',
			'modified_by' => 'Modified By',*/
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
				$criteria->with='idCliente';


		$criteria->compare('id_mascota',$this->id_mascota);
		//$criteria->compare('id_cliente',$this->id_cliente);
		$criteria->compare('LOWER("t".nombre)',  strtolower($this->nombre),true);
		$criteria->compare('tipo',$this->tipo);
		$criteria->compare('raza',$this->raza);
		$criteria->compare('fecha_nacimiento',$this->fecha_nacimiento,true);
		$criteria->compare('edad',$this->edad);
		$criteria->compare('clasificacion',$this->clasificacion);
		$criteria->compare('sexo',$this->sexo);
		$criteria->compare('color',$this->color,true);
		$criteria->compare('esterilizado',$this->esterilizado);
		$criteria->compare('longitud',$this->longitud);
		$criteria->compare('longitud_medida',$this->longitud_medida);
		$criteria->compare('peso',$this->peso);
		$criteria->compare('peso_medida',$this->peso_medida);
		$criteria->compare('foto',$this->foto,true);
		$criteria->compare('observacion',$this->observacion,true);
		$criteria->compare('created_date',$this->created_date,true);
		$criteria->compare('modified_date',$this->modified_date,true);
		$criteria->compare('created_by',$this->created_by);
		$criteria->compare('modified_by',$this->modified_by);

		$criteria->compare('UPPER("idCliente".nombre)',  strtoupper($this->nombre2),true);
		$criteria->compare('UPPER(apellido)',strtoupper($this->apellido),true);
//	echo "<pre>"; print_r($criteria); exit;
		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Mascota the static model class
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

public function pegar($a,$b){

	$parametro=$a.' '.$b;

	return $parametro;
}

public function nombrecompleto($id){

	$cliente=Cliente::model()->find('id='.$id.'');
	$nombrec=$cliente->nombre.' '.$cliente->apellido;

	return $nombrec;
}



}
