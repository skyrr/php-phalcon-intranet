<?php
/**
 * Created by PhpStorm.
 * User: volodymyr
 * Date: 24.08.16
 * Time: 11:03
 */
class Groupmail extends \Phalcon\Mvc\Model
{
    public $id;
    public $user_id;
    public $text;
    public $created_at;

    protected function initialize()
    {
        $this->keepSnapshots(true);

        $this->belongsTo('user_id', User::class, 'id');

    }
    public function beforeCreate()
    {
        $date = date('Y-m-d H-i-s');
        if (!$this->created_at) { // use default value if the value is not set
            $this->created_at = $date;
        }

    }
    protected function beforeUpdate()
    {
    }

    public function getId()
    {
        return $this->id;
    }

    public function getRecipientId()
    {
        return $this->recipient_id;
    }

    public function getRecipientById()
    {
        $user = User::findfirst($this->recipient_id);
        return $user->getName();
    }

    public function getUserById()
    {
        $user = User::findfirst($this->user_id);
        return $user->getName();
    }

    public function getText()
    {
        return $this->text;
    }

    public function getSubject()
    {
        return $this->subject;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function getStatusToRecipient()
    {
        return $this->status_to_recipient;
    }

    public function getPriority()
    {
        return $this->priority;
    }

    public function getUserId()
    {
        return $this->user_id;
    }

    public function getDate()
    {
        return $this->date;
    }

}
