<?php
/**
 * Created by PhpStorm.
 * User: volodymyr
 * Date: 24.08.16
 * Time: 11:03
 */
class Task extends \Phalcon\Mvc\Model
{
    protected $id;
    protected $subject;
    protected $user_id;
    protected $status;
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

    public function getSubject()
    {
        return $this->subject;
    }

    public function getSubjectSymbols($symbolNumber)
    {
        $subString = substr($this->subject, 0, $symbolNumber);
        if (!(strlen($this->subject) < $symbolNumber)) {
            $subString = $subString."...";
        }
        return $subString;
    }

    public function getUserId()
    {
        return $this->user_id;
    }
    public function getStatus()
    {
        return $this->status;
    }
    public function setStatus($status)
    {
        $this->status = $status;
    }
    public function getArchive()
    {
        return $this->archive;
    }
    public function setArchive($archive)
    {
        $this->archive = $archive;
    }
    public function getDate()
    {
        return $this->date;
    }
}
