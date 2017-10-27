<?php
/**
 * Created by PhpStorm.
 * User: volodymyr
 * Date: 18.08.16
 * Time: 11:24
 */
class Message extends \Phalcon\Mvc\Model
{
    protected $id;
    protected $user_id;
    protected $recipient_id;
    protected $text;
    protected $title;
    protected $status;
    protected $priority;
    protected $created_at;

    protected function initialize()
    {
        $this->belongsTo('user_id', User::class, 'id');
    }

    public function beforeValidationOnCreate()
    {
        $this->created_at = date("Y-m-d H:i:s");
        $session = \Phalcon\Di::getDefault()->get('session');
        $this->user_id = $session->get("user_id");
    }

    public function validation()
    {
        $validation = new \Phalcon\Validation();
        $validation->add('amount', new \Phalcon\Validation\Validator\Numericality());

        return $this->validate($validation);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getUserId()
    {
        return $this->user_id;
    }

    public function getRecipientId()
    {
        return $this->recipient_id;
    }

    public function getText()
    {
        return $this->text;
    }

//    public function getT()
//    {
//        if ($this->isIncome()) {
//            return "+" . $this->amount;
//        } else {
//            return $this->amount;
//        }
//    }

    public function getTitle()
    {
        return $this->title;
    }

//    public function isIncome()
//    {
//        return ($this->amount > 0) ? true : false;
//    }
//
    public function getStatus()
    {
        return $this->status;
    }

    public function getPriority()
    {
        return $this->priority;
    }

    public function getCreatedAt()
    {
        return $this->created_at;
    }

//    public function setAmount($amount)
//    {
//        $this->amount = $amount;
//    }
}