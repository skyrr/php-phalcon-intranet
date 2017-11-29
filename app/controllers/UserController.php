<?php
/**
 * Created by PhpStorm.
 * User: volodymyr
 * Date: 18.08.16
 * Time: 11:28
 */
use Phalcon\Http\Response;
use Phalcon\Mvc\Controller;

class UserController extends \Phalcon\Mvc\Controller
{
    public function beforeExecuteRoute()
    {
        $user_id = $this->session->get("user_id");
        $this->user = User::findFirst($user_id);
        $this->view->setVar('user', $this->user);
        $unreadMessages = 5;
        $this->view->unreadMessages = $unreadMessages;

//        if ($this->cookies->has('remember-me')) {
//            $user_id = (string) $this->cookies->get('remember-me');
//            $this->session->set("user_id", $user_id);
//            $this->view->cookie = (string) $this->cookies->get('remember-me');
//
//        } else {
//        $this->cookies->set('remember-me', $user_id, time() + 15 * 86400,"/");
//            echo "no cookie found";
////            die();
//        }
        $user_id = $this->session->get("user_id");
        $usermail = Usermail::find(["status_to_recipient = 0 AND recipient_id = '$user_id' AND archive_to_recipient = 0"]);
        $unreadMessages = count($usermail);
        $this->view->unreadMessages = $unreadMessages;

        $usermailtotop = Usermail::find(["status_to_recipient = 0 AND recipient_id = '$user_id' AND archive_to_recipient = 0", 'limit' =>4, 'order' => 'date DESC',]);
        $this->view->usermailtotop = $usermailtotop;

    }

    public function loginAction()
    {
        $this->assets->addJs("assets/plugins/jquery-validation/js/jquery.validate.min.js")
            ->addJs("assets/js/login.js");

        if ($this->request->isPost()) {
            $email = $this->request->getPost("email");
            $password = $this->request->getPost("password");

            $user = User::findFirst("email = '$email'");
            if ($user) {
                if ($this->security->checkHash($password, $user->password)) {
                    $this->session->set("user_id", $user->getId());
//                    $this->cookies->set('remember-me', $user->getId(), time() + 15 * 86400,"/");
                    return $this->response->redirect();
                }
            } else {
                //$this->security->hash(rand());
                $this->view->setVar("error", "Wrong password or email");
//                $error1 = 1;
//                $this->view->error1 = $error1;
//                $messages = $user->getMessages();
//                if ($messages) {
//                    foreach ($messages as $message) {
//                        $this->flash->error($message);
//                    }
//                }

//                $this->view->setVar("error", "Wrong password or email");

            }
        }
    }

    public function logoutAction()
    {
        if ($this->session->has("user_id")) {
            $this->session->destroy();
            $rememberMeCookie = $this->cookies->get("remember-me");

            // Delete the cookie
            $rememberMeCookie->delete();
        }

        return $this->response->redirect();
    }

    public function signInAction()
    {
        if ($this->session->has("user_id")) {
            return $this->response->redirect();
        }
        if ($this->request->isPost()) {
            $data = $this->request->getPost();
            $data['password'] = $this->security->hash($this->request->getPost('password'));

            $user = new User();

            $success = $user->create($data);
            if ($success) {
                $this->session->set("user_id", $user->getId());
//                $this->cookies->set('remember-me', $user->getId(), time() + 15 * 86400,"/");

                return $this->response->redirect("/");
//                return $this->response->redirect("/account/show");
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

    public function lastVisitAction()
    {
        //store data about last visit
        $user_id = $this->session->get("user_id");
        $user = User::findFirst($user_id);
        $success = $user->setLastVisit();
        $user->save();

    }

    public function showAction()
    {
        if ($this->request->isPost()) {
            $data = $this->request->getPost();

            $user_id = $this->session->get("user_id");
            $user = User::findFirst($user_id);

            $old_password = $this->request->getPost("old_password");
            $password = $this->request->getPost("password");
            $password_repeat = $this->request->getPost("password_repeat");

            if ($password == $password_repeat && ($this->security->checkHash($old_password, $this->user->password))) { //
//                $user = User::findFirst($user_id);
                $user->setPassword($this->security->hash($password));
                $success = $user->setPasswordChanged();
                $user->save();
                return $this->response->redirect();
            }else {
                $this->view->setVar("error", "Wrong password or passwords not match");
            }
        }
    }

    public function getnotificationAction()
    {
        $user_id = $this->session->get("user_id");
        $newmail = Newmail::find(["user_id = '$user_id'",
        ]);
        $cnt = count($newmail );
        if ($cnt == 0) {
            $response = new Response();
            $response->setStatusCode(200, "OK");
            // Set the content of the response
            $response->setContent("from else");
//            $response->send();

            return $response;
        } else {
            $response = new Response();
            $response->setStatusCode(200, "OK");
            // Set the content of the response
            foreach ($newmail as $newmailone ) {
                $newmailone->delete();
            };
            $response->setContent("You have $cnt unread messages!");
//            $response->send();
            unset($newmail);
            return $response;
        }
//        $response = new Response();
//
//
//
//        // Return the response
//        return $response;
        // Getting a response instance
//        $response = new Response();
//
//// Set status code
//        $response->setStatusCode(200, "OK");
//
//// Set the content of the response
//        $response->setContent("Good job");
//
//// Send response to the client
//        $response->send();
    }
}