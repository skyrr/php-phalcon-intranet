<?php
/**
 * Created by PhpStorm.
 * User: volodymyr
 * Date: 18.08.16
 * Time: 11:15
 */
class User extends \Phalcon\Mvc\Model
{
    public $id;
    public $name;
    public $email;
    public $password;
    public $last_visit;
//    protected $selected_account_id;
    public function beforeCreate()
    {
        if (!$this->last_visit) { // use default value if the value is not set
            $this->last_visit = date("Y-m-d H-i-s");
        }
    }

    public function validation()
    {
        $validation = new \Phalcon\Validation();
        $validation->add('email', new \Phalcon\Validation\Validator\Uniqueness());
        $validation->add('email', new \Phalcon\Validation\Validator\Email());

        return $this->validate($validation);
    }

    protected function initialize()
    {
        $this->hasMany(
            'id',
            Account::class,
            'user_id',
            [
                'alias' => 'Account'
            ]
        );

//        $this->hasOne('selected_account_id', Account::class, 'id', [
//            'alias' => 'SelectedAccount'
//        ]);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getEmail()
    {
        return $this->email;
    }

    public function getPassword()
    {
        return $this->password;
    }

    public function getLastVisit()
    {
        return $this->last_visit;
    }

    public function getLastVisitMinusValue()
    {
        //one minute
        $currentDateTime = date('Y-m-d H-i-s');
        $lastVisit = $this->last_visit;
        $currentMin60Sec = date("Y-m-d H-i-s", strtotime("-60 second"));
////        $dateMinusMinute = date('Y-m-d H-i-s', strtotime($this->last_visit) - 60 * 60 * 6);
        if ($lastVisit < $currentMin60Sec) {
            $difference = 0;
        } else {
            $difference = 1;
        }
//        $timestamp = strtotime($currentDateTime);
//
//        $currentDateToInt = strtotime($currentDateTime);
//        $lastVisitInt = strtotime($lastVisit);
//        $lvMin60Sec = $lastVisitInt - 60;

        return $difference;
    }

    public function setLastVisit()
    {
        $this->last_visit = date("Y-m-d H-i-s");
    }


//    public function getSelectedAccountId()
//    {
//        return $this->selected_account_id;
//    }
}
