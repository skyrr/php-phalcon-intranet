<?php
/**
 * Created by PhpStorm.
 * User: volodymyr
 * Date: 18.08.16
 * Time: 11:33
 */
class MenuController extends \Phalcon\Mvc\Controller
{
    protected $user;
    protected $account;

    public function beforeExecuteRoute()
    {
        $user_id = $this->session->get("user_id");
        $this->user = User::findFirst($user_id);
        $this->view->setVar('user', $this->user);

        if (!$this->session->has("user_id")) {
            return $this->dispatcher->forward(["controller" => "user", "action" => "login"]);
        }
        $user = User::findFirst($user_id);
        $success = $user->setLastVisit();
        $user->save();
//        if ($this->cookies->has('remember-me')) {
//            $user_id = (string) $this->cookies->get('remember-me');
//            $this->session->set("user_id", $user_id);
//            $this->view->cookie = (string) $this->cookies->get('remember-me');
//
//        } else {
            $this->cookies->set('remember-me', $user->getId(), time() + 15 * 86400,"/");
//            echo "no cookie found";
////            die();
//        }

    }
    public function afterExecuteRoute()
    {
        $user_id = $this->session->get("user_id");
        $usermail = Usermail::find(["status_to_recipient = 0 AND recipient_id = '$user_id' AND archive_to_recipient = 0"]);
        $unreadMessages = count($usermail);
        $this->view->unreadMessages = $unreadMessages;

    }

    public function indexAction()
    {
        $this->assets->addInlineJs('jQuery(document).ready(function($) {
                               $(".clickable-row").click(function() {
                               window.document.location = $(this).data("href");});});');

//        if (!$this->session->has("user_id")) {
//            return $this->dispatcher->forward(["controller" => "user", "action" => "login"]);
//        }

        $user_id = $this->session->get("user_id");
        $user = User::findFirst($user_id);
        $this->view->setVar('user', $user);
        $this->user = $user;



        if ($this->request->isPost()) {
            $data = $this->request->getPost();
            //$user = new User($data);
            $success = $user->update($data);
            if ($success) {
                return $this->response->redirect();
            } else {
                $messages = $user->getMessages();
                if ($messages) {
                    foreach ($messages as $message) {
                        $this->flash->error($message);
                    }
                }
            }
        }

    }

    public function createAction()
    {

        if ($this->request->isPost()) {
            $data = $this->request->getPost();
            $user_id = $this->user->getId();
            $currency_id = $this->request->getPost("currency_id");
            $account = new Account(['user_id' => $user_id, 'currency_id' => $currency_id]);
            $success = $account->create($data);
            if ($success) {
                $this->user->update(['selected_account_id' => $account->getId()]);
            } else {
                $messages = $account->getMessages();
                if ($messages) {
                    foreach ($messages as $message) {
                        $this->flash->error($message);
                    }
                }
            }
            return $this->response->redirect("/account/show");
        }
        $currency = Currency::find();
        $this->view-> currency = $currency;


        //$this->view->user_id = $user_id;
    }

    public function editAction()
    {
        $id = $this->dispatcher->getParam('id');
        $account = Account::findFirst($id);
        $currency = Currency::find();
        $this->view->currency = $currency;
        if (!$account) {
            return $this->dispatcher->forward(["controller" => "exception", "action" => "notFound"]);
        }

        if ($this->request->isPost()){
            $data = $this->request->getPost();
            $success = $account->update($data);
            if (!$success) {
                $messages = $account->getMessages();
                if ($messages) {
                    foreach ($messages as $message) {
                        $this->flash->error($message);
                    }
                }
            }
        }

        $this->view->account = $account;
    }

    public function removeAction()
    {

    }

    public function showAction()
    {
        $user_id = $this->session->get("user_id");
        $user = User::findFirst($user_id);
        $this->view->setVar('user', $user);

        $accounts = $user->getAccount();

        $this->view->accounts = $accounts;
    }
}
