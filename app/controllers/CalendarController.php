<?php
/**
 * Created by PhpStorm.
 * User: volodymyr
 * Date: 18.08.16
 * Time: 11:33
 */
class CalendarController extends \Phalcon\Mvc\Controller
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


//        if (!$this->session->has("user_id")) {
//            return $this->dispatcher->forward(["controller" => "user", "action" => "login"]);
//        }

        $user_id = $this->session->get("user_id");
        $user = User::findFirst($user_id);
        $this->view->setVar('user', $user);
        $this->user = $user;

        $floor_id = $this->dispatcher->getParam('id');
        $urlForEdit = 'calendar/' . $floor_id . '/show';
        if ($floor_id == 1) {
            $floor = '1st';
        } else {
            $floor = '2nd';
        }

        $today = date("Ymd");
        $todayHM = date("H:i:s");
        $calendars = Calendar::find(
            [
                "date >= $today",
                "floor_id = $floor_id",
                'order' => 'date',
                'limit' => 5
            ]);
        $count = count($calendars);


        $this->view->urlForEdit = $urlForEdit;
        $this->view->floor = $floor;
        $this->view->floor_id = $floor_id;
        $this->view->count = $count;

        $this->view->calendars = $calendars;
        $this->view->today = $today;
        $this->view->todayHM = $todayHM;
//        if ($this->request->isPost()) {
//            $data = $this->request->getPost();
//            //$user = new User($data);
//            $success = $user->update($data);
//            if ($success) {
//                return $this->response->redirect();
//            } else {
//                $messages = $user->getMessages();
//                if ($messages) {
//                    foreach ($messages as $message) {
//                        $this->flash->error($message);
//                    }
//                }
//            }
//        }
        if ($this->request->ispost()) {
            $data = $this->request->getPost();
            $user_id = $this->user->getId();
            $id = $this->dispatcher->getParam('id');
            $floor_id = $id;
            $calendar = new Calendar(['user_id' => $user_id, 'floor_id' => $floor_id]);
            $success = $calendar->create($data);
            return $this->response->redirect("calendar/$id/index");
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
        /////////////////////////////////////////////////////////////////////////////////
//        if (!$this->session->has("user_id")) {
//            return $this->dispatcher->forward(["controller" => "user", "action" => "login"]);
//        }

        $user_id = $this->session->get("user_id");
        $user = User::findFirst($user_id);
        $this->view->setVar('user', $user);
        $this->user = $user;

        $id = $this->dispatcher->getParam('id');

        $calendar = Calendar::find("floor_id = $id");
        $count = count($calendar);
        ///////////////////
        $floor_id = $this->dispatcher->getParam('id');
        $urlForEdit = 'calendar/' . $floor_id . '/show';
        if ($floor_id == 1) {
            $floor = '1st';
        } else {
            $floor = '2nd';
        }

        $calendars = Calendar::find("floor_id = $floor_id");
        $count = count($calendars);


        $this->view->urlForEdit = $urlForEdit;
        $this->view->floor = $floor;
        $this->view->floor_id = $floor_id;
        $this->view->count = $count;
        $this->view->calendars = $calendars;

        ////////////////////////////

        if ($this->request->ispost()) {
            $data = $this->request->getPost();
            $user_id = $this->user->getId();
            $id = $this->dispatcher->getParam('id');
            $floor_id = $id;
            $calendar = new Calendar(['user_id' => $user_id, 'floor_id' => $floor_id]);
            $success = $calendar->create($data);
            return $this->response->redirect("calendar/$id/show");
        }
    }
}
