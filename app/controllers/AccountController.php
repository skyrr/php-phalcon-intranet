<?php
/**
 * Created by PhpStorm.
 * User: volodymyr
 * Date: 18.08.16
 * Time: 11:33
 */
class AccountController extends \Phalcon\Mvc\Controller
{
    protected $user;
    protected $account;

    public function beforeExecuteRoute()
    {


        if (!$this->session->has("user_id")) {
            return $this->dispatcher->forward(["controller" => "user", "action" => "login"]);
        }

        $user_id = $this->session->get("user_id");
        $this->user = User::findFirst($user_id);
        //store data about last visit
        $user = User::findFirst($user_id);
        $success = $user->setLastVisit();
        $user->save();

        $this->view->setVar('user', $this->user);


        $tasks = Task::find(["user_id = '$user_id' AND status = 0 AND archive=0",
            'order' => 'date DESC', 'limit' => 11]);
        $this->view->tasks = $tasks;
        $usermail = Usermail::find(["archive_to_recipient = 0 AND recipient_id = '$user_id'",
            'order' => 'date DESC', 'limit' => 8]);
        $this->view->usermails = $usermail;

        $usermailforall = Groupmail::find([
            'order' => 'created_at DESC', 'limit' => 1]);
        $this->view->usermailforall = $usermailforall;

        $usermailtotop = Usermail::find(["status_to_recipient = 0 AND recipient_id = '$user_id' AND archive_to_recipient = 0", 'limit' =>4, 'order' => 'date DESC',]);
        $this->view->usermailtotop = $usermailtotop;

        $request = new \Phalcon\Http\Request('https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyArcU4Dp3OCdlgcg7Kmo6EQ6cp2NtbEpwM');
        $data = $request->getJsonRawBody();
        $response = json_encode($data);
//        $response = http_get("http://www.skyrr.space/", array("timeout"=>1), $info);
//        $data = $this->request->getPost('https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyArcU4Dp3OCdlgcg7Kmo6EQ6cp2NtbEpwM');
//        $this->view->data = $info;
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


        $user_id = $this->session->get("user_id");
        $user = User::findFirst($user_id);
        $this->view->setVar('user', $user);
        $this->user = $user;

//        $this->cookies->set('remember-me', $user_id, time() + 15 * 86400000,"/");


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

    public function showAction()
    {
        $user_id = $this->session->get("user_id");
        $user = User::findFirst($user_id);
        $this->view->setVar('user', $user);

        $accounts = $user->getAccount();

        $this->view->accounts = $accounts;
    }
}
