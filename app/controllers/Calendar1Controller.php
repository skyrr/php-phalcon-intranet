<?php
/**
 * Created by PhpStorm.
 * User: volodymyr
 * Date: 18.08.16
 * Time: 11:33
 */
class Calendar1Controller extends \Phalcon\Mvc\Controller
{
    protected $user;
    protected $account;

    public function beforeExecuteRoute()
    {
        $user_id = $this->session->get("user_id");
        $this->user = User::findFirst($user_id);
        $this->view->setVar('user', $this->user);
    }

    public function indexAction()
    {
        $this->assets->addCss('assets/vendors/bootstrap/dist/css/bootstrap.min.css');
        $this->assets->addCss('assets/vendors/font-awesome/css/font-awesome.min.css');
        $this->assets->addCss('assets/vendors/nprogress/nprogress.css');
        $this->assets->addCss('assets/vendors/iCheck/skins/flat/green.css');
        $this->assets->addCss('assets/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css');
        $this->assets->addCss('assets/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css');
        $this->assets->addCss('assets/build/css/custom.min.css');


        if (!$this->session->has("user_id")) {
            return $this->dispatcher->forward(["controller" => "user", "action" => "login"]);
        }

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

    public function calendar1Action()
    {
        $this->assets->addCss('assets/vendors/bootstrap/dist/css/bootstrap.min.css');
        $this->assets->addCss('assets/vendors/font-awesome/css/font-awesome.min.css');
        $this->assets->addCss('assets/vendors/nprogress/nprogress.css');
        $this->assets->addCss('assets/vendors/iCheck/skins/flat/green.css');
        $this->assets->addCss('assets/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css');
        $this->assets->addCss('assets/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css');
        $this->assets->addCss('assets/build/css/custom.min.css');

//        $this->assets->addJs('assets/vendors/jquery/dist/jquery.min.js');
//        $this->assets->addJs('assets/vendors/bootstrap/dist/js/bootstrap.min.js');
//        $this->assets->addJs('assets/vendors/fastclick/lib/fastclick.js');
//        $this->assets->addJs('assets/vendors/nprogress/nprogress.js');
//        $this->assets->addJs('assets/vendors/moment/min/moment.min.js');
//        $this->assets->addJs('assets/vendors/fullcalendar/dist/fullcalendar.min.js');
//        $this->assets->addJs('assets/build/js/custom.min.js');
//        $this->assets->addJs('');
//        $this->assets->addJs('');

        if (!$this->session->has("user_id")) {
            return $this->dispatcher->forward(["controller" => "user", "action" => "login"]);
        }

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

    public function calendar2Action()
    {
        $this->assets->addJs('assets/plugins/jquery-sparkline/jquery-sparkline.js');
        $this->assets->addJs('assets/js/charts.js');
        $this->assets->addInlineJs('jQuery(document).ready(function($) {
                               $(".clickable-row").click(function() {
                               window.document.location = $(this).data("href");});});');

        if (!$this->session->has("user_id")) {
            return $this->dispatcher->forward(["controller" => "user", "action" => "login"]);
        }

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
//        $user_id = $this->session->get("user_id");
//        $user = User::findFirst($user_id);
//        $this->view->setVar('user', $user);
//
//        $accounts = $user->getAccount();
//
//        $this->view->accounts = $accounts;
        if (!$this->session->has("user_id")) {
            return $this->dispatcher->forward(["controller" => "user", "action" => "login"]);
        }

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
}
