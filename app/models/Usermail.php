<?php
/**
 * Created by PhpStorm.
 * User: volodymyr
 * Date: 24.08.16
 * Time: 11:03
 */
class Usermail extends \Phalcon\Mvc\Model
{
    protected $id;
    protected $user_id;
    protected $recipient_id;
    protected $text;
    protected $subject;
    protected $status;
    protected $priority;
    protected $date;
    protected $archive;

    protected function initialize()
    {
        $this->keepSnapshots(true);

        $this->belongsTo('user_id', User::class, 'id');

    }

    protected function beforeUpdate()
    {
//        if ($this->hasChanged('currency_id')) {
//            $transactions = $this->getTransaction();
//            foreach ($transactions as $transaction) {
//                $old_currency = $this->getCurrency();
//                $coefficient = $old_currency->getCoefficientByCurrencyId($this->currency_id);
//                $transaction->setAmount($transaction->getAmount() * $coefficient);
//                $transaction->update();
//            }
//        }
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

    public function getArchive()
    {
        return $this->archive;
    }
    public function setArchive($archive)
    {
        $this->archive = $archive;
    }


}
