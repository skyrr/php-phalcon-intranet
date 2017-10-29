<?php

use Phalcon\Loader;
use Phalcon\Mvc\View;
use Phalcon\Mvc\Application;
use Phalcon\Di\FactoryDefault;
use Phalcon\Mvc\Url as UrlProvider;
use Phalcon\Session\Adapter\Files as Session;
use Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter;

try {

    // Регистрируем автозагрузчик
    $loader = new Loader();
    $loader->registerDirs(array(
        '../app/controllers/',
        '../app/models/'
    ))->register();

    // Создаем DI
    $di = new FactoryDefault();

    $router = new \Phalcon\Mvc\Router(false);
    $router->add("/", [
        "controller" => "account",
        "action" => "index"
    ]);

    $router->add("/user/signin", [
        "controller" => "user",
        "action" => "signin"
    ]);

    $router->add("/user/logout", [
        "controller" => "user",
        "action" => "logout"
    ]);

    $router->add("/user/show", [
        "controller" => "user",
        "action" => "show"
    ]);


//    $router->add("/transactions", [
//        "controller" => "transaction",
//        "action" => "index"
//    ]);
//
//    $router->add("/transactions/{id}/edit", [
//        "controller" => "transaction",
//        "action" => "edit"
//    ]);
//
//    $router->add("/transactions/create", [
//        "controller" => "transaction",
//        "action" => "create"
//    ]);
//
    $router->add("/calendar/{id}/{eventId}/remove", [
        "controller" => "calendar",
        "action" => "remove"
    ]);

    $router->add("/calendar/{id}/index", [
        "controller" => "calendar",
        "action" => "index"
    ]);

    $router->add("/calendar/{id}/show", [
        "controller" => "calendar",
        "action" => "show"
    ]);


    $router->add("/account/{id}/edit", [
        "controller" => "account",
        "action" => "edit"
    ]);

    $router->add("/account/create", [
        "controller" => "account",
        "action" => "create"
    ]);

    $router->add("/menu/index", [
        "controller" => "menu",
        "action" => "index"
    ]);

    $router->add("/usermail/index", [
        "controller" => "usermail",
        "action" => "index"
    ]);

    $router->add("/usermail/create", [
        "controller" => "usermail",
        "action" => "create"
    ]);

    $router->add("/task/index", [
        "controller" => "task",
        "action" => "index"
    ]);

    $router->add("/task/create", [
        "controller" => "task",
        "action" => "create"
    ]);

    $router->notFound([
        "controller" => "exception",
        "action" => "notFound"
    ]);

    $di->set('router', $router);

    $assets = $di->get('assets');
//    $assets->addCss('/assets/plugins/pace/pace-theme-flash.css')
//        ->addCss('/assets/plugins/boostrapv3/css/bootstrap.min.css')
//        ->addCss('/assets/plugins/boostrapv3/css/bootstrap-theme.min.css')
//        ->addCss('/assets/plugins/font-awesome/css/font-awesome.css')
//        ->addCss('/assets/css/animate.min.css')
//        ->addCss('/assets/css/style.css')
//        ->addCss('/assets/css/responsive.css')
//        ->addCss('/assets/css/custom-icon-set.css')
//        ->addJs('/assets/plugins/jquery-1.8.3.min.js')
//        ->addJs('/assets/plugins/bootstrap/js/bootstrap.min.js')
//        ->addJs('/assets/plugins/pace/pace.min.js')
//        ->addJs('/assets/vendors/jquery/dist/jquery.min.js')
//        ->addJs('/assets/vendors/bootstrap/dist/js/bootstrap.min.js')
//        ->addJs('/assets/vendors/fastclick/lib/fastclick.js')
//        ->addJs('/assets/vendors/nprogress/nprogress.js')
//        ->addJs('/assets/vendors/Chart.js/dist/Chart.min.js')
//        ->addJs('/assets/vendors/gauge.js/dist/gauge.min.js')
//        ->addJs('/assets/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js')
//        ->addJs('/assets/vendors/iCheck/icheck.min.js')
//        ->addJs('/assets/vendors/skycons/skycons.js')
//        ->addJs('/assets/vendors/Flot/jquery.flot.js')
//        ->addJs('/assets/vendors/Flot/jquery.flot.pie.js')
//        ->addJs('/assets/vendors/Flot/jquery.flot.time.js')
//        ->addJs('/assets/vendors/Flot/jquery.flot.stack.js')
//        ->addJs('/assets/vendors/Flot/jquery.flot.resize.js')
//        ->addJs('/assets/vendors/flot.orderbars/js/jquery.flot.orderBars.js')
//        ->addJs('/assets/vendors/flot-spline/js/jquery.flot.spline.min.js')
//        ->addJs('/assets/vendors/flot.curvedlines/curvedLines.js')
//        ->addJs('/assets/vendors/DateJS/build/date.js')
//        ->addJs('/assets/vendors/jqvmap/dist/jquery.vmap.js')
//        ->addJs('/assets/vendors/jqvmap/dist/maps/jquery.vmap.world.js')
//        ->addJs('/assets/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js')
//        ->addJs('/assets/js/moment/moment.min.js')
//        ->addJs('/assets/js/datepicker/daterangepicker.js')
//        ->addJs('/assets/build/js/custom.min.js')
//        ->addCss('/assets/vendors/bootstrap/dist/css/bootstrap.min.css')
//        ->addCss('/assets/vendors/font-awesome/css/font-awesome.min.css')
//        ->addCss('/assets/vendors/nprogress/nprogress.css')
//        ->addCss('/assets/vendors/iCheck/skins/flat/green.css')
//        ->addCss('/assets/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css')
//        ->addCss('/assets/vendors/jqvmap/dist/jqvmap.min.css')
//        ->addCss('/assets/plugins/fullcalendar/fullcalendar.min.css')
//        ->addCss('/assets/plugins/fullcalendar/fullcalendar.print.css')
//        ->addCss('/assets/build/css/custom.min.css');

    // Настраиваем сервис для работы с БД
    $di->set('db', function () {
        return new DbAdapter(array(
            "host"     => "localhost",
            "port"     => "4040",
            "username" => "user",
            "password" => "314159Aa",
            "dbname"   => "eledmanage",
            "charset" => "utf8"
        ));
    });

    $eventsManager = new \Phalcon\Events\Manager();
    $eventsManager->attach('dispatch', function (\Phalcon\Events\Event $event, \Phalcon\Mvc\Dispatcher $dispatcher) {
        if ($event->getType() == 'beforeExecuteRoute') {
            $controller_name = $dispatcher->getControllerName();
            if ($controller_name == 'account' || $controller_name == 'transaction') {
                $assets = \Phalcon\Di::getDefault()->get('assets');
//                $assets->addCss('assets/css/magic_space.css')
//                    ->addCss('assets/plugins/jquery-scrollbar/jquery.scrollbar.css')
//                    ->addCss('assets/plugins/Mapplic/mapplic/mapplic.css')
//                    ->addCss('assets/plugins/jquery-scrollbar/jquery.scrollbar.css');
//                    ->addJs('assets/plugins/jquery-ui/jquery-ui-1.10.1.custom.min.js');
//                    ->addJs('assets/plugins/breakpoints.js')
//                    ->addJs('assets/plugins/jquery-lazyload/jquery.lazyload.min.js')
//                    ->addJs('assets/plugins/jquery-unveil/jquery.unveil.min.js')
//                    ->addJs('assets/plugins/jquery-block-ui/jqueryblockui.js')
//                    ->addJs('assets/plugins/jquery-scrollbar/jquery.scrollbar.min.js')
//                    ->addJs('assets/plugins/Mapplic/js/jquery.easing.js')
//                    ->addJs('assets/js/core.js')
//                    ->addJs('assets/plugins/jquery-numberAnimate/jquery.animateNumbers.js');
            }
        }
    });

    $dispatcher = $di->get('dispatcher');
    $dispatcher->setEventsManager($eventsManager);

    $di->setShared('session', function () {
        $session = new Session();
        $session->start();
        return $session;
    });

    // Настраиваем компонент View
    $di->set('view', function () {
        $view = new View();
        $view->setViewsDir('../app/views/');
        $view->setPartialsDir('partial/');
        $view->registerEngines(
            [
                ".volt" => View\Engine\Volt::class
            ]
        );
        return $view;

    });

    // Настраиваем базовый URI так, чтобы все генерируемые URI содержали директорию "tutorial"
    $di->set('url', function () {
        $url = new UrlProvider();
        $url->setBaseUri('/');
        return $url;
    });

    // Обрабатываем запрос
    $application = new Application($di);

    $response = $application->handle();

    $response->send();

} catch (\Exception $e) {
    echo "Exception: ", $e->getMessage(), "FILE: ", $e->getFile(), " LINE: ", $e->getLine();
}