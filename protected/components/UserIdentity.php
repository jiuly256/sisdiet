<?php

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
//class UserIdentity extends CUserIdentity {

/**
 * Authenticates a user.
 * The example implementation makes sure if the username and password
 * are both 'demo'.
 * In practical applications, this should be changed to authenticate
 * against some persistent user identity storage (e.g. database).
 * @return boolean whether authentication succeeds.
 */
//    public function authenticate() {
//        $users = array(
//            // username => password
//            'demo' => 'demo',
//            'admin' => 'admin',
//            'u1' => '123',
//            'u2' => '123',
//            'u3' => '123',
//            'u4' => '123',
//        );
//        if (!isset($users[$this->username]))
//            $this->errorCode = self::ERROR_USERNAME_INVALID;
//        else if ($users[$this->username] !== $this->password)
//            $this->errorCode = self::ERROR_PASSWORD_INVALID;
//        else
//            $this->errorCode = self::ERROR_NONE;
//        return !$this->errorCode;
//    }
//
//}

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
//class UserIdentity extends CUserIdentity {
//
//    /**
//     * Authenticates a user.
//     * The example implementation makes sure if the username and password
//     * are both 'demo'.
//     * In practical applications, this should be changed to authenticate
//     * against some persistent user identity storage (e.g. database).
//     * @return boolean whether authentication succeeds.
//     */
//    private $_id;
//
//    public function authenticate() {
//        $user = User::model()->findByAttributes(array('username' => $this->username));
//        if ($user === null) {
//            $this->errorCode = self::ERROR_USERNAME_INVALID;
//        } else {
//            if ($user->password !== $user->encrypt($this->password)) {
//                $this->errorCode = self::ERROR_PASSWORD_INVALID;
//            } else {
//                $this->_id = $user->id;
//                if (null === $user->last_login_time) {
//                    $lastLogin = date("d-m-Y h:ia", time());
//                } else {
//                    $lastLogin = date("d-m-Y h:ia", $user->last_login_time);// strtotime($user->last_login_time);
//                }
//                $this->setState('lastLoginTime', $lastLogin);
//                $this->errorCode = self::ERROR_NONE;
//            }
//        }
//        return !$this->errorCode;
//    }
//
//    public function getId() {
//        return $this->_id;
//    }
//
//}
// ldap
//class UserIdentity extends CUserIdentity {
//
//    private $_id;
//
//    public function authenticate() {
//        $username = strtolower($this->username);
//        $ok = 1;
//        if (strlen($username) > 0) {
//            $server = "dominio.mtc.gob.ve";
//            $basedn = "ou=personas,ou=sede,dc=mtc,dc=gob,dc=ve";
//            $password = $this->password;
//            if (!($ds = ldap_connect($server)))
//                echo "No me pude conectar al servidor LDAP";
//            else {
//                ldap_set_option($ds, LDAP_OPT_PROTOCOL_VERSION, 3);
//
//                $r = ldap_search($ds, $basedn, 'uid=' . $username);
//                if ($r) {
//                    $result = ldap_get_entries($ds, $r);
//                    $result[0]['givenname'] = 'vacio';
//                    if (($result[0]) && ($result[0] != 'vacio')) {
//                        if (@ldap_bind($ds, $result[0]['dn'], $password)) {
//                            $ok = 0;
//                            $nombre = $result[0]['givenname'];
//                            $apellido = $result[0]['sn'];
//                            $correo = $result[0]['mail'];
//                            $employeeNumber = $result[0]["employeenumber"][0];
//
//                            /* echo "<div style=\"text-align:center;height:70px;\">".$apellido[0].",".$nombre[0]."</div>";
//                              echo "<div style=\"text-align:center;height:70px;\">employeeNumber: ".$employeeNumber."</div>";
//                              echo "<div style=\"text-align:center;height:70px;\">correo del empleado".$correo[0]."</div>"; */
//                        }
//                    }
//                }
//            }
//        }
//        if ($ok == "0") {
//            $user = User::model()->find('LOWER(username)=?', array($username));
//            if ($user === null) {
//                $this->errorCode = self::ERROR_USERNAME_INVALID;
//                /* else if(!$user->validatePassword($this->password))
//                  $this->errorCode=self::ERROR_PASSWORD_INVALID; */
//            } else {
//                $this->_id = $user->id;
//                $this->username = $user->username;
//                $this->errorCode = self::ERROR_NONE;
//                //$this->_id = $user->id;
//                if (null === $user->last_login_time) {
//                    $lastLogin = date("d-m-Y h:ia", time());
//                } else {
//                    $lastLogin = date("d-m-Y h:ia", $user->last_login_time); // strtotime($user->last_login_time);
//                }
//                $this->setState('lastLoginTime', $lastLogin);
//                $this->errorCode = self::ERROR_NONE;
//            }
//        }//else{    echo "<div style=\"text-align:center;height:50px;\">NO ESTAS EN EL LDAP </div>";}    
//        return $this->errorCode == self::ERROR_NONE;
//    }
//
//    public function getId() {
//        return $this->_id;
//    }
//
//}
//validacion contra la base de datos
   class UserIdentity extends CUserIdentity
  {
     private $_id;
     public function authenticate()
   {
      $username=strtolower($this->username);
      $user=  Usuario::model()->find('LOWER(username)=?',array($username));
      if($user===null)
          $this->errorCode=self::ERROR_USERNAME_INVALID;
      else if(!$user->validatePassword($this->password))
          $this->errorCode=self::ERROR_PASSWORD_INVALID;
      else
      {
          $this->_id=$user->id;
          $this->username=$user->username;
          $this->errorCode=self::ERROR_NONE;
      }
      return $this->errorCode==self::ERROR_NONE;
   }
     public function getId()
    {
      return $this->_id;
    }
  }
  
