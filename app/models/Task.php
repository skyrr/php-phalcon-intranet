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
//    protected $year;
//    protected $month;
//    protected $day;
//    protected $time;
//    protected $hour;
//    protected $minute;
//    protected $timeshift;

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
    public function getYear()
    {
        return $this->year;
    }
    public function getMonth()
    {
        return $this->month;
    }
    public function getDay()
    {
        return $this->day;
    }
    public function getTime()
    {
        return $this->time;
    }
    public function getHour()
    {
        return $this->hour;
    }
    public function getMinute()
    {
        return $this->minute;
    }
    public function getTimeShift()
    {
        return $this->timeshift;
    }


    public function getOutcomeGroupedByCategory()
    {
        $outcome_grouped_by_category = $this->_modelsManager->executeQuery('SELECT SUM(amount), Category.name FROM [Transaction] INNER JOIN [Category] ON Category.id = Transaction.category_id WHERE amount < 0 AND account_id = ?0 GROUP BY category_id', [$this->id]);

        $result = [];
        foreach ($outcome_grouped_by_category as $item) {
            $item->{0} = abs($item->{0});
            $result[] = $item->toArray();
        }

        return $result;
    }

    public function getBalance()
    {
        return Transaction::sum([
            "account_id = '$this->id'",
            'column' => 'amount'
        ]);
    }

    public function getBalanceMonth()
    {
        return Transaction::sum([
            "account_id = '$this->id' AND YEAR(created_at) = YEAR(NOW()) AND MONTH(created_at) = MONTH(NOW())" ,
            'column' => 'amount'
        ]);
    }

    public function getBalanceToday()
    {
        return Transaction::sum([
            "account_id = '$this->id' AND DATE(created_at) = CURDATE()",
            'column' => 'amount'
        ]);
    }

    public function getCurrencyId()
    {
        return $this->currency_id;
    }

}
