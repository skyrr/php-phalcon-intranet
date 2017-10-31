<?php
/**
 * Created by PhpStorm.
 * User: volodymyr
 * Date: 18.08.16
 * Time: 11:33
 */
class UsermailController extends \Phalcon\Mvc\Controller
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

        $userList = User::find();
        $this->view->userList = $userList;

        $unreadMessages = 5;
        $this->view->unreadMessages = $unreadMessages;


    }

    public function indexAction()
    {
//        if (!$this->session->has("user_id")) {
//            return $this->dispatcher->forward(["controller" => "user", "action" => "login"]);
//        }

        $user_id = $this->session->get("user_id");
        $user = User::findFirst($user_id);
        $this->view->setVar('user', $user);
        $this->user = $user;

//        $usermail = Usermail::find(["user_id = $user_id AND archive=0"]);
        $usermail = Usermail::find(["archive = 0"]);
        $this->view->usermails = $usermail;

        if ($this->request->isPost()) {
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
            $data = $this->request->getPost();
//            $text = $this->request->getPost("text");
//            $subject = $this->request->getPost("subject");
//            $recipient = $this->request->getPost("recipient");
//            $recipient = User::findFirst($recipient);
//            $user_id = 5;
//            $recipient_id = 8;
//            $status = 1;
//            $priority = 1;
            $user_id = $this->user->getId();
            $recipient_id = 8;
            $status = 1;
            $priority = 1;
            $date = date("Y-m-d H-i-s");

            $usermail = new Usermail([
//                'user_id' => $user_id,
//                'recipient_id' => $recipient_id,
//                'status' => $status,
//                'priority' => $priority,
//                'date' => $date,
//                'archive' => '0',
            ]);
            $usermail->user_id = $user_id;
            $usermail->recipient_id = $recipient_id;
            $usermail->subject = $status;
            $usermail->priority = $priority;
            $usermail->date = $date;
            $usermail->archive = '0';

//                'text' => $text,
//                'subject' => $subject,
            $success = $usermail->create();
            if ($success) {
                return $this->response->redirect("usermail/create");
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
    public function sentAction()
    {
//        if (!$this->session->has("user_id")) {
//            return $this->dispatcher->forward(["controller" => "user", "action" => "login"]);
//        }

        $user_id = $this->session->get("user_id");
        $user = User::findFirst($user_id);
        $this->view->setVar('user', $user);
        $this->user = $user;

//        $usermail = Usermail::find(["user_id = $user_id AND archive=0"]);
        $usermail = Usermail::find(["archive = 0"]);
        $this->view->usermails = $usermail;

        if ($this->request->isPost()) {
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
            $data = $this->request->getPost();
//            $text = $this->request->getPost("text");
//            $subject = $this->request->getPost("subject");
//            $recipient = $this->request->getPost("recipient");
//            $recipient = User::findFirst($recipient);
//            $user_id = 5;
//            $recipient_id = 8;
//            $status = 1;
//            $priority = 1;
            $user_id = $this->user->getId();
            $recipient_id = 8;
            $status = 1;
            $priority = 1;
            $date = date("Y-m-d H-i-s");

            $usermail = new Usermail([
//                'user_id' => $user_id,
//                'recipient_id' => $recipient_id,
//                'status' => $status,
//                'priority' => $priority,
//                'date' => $date,
//                'archive' => '0',
            ]);
            $usermail->user_id = $user_id;
            $usermail->recipient_id = $recipient_id;
            $usermail->subject = $status;
            $usermail->priority = $priority;
            $usermail->date = $date;
            $usermail->archive = '0';

//                'text' => $text,
//                'subject' => $subject,
            $success = $usermail->create();
            if ($success) {
                return $this->response->redirect("usermail/create");
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
    public function trashAction()
    {
//        if (!$this->session->has("user_id")) {
//            return $this->dispatcher->forward(["controller" => "user", "action" => "login"]);
//        }

        $user_id = $this->session->get("user_id");
        $user = User::findFirst($user_id);
        $this->view->setVar('user', $user);
        $this->user = $user;

//        $usermail = Usermail::find(["user_id = $user_id AND archive=0"]);
        $usermail = Usermail::find(["archive = 0"]);
        $this->view->usermails = $usermail;

        if ($this->request->isPost()) {
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
            $data = $this->request->getPost();
//            $text = $this->request->getPost("text");
//            $subject = $this->request->getPost("subject");
//            $recipient = $this->request->getPost("recipient");
//            $recipient = User::findFirst($recipient);
//            $user_id = 5;
//            $recipient_id = 8;
//            $status = 1;
//            $priority = 1;
            $user_id = $this->user->getId();
            $recipient_id = 8;
            $status = 1;
            $priority = 1;
            $date = date("Y-m-d H-i-s");

            $usermail = new Usermail([
//                'user_id' => $user_id,
//                'recipient_id' => $recipient_id,
//                'status' => $status,
//                'priority' => $priority,
//                'date' => $date,
//                'archive' => '0',
            ]);
            $usermail->user_id = $user_id;
            $usermail->recipient_id = $recipient_id;
            $usermail->subject = $status;
            $usermail->priority = $priority;
            $usermail->date = $date;
            $usermail->archive = '0';

//                'text' => $text,
//                'subject' => $subject,
            $success = $usermail->create();
            if ($success) {
                return $this->response->redirect("usermail/create");
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

        $user_id = $this->session->get("user_id");
        $user = User::findFirst($user_id);
        $this->view->setVar('user', $user);
        $this->user = $user;

        $created_at = date("Y-m-d");

        if ($this->request->isPost()) {
            $data = $this->request->getPost();
//            $text = $this->request->getPost("text");
//            $subject = $this->request->getPost("subject");
//            $recipient = $this->request->getPost("recipient");
//            $recipient = User::findFirst($recipient);
//            $user_id = 5;
//            $recipient_id = 8;
//            $status = 1;
//            $priority = 1;

            $usermail = new Usermail([
                'user_id' => $user_id,
//                'recipient_id' => $recipient_id,
//                'text' => $text,
//                'subject' => $subject,
//                'status' => $status,
//                'priority' => $priority,
//                'created_at' => $created_at,
            ]);
            $success = $usermail->create($data);
            if ($success) {
                return $this->response->redirect("usermail/index");
            } else {
                $this->view->setVar("error", "Wrong password or email");
                $messages = $user->getMessages();
                if ($messages) {
                    foreach ($messages as $message) {
                        $this->flash->error($message);
                    }
                }
            }
        }
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
        $usermail_id = $this->dispatcher->getParam('usermailid');
        $usermail = Usermail::findFirst($usermail_id);
        if (!$usermail) {
            return $this->dispatcher->forward(['controller' => 'exception', 'action' => 'notFound']);
        }

        $success = $usermail->setArchive(1);

        $usermail->save();
        return $this->response->redirect("usermail/index");
    }

    public function showAction()
    {
        $user_id = $this->session->get("user_id");
        $user = User::findFirst($user_id);
        $this->view->setVar('user', $user);
        $this->user = $user;

        $usermailid = $this->dispatcher->getParam('usermailid');

        $usermail = Usermail::findFirst($usermailid);
        if (!$usermail) {
            return $this->dispatcher->forward(['controller' => 'exception', 'action' => 'notFound']);
        }

        $success = $usermail->setStatus(1);

        $usermail->save();

//        $usermail = Usermail::find(["user_id = $user_id AND archive=0"]);
        $usermail = Usermail::find(["archive = 0"]);
        $this->view->usermails = $usermail;

        $usermessage = Usermail::findfirst($usermailid);
        $this->view->usermessage = $usermessage;

        if ($this->request->isPost()) {
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
            $data = $this->request->getPost();
//            $text = $this->request->getPost("text");
//            $subject = $this->request->getPost("subject");
//            $recipient = $this->request->getPost("recipient");
//            $recipient = User::findFirst($recipient);
//            $user_id = 5;
//            $recipient_id = 8;
//            $status = 1;
//            $priority = 1;
            $user_id = $this->user->getId();
//            $recipient_id = 8;
//            $status = 1;
//            $priority = 1;
            $date = date("Y-m-d H-i-s");

            $usermail = new Usermail([
//                'user_id' => $user_id,
//                'recipient_id' => $recipient_id,
//                'status' => $status,
//                'priority' => $priority,
//                'date' => $date,
//                'archive' => '0',
            ]);
            $usermail->user_id = $user_id;
//            $usermail->recipient_id = $recipient_id;
//            $usermail->subject = $status;
//            $usermail->priority = $priority;
//            $usermail->date = $date;
//            $usermail->archive = '0';

//                'text' => $text,
//                'subject' => $subject,
            $success = $usermail->create();
            if ($success) {
                return $this->response->redirect("usermail/create");
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
