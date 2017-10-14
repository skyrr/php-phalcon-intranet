<?= $this->partial('bodystart') ?>

<!-- menu profile quick info -->
<?= $this->partial('quick') ?>
<!-- /menu profile quick info -->

<br />

<!-- sidebar menu -->
<?= $this->partial('sidebar') ?>
<!-- /sidebar menu -->

<!-- /menu footer buttons -->
<?= $this->partial('menufooter') ?>
<!-- /menu footer buttons -->
</div>
</div>

<!-- top navigation -->
<?= $this->partial('top') ?>
<!-- /top navigation -->

<!-- page content -->
<div class="right_col" role="main">
    <div class="">

        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <table class="table table-striped projects">
                        <thead>
                        <tr>
                            <th style="width: 1%">#</th>
                            <th style="width: 35%">Comment</th>
                            <th style="width: 24%">Date/Time</th>
                            <th style="width: 20%">User</th>
                            <th style="width: 20%">#Edit</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>#</td>
                            <td>
                                <a>Pesamakini Backend UI</a>
                                <br>
                                <small>Created 01.01.2015</small>
                            </td>
                            <td>
                                <a>01.01.2015</a>
                            </td>
                            <td>
                                <ul class="list-inline">
                                    <li>
                                        <img src="/assets/images/user.png" class="avatar" alt="Avatar">
                                    </li>
                                </ul>
                            </td>
                            <td>
                                <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                            </td>
                        </tr>
                        <tr>
                            <td>#</td>
                            <td>
                                <a>Pesamakini Backend UI</a>
                                <br>
                                <small>Created 01.01.2015</small>
                            </td>
                            <td>
                                <a>01.01.2015</a>
                            </td>
                            <td>
                                <ul class="list-inline">
                                    <li>
                                        <img src="/assets/images/user.png" class="avatar" alt="Avatar">
                                    </li>
                                </ul>
                            </td>
                            <td>
                                <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                            </td>
                        </tr>
                        <tr>
                            <td>#</td>
                            <td>
                                <a>Pesamakini Backend UI</a>
                                <br>
                                <small>Created 01.01.2015</small>
                            </td>
                            <td>
                                <a>01.01.2015</a>
                            </td>
                            <td>
                                <ul class="list-inline">
                                    <li>
                                        <img src="/assets/images/user.png" class="avatar" alt="Avatar">
                                    </li>
                                </ul>
                            </td>
                            <td>
                                <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                            </td>
                        </tr>
                        <tr>
                            <td>#</td>
                            <td>
                                <a>Pesamakini Backend UI</a>
                                <br>
                                <small>Created 01.01.2015</small>
                            </td>
                            <td>
                                <a>01.01.2015</a>
                            </td>
                            <td>
                                <ul class="list-inline">
                                    <li>
                                        <img src="/assets/images/user.png" class="avatar" alt="Avatar">
                                    </li>
                                </ul>
                            </td>
                            <td>
                                <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-4">
                    <div class="x_panel">
                        <div class="control-group">
                            <div class="input-group date" id="myDatepicker">
                                <input type="text" class="form-control" placeholder="Date and time">
                                <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                            </div>
                            <div class="input-group">
                                <select class="form-control">
                                    <option value="0.5">0:30 h</option>
                                    <option value="1">1:00 h</option>
                                    <option value="1.5">1:30 h</option>
                                    <option value="2">2:00 h</option>
                                    <option value="2.5">2:30 h</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="comment">
                                <span class="input-group-btn">
                                <button type="submit" class="btn btn-primary">Go!</button>
                            </span>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>1st floor conference room scheduler </h2>

                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                        <div id='calendar'></div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->

<!-- footer content -->
<?= $this->partial('footer') ?>
<!-- /footer content -->
</div>
</div>

<!-- calendar modal -->
<div id="CalenderModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" id="antoform2" class="form-horizontal calender" role="form">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myModalLabel2">Edit Calendar Entry</h4>
                </div>
                <div class="modal-body">

                    <div id="testmodal2" style="padding: 5px 20px;">
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

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default antoclose2" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary antosubmit2">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="CalenderModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" id="antoform2" class="form-horizontal calender" role="form">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myModalLabel2">Edit Calendar Entry</h4>
                </div>
                <div class="modal-body">

                    <div id="testmodal2" style="padding: 5px 20px;">
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

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default antoclose2" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary antosubmit2">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div>
<div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div>

<!-- /calendar modal -->

<!-- jQuery -->
<script src="/assets/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/assets/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="/assets/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="/assets/vendors/nprogress/nprogress.js"></script>
<!-- FullCalendar -->
<script src="/assets/vendors/moment/min/moment.min.js"></script>
<script src="/assets/vendors/fullcalendar/dist/fullcalendar.min.js"></script>

<!-- Custom Theme Scripts -->
<script src="/assets/build/js/custom.min.js"></script>

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



<script type="text/javascript" src="/assets/temp/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="/assets/temp/js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<script src="/assets/temp/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script>
    $('#myDatepicker').datetimepicker();

    $('#myDatepicker2').datetimepicker({
        format: 'DD.MM.YYYY'
    });

    $('#myDatepicker3').datetimepicker({
        format: 'hh:mm A'
    });

    $('#myDatepicker4').datetimepicker({
        ignoreReadonly: true,
        allowInputToggle: true
    });

    $('#datetimepicker6').datetimepicker();

    $('#datetimepicker7').datetimepicker({
        useCurrent: false
    });

    $("#datetimepicker6").on("dp.change", function(e) {
        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
    });

    $("#datetimepicker7").on("dp.change", function(e) {
        $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
    });
</script>

<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });
    $('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    $('.form_time').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        forceParse: 0
    });
</script>

</body>