<?php
/**
 * Created by PhpStorm.
 * User: volodymyr
 * Date: 18.08.16
 * Time: 11:33
 */
class TaskController extends \Phalcon\Mvc\Controller
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

//        $this->assets->addCss('assets/vendors/bootstrap/dist/css/bootstrap.min.css');
//        $this->assets->addCss('assets/vendors/font-awesome/css/font-awesome.min.css');
//        $this->assets->addCss('assets/vendors/nprogress/nprogress.css');
//        $this->assets->addCss('assets/vendors/iCheck/skins/flat/green.css');
//        $this->assets->addCss('assets/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css');
//        $this->assets->addCss('assets/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css');
//        $this->assets->addCss('assets/build/css/custom.min.css');

    }

    public function indexAction()
    {
        $user_id = $this->session->get("user_id");
        $tasks = Task::find(["user_id = '5' AND status = 0 AND archive=0",
            'order' => 'date DESC']);
        $this->view->tasks = $tasks;

        $tasksDone = Task::find(["user_id = '5' AND status = 1 AND archive=0"]);
        $this->view->tasksDone = $tasksDone;

        if ($this->request->ispost()) {
            $data = $this->request->getPost();
            $user_id = $this->user->getId();
            $status = 0;
            $date = date("Y-m-d H-i-s");
//            $comment = 'some comment';

            $task = new Task([
//                'comment' => $comment,
                'user_id' => $user_id,
                'status' => 0,
                'date' => $date,
                'archive' => 0,
//                'day' => $day,
//                'hour' => $hour,
//                'minute' => $minute,

            ]);
            $success = $task->create($data);
            if ($success) {
                return $this->response->redirect("task/index");
            } else {
                $messages = $task->getMessages();
                if ($messages) {
                    foreach ($messages as $message) {
                        $this->flash->error($message);
                    }
                }
            }
            return $this->response->redirect("task/index");
        }

    }

    public function createAction()
    {

        if ($this->request->ispost()) {
            $data = $this->request->getPost();
//            $user_id = $this->user->getId();

            $comment = 'some comment';

            $task = new Task([
                'comment' => $comment,
//                'user_id' => $user_id,
//                'floor_id' => $floor_id,
//                'year' => $year,
//                'month' => $month,
//                'day' => $day,
//                'hour' => $hour,
//                'minute' => $minute,

            ]);
            $success = $task->create($data);
            if ($success) {
                return $this->response->redirect("calendar/index");
            } else {
                $messages = $task->getMessages();
                if ($messages) {
                    foreach ($messages as $message) {
                        $this->flash->error($message);
                    }
                }
            }
            return $this->response->redirect("calendar/index");
        }
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
//        $floor_id = $this->dispatcher->getParam('id');
        $taskid = $this->dispatcher->getParam('taskid');
        $task = Task::findFirst($taskid);
        $success = $task->setArchive(1);

        $task->save();
//        $floor_id = $this->dispatcher->getParam('id');
        return $this->response->redirect("task/index");

    }

    public function doneAction()
    {
//        $floor_id = $this->dispatcher->getParam('id');
        $taskid = $this->dispatcher->getParam('taskid');
        $task = Task::findFirst($taskid);
        $success = $task->setStatus(1);

        $task->save();
//        $floor_id = $this->dispatcher->getParam('id');
        return $this->response->redirect("task/index");

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
