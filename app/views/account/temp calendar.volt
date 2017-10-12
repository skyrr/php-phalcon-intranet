<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="index.php" class="site_title"><img src="assets/images/eLEDdesign-logo.svg" width="60" alt="..."><span>eLED Design</span> </a>
                </div>

                <div class="clearfix"></div>

                <!-- menu profile quick info -->
                {{ partial('quick') }}
                <!-- /menu profile quick info -->

                <br />

                <!-- sidebar menu -->
                {{ partial('sidebar') }}
                <!-- /sidebar menu -->

                <!-- /menu footer buttons -->
                {{ partial('menufooter') }}
                <!-- /menu footer buttons -->
            </div>
        </div>

        <!-- top navigation -->
        {{ partial('top') }}
        <!-- /top navigation -->

        <!-- page content -->

        <!-- calendar modal -->
        <div id="CalenderModalNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" id="myModalLabel">New Calendar Entry</h4>
                    </div>
                    <div class="modal-body">
                        <div id="testmodal" style="padding: 5px 20px;">
                            <form id="antoform" class="form-horizontal calender" role="form">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Title</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="title" name="title">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Description</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" style="height:55px;" id="descr" name="descr"></textarea>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default antoclose" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary antosubmit">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="CalenderModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title" id="myModalLabel2">Edit Calendar Entry</h4>
                    </div>
                    <div class="modal-body">

                        <div id="testmodal2" style="padding: 5px 20px;">
                            <form id="antoform2" class="form-horizontal calender" role="form">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Title</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="title2" name="title2">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Description</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" style="height:55px;" id="descr2" name="descr"></textarea>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default antoclose2" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary antosubmit2">Save changes</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div>
        <div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div>
        <!-- /calendar modal -->
        <!-- jQuery -->
        <script src="assets/vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="assets/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="assets/vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="assets/vendors/nprogress/nprogress.js"></script>
        <!-- FullCalendar -->
        <script src="assets/vendors/moment/min/moment.min.js"></script>
        <script src="assets/vendors/fullcalendar/dist/fullcalendar.min.js"></script>

        <!-- Custom Theme Scripts -->
        <script src="assets/build/js/custom.min.js"></script>

        <!-- FullCalendar -->
        <script>
            $(window).load(function() {
                var date = new Date(),
                        d = date.getDate(),
                        m = date.getMonth(),
                        y = date.getFullYear(),
                        started,
                        categoryClass;

                var calendar = $('#calendar').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
                    selectable: true,
                    selectHelper: true,
                    select: function(start, end, allDay) {
                        $('#fc_create').click();

                        started = start;
                        ended = end;

                        $(".antosubmit").on("click", function() {
                            var title = $("#title").val();
                            if (end) {
                                ended = end;
                            }

                            categoryClass = $("#event_type").val();

                            if (title) {
                                calendar.fullCalendar('renderEvent', {
                                            title: title,
                                            start: started,
                                            end: end,
                                            allDay: allDay
                                        },
                                        true // make the event "stick"
                                );
                            }

                            $('#title').val('');

                            calendar.fullCalendar('unselect');

                            $('.antoclose').click();

                            return false;
                        });
                    },
                    eventClick: function(calEvent, jsEvent, view) {
                        $('#fc_edit').click();
                        $('#title2').val(calEvent.title);

                        categoryClass = $("#event_type").val();

                        $(".antosubmit2").on("click", function() {
                            calEvent.title = $("#title2").val();

                            calendar.fullCalendar('updateEvent', calEvent);
                            $('.antoclose2').click();
                        });

                        calendar.fullCalendar('unselect');
                    },
                    editable: true,
                    events: [{
                        title: 'All Day Event',
                        start: new Date(y, m, 1)
                    }, {
                        title: 'Long Event',
                        start: new Date(y, m, d - 5),
                        end: new Date(y, m, d - 2)
                    }, {
                        title: 'Meeting',
                        start: new Date(y, m, d, 10, 30),
                        allDay: false
                    }, {
                        title: 'Lunch',
                        start: new Date(y, m, d + 14, 12, 0),
                        end: new Date(y, m, d, 14, 0),
                        allDay: false
                    }, {
                        title: 'Birthday Party',
                        start: new Date(y, m, d + 1, 19, 0),
                        end: new Date(y, m, d + 1, 22, 30),
                        allDay: false
                    }, {
                        title: 'Birthday Party2',
                        start: new Date(y, m, d + 1, 11, 0),
                        end: new Date(y, m, d + 1, 12, 30),
                        allDay: false
                    }, {
                        title: 'Click for Google',
                        start: new Date(y, m + 1, 28),
                        end: new Date(y, m + 2, 29),
                        url: 'http://google.com/'
                    }]
                });
            });
        </script>
        <!-- /FullCalendar -->
        <!-- /page content -->




        <!-- footer content -->
        {{ partial('footer') }}
        <!-- /footer content -->
    </div>
</div>

<!-- jQuery -->
<script src="assets/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="assets/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
{{ assets.outputJs() }}

{{ partial('scripts') }}
{{ partial('calendarscript') }}


</body>

{{ assets.outputCss() }}
</head>
{{ content() }}