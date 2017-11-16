<?php
/**
 * Created by PhpStorm.
 * User: volodymyr
 * Date: 24.08.16
 * Time: 11:03
 */
class Newmail extends \Phalcon\Mvc\Model
{
    public $id;
    public $user_id;

    protected function initialize()
    {
        $this->keepSnapshots(true);

        $this->belongsTo('user_id', User::class, 'id');

    }
    public function beforeCreate()
    {

    }
    protected function beforeUpdate()
    {

    }

    public function getId()
    {
        return $this->id;
    }

    public function getUserById()
    {
        $user = User::findfirst($this->user_id);
        return $user->getName();
    }

    public function getUserId()
    {
        return $this->user_id;
    }

}
