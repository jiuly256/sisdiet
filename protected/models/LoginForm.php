<?php

/**
 * LoginForm class.
 * LoginForm is the data structure for keeping
 * user login form data. It is used by the 'login' action of 'SiteController'.
 */
class LoginForm extends CFormModel
{
	public $username;
	public $password;
	public $rememberMe;
	public $blnborrado;

	private $_identity;

	/**
	 * Declares the validation rules.
	 * The rules state that username and password are required,
	 * and password needs to be authenticated.
	 */
	public function rules()
	{
		return array(
			// username and password are required
			array('username, password', 'required'),
			// rememberMe needs to be a boolean
			array('rememberMe', 'boolean'),
			// password needs to be authenticated
			array('password', 'authenticate'),
		);
	}

	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels()
	{
		return array(
			'rememberMe'=>'No cerrar sesión',
			'username'=>'Usuario',
			'password'=>'Contraseña',
		);
	}

	/**
	 * Authenticates the password.
	 * This is the 'authenticate' validator as declared in rules().
	 */
	public function authenticate($attribute,$params)
	{
		if(!$this->hasErrors())
		{
			$usuario= Usuario::model()->find("username='$this->username'");
			$blnborrado=$usuario->blnborrado;
			$this->_identity=new UserIdentity($this->username,$this->password);
			if(!$this->_identity->authenticate() ||  $blnborrado=='false')
				$this->addError('password','Nombre o Password incorrecto');
		}
	}

	/**
	 * Logs in the user using the given username and password in the model.
	 * @return boolean whether login is successful
	 */
	public function login()
	{
		if($this->_identity===null )
		{
			$this->_identity=new UserIdentity($this->username,$this->password);
			$this->_identity->authenticate();
		}
		 if ($this->_identity->errorCode === UserIdentity::ERROR_NONE) {
                    $duration = $this->rememberMe ? 3600 * 24 * 30 : 0; // 30 days Acá se define la duración de la cookie por un periodo de 30 días, sólo si está activado el rememberMe
                    Yii::app()->user->login($this->_identity, $duration);
                    return true;
                }

		else
			return false;
	}
}
