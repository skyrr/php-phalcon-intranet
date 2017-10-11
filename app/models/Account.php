<?php
/**
 * Created by PhpStorm.
 * User: volodymyr
 * Date: 24.08.16
 * Time: 11:03
 */
class Account extends \Phalcon\Mvc\Model
{
    protected $id;
    protected $name;
    protected $user_id;
    protected $currency_id;

    protected function initialize()
    {
        $this->keepSnapshots(true);

        $this->belongsTo('user_id', User::class, 'id');
        $this->belongsTo('currency_id', Currency::class, 'id');

        $this->hasMany(
            'id',
            Transaction::class,
            'account_id'
        );
    }

    protected function beforeUpdate()
    {
        if ($this->hasChanged('currency_id')) {
            $transactions = $this->getTransaction();
            foreach ($transactions as $transaction) {
                $old_currency = $this->getCurrency();
                $coefficient = $old_currency->getCoefficientByCurrencyId($this->currency_id);
                $transaction->setAmount($transaction->getAmount() * $coefficient);
                $transaction->update();
            }
        }
    }

    public function getId()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getUserId()
    {
        return $this->user_id;
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
