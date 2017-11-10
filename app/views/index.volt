<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>eLED Design Management page </title>

    {#{{ assets.outputJs() }}#}
    <!-- bootstrap-wysiwyg -->
    <link href="../vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="../vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="../vendors/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="../vendors/starrr/dist/starrr.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    {#<link href="../build/css/custom.min.css" rel="stylesheet">#}

    <!-- Bootstrap -->
    <link href="/assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/assets/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/assets/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="/assets/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="/assets/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>

    <!-- Custom Theme Style -->
    <link href="/assets/build/css/custom.min.css" rel="stylesheet">
    <link href="/assets/build/css/custom1.css" rel="stylesheet">


    <!-- fullCalendar 2.2.5-->
    <link rel="stylesheet" href="/assets/plugins/fullcalendar/fullcalendar.min.css">
    <link rel="stylesheet" href="/assets/plugins/fullcalendar/fullcalendar.print.css" media="print">
    <!-- Theme style -->

    {#<link href="/assets/temp/bootstrap/css/bootstrap.min1.css" rel="stylesheet" media="screen">#}
    <link href="/assets/temp/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <!-- bootstrap-daterangepicker -->
    <link href="/assets/temp/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- bootstrap-datetimepicker -->
    <link href="/assets/temp/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" rel="stylesheet">

    <style type="text/css">

    </style>
</head>
<body class="nav-md">
{{ content() }}
<script>
    var ajax_call = function() {
        //your jQuery ajax code
    };

    var interval = 1000 * 60 * X; // where X is your every X minutes

    setInterval(ajax_call, interval);
</script>
</body>
</html>
