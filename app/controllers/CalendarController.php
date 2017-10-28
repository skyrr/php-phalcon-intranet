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

//        if (!$this->session->has("user_id")) {
//            return $this->dispatcher->forward(["controller" => "user", "action" => "login"]);
//        }
        $unreadMessages = 5;
        $this->view->unreadMessages = $unreadMessages;


        $this->assets->addCss('assets/vendors/bootstrap/dist/css/bootstrap.min.css');
        $this->assets->addCss('assets/vendors/font-awesome/css/font-awesome.min.css');
        $this->assets->addCss('assets/vendors/nprogress/nprogress.css');
        $this->assets->addCss('assets/vendors/iCheck/skins/flat/green.css');
        $this->assets->addCss('assets/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css');
        $this->assets->addCss('assets/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css');
        $this->assets->addCss('assets/build/css/custom.min.css');


        // get floor id
        $floor_id = $this->dispatcher->getParam('id');

        //making url
        $urlForEdit = 'calendar/' . $floor_id . '/show';
        if ($floor_id == 1) {
            $floor = '1st';
        } else {
            $floor = '2nd';
        }

        $user_id = $this->session->get("user_id");
        $user = User::findFirst($user_id);
        $this->view->setVar('user', $user);
        $this->user = $user;

        // getting calendar items for index
        $today = date("Y-m-d");
        $todayHM = date("H:i:s");
        $calendars = Calendar::find(
            [
//                "date >= $today",
                "floor_id = $floor_id",
                'order' => 'date',
//                'limit' => 5
            ]);

        //getting calendar items for today
        $todayList = date("Ymd");
        $todayHMList = date("H:i:s");
        $calendarsList = Calendar::find(
            [
                "date = $todayList AND floor_id = $floor_id",
                'order' => 'date',
                'limit' => 5
            ]);

        //getting calendar items for future events
        $futureList = date("Ymd");
        $calendarsFutureList = Calendar::find(
            [
                "date >= $futureList AND floor_id = $floor_id",
                'order' => 'date',
                'limit' => 5
            ]);
        $count = count($calendars);

        $json_encoded_from_model = json_encode(Calendar::find()->toArray(), JSON_NUMERIC_CHECK);
        $this->view->json_encoded_from_model = $json_encoded_from_model;

        // sending vars to view
        $this->view->urlForEdit = $urlForEdit;
        $this->view->floor = $floor;
        $this->view->floor_id = $floor_id;
        $this->view->count = $count;

        $this->view->calendars = $calendars;
        $this->view->today = $today;
        $this->view->todayHM = $todayHM;
        $this->view->calendarsList = $calendarsList;
        $this->view->todayList = $todayList;
        $this->view->todayHMList = $todayHMList;
        $this->view->calendarsFutureList = $calendarsFutureList;


    }

    public function indexAction()
    {

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
            $date = $this->request->getPost("date");
            $time = $this->request->getPost("time");

            $year = date('Y', strtotime($date));
            $month = date('m', strtotime($date));
            $day = date('d', strtotime($date));

            $hour = date('H', strtotime($time));
            $minute = date('i', strtotime($time));

            $calendar = new Calendar([
                'user_id' => $user_id,
                'floor_id' => $floor_id,
                'year' => $year,
                'month' => $month,
                'day' => $day,
                'hour' => $hour,
                'minute' => $minute,

            ]);
            $success = $calendar->create($data);
            if ($success) {
                return $this->response->redirect("calendar/$id/index");
            } else {
                $messages = $calendar->getMessages();
                if ($messages) {
                    foreach ($messages as $message) {
                        $this->flash->error($message);
                    }
                }
            }
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
        $floor_id = $this->dispatcher->getParam('id');
        $eventId = $this->dispatcher->getParam('eventId');
        $calendar = Calendar::findFirst($eventId);
        if (!$calendar) {
            return $this->dispatcher->forward(['controller' => 'exception', 'action' => 'notFound']);
        }

        $calendar->delete();
        $floor_id = $this->dispatcher->getParam('id');
        return $this->response->redirect("calendar/$floor_id/show");

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

//        $user_id = $this->session->get("user_id");
//        $user = User::findFirst($user_id);
//        $this->view->setVar('user', $user);
//        $this->user = $user;

//        $id = $this->dispatcher->getParam('id');

////        $calendar = Calendar::find("floor_id = $id");
////        $count = count($calendar);
////        ///////////////////
////        $floor_id = $this->dispatcher->getParam('id');
////        $urlForEdit = 'calendar/' . $floor_id . '/show';
////        if ($floor_id == 1) {
////            $floor = '1st';
////        } else {
////            $floor = '2nd';
////        }
////
////        $calendars = Calendar::find("floor_id = $floor_id");
////        $count = count($calendars);
//
//
//        $this->view->urlForEdit = $urlForEdit;
//        $this->view->floor = $floor;
//        $this->view->floor_id = $floor_id;
//        $this->view->count = $count;
//        $this->view->calendars = $calendars;

        ////////////////////////////

        if ($this->request->ispost()) {
            $data = $this->request->getPost();
            $user_id = $this->user->getId();
            $id = $this->dispatcher->getParam('id');
            $floor_id = $id;
            $date = $this->request->getPost("date");
            $time = $this->request->getPost("time");

            $year = date('Y', strtotime($date));
            $month = date('m', strtotime($date));
            $day = date('d', strtotime($date));

            $hour = date('H', strtotime($time));
            $minute = date('i', strtotime($time));

            $calendar = new Calendar([
                'user_id' => $user_id,
                'floor_id' => $floor_id,
                'year' => $year,
                'month' => $month,
                'day' => $day,
                'hour' => $hour,
                'minute' => $minute,

            ]);
            $success = $calendar->create($data);
            return $this->response->redirect("calendar/$id/show");
        }
    }
}
