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
        $date = date("Y-m-d H-i-s");
        if (!$this->created_at) { // use default value if the value is not set
            $this->created_at = $date;
        }

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

    public function getArchive()
    {
        return $this->archive;
    }
    public function getArchiveToRecipient()
    {
        return $this->archiveToRecipient;
    }

    public function getResponseTo()
    {
        return $this->responseto;
    }

    public function setArchive($archive)
    {
        $this->archive = $archive;
    }

    public function getRemoveForever()
    {
        return $this->remove_forever;
    }

    public function setRemoveForever($archive)
    {
        $this->remove_forever = $archive;
    }

    public function setArchiveToRecipient($archiveToRecipient)
    {
        $this->archive_to_recipient = $archiveToRecipient;
    }

    public function setStatus($status)
    {
        $this->status = $status;
    }
    public function setStatusToRecipient($status)
    {
        $this->status_to_recipient = $status;
    }

    public function getUsermailCount()
    {
        $usermail = Usermail::find(["status_to_recipient > '0'"]);
        return count($usermail);
    }

    public function getUsermailSymbols($symbolNumber)
    {
        $subString = substr($this->subject, 0, $symbolNumber);
        if (!(strlen($this->subject) < $symbolNumber)) {
            $subString = $subString."...";
        }
        return $subString;
    }


}
