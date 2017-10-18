{{ partial('bodystart') }}

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
<div class="right_col" role="main">
    <div class="">

        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-4">
                <div class="x_panel">
                    <form method="post">
                        <div>
                            <table align="center">
                                <tr>
                                    <td width="54%">
                                        <div>
                                            <div class="input-group date" id="myDatepicker2">
                                                <input name="date" type="text" class="form-control">
                                                <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                    </td>
                                    <td width="1%"></td>
                                    <td>
                                        <div>
                                            <div class="input-group date" id="myDatepicker3">
                                                <input name="time" type="text" class="form-control">
                                                <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>

                                        <div class="input-group">
                                            <select name="timeshift" class="form-control">
                                                <option value=0.5>0:30 hour</option>
                                                <option value=1>1:00 hour</option>
                                                <option value=1.5>1:30 hour</option>
                                                <option value=2>2:00 hours</option>
                                                <option value=2.5>2:30 hours</option>
                                            </select>
                                        </div>
                                        <div class="control-group">
                                            <div class="input-group">
                                                <input name="comment" type="text" class="form-control" placeholder="comment">
                                                <span class="input-group-btn">
                                                    <button type="submit" class="btn btn-primary">Go!</button>
                                                </span>
                                            </div>
                                        </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-4">
                <div class="x_panel">
                    <div class="control-group">
                        <label class="control-label" align="center">Nearest reservations:</label>
                        <div align="left"><a href="{{ url.get('calendar/1/show') }}"> Schedule meeting with new client </a></div>
                        <div align="left"><a href="{{ url.get('calendar/1/show') }}"> Schedule meeting with new client </a></div>
                        <div align="left"><a href="{{ url.get('calendar/1/show') }}"> Schedule meeting with new client </a></div>
                        <div align="left"><a href="{{ url.get('calendar/1/show') }}"> Schedule meeting with new client </a></div>
                        <div align="left"><a href="{{ url.get('calendar/1/show') }}"> Schedule meeting with new client </a></div>
                        <div align="right"><a href="{{ url.get('calendar/1/show') }}"> ...more </a></div>

                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">


            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>1st floor conference room scheduler </h2>
                        {#<small>Sessions</small>#}
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
{{ partial('footer') }}
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

{#<script type="text/javascript" src="/assets/temp/jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>#}
{#<script type="text/javascript" src="/assets/temp/bootstrap/js/bootstrap.min.js"></script>#}
<script type="text/javascript" src="/assets/temp/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="/assets/temp/js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<script src="/assets/temp/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script>
    $('#myDatepicker').datetimepicker();

    $('#myDatepicker2').datetimepicker({
        format: 'YYYY-MM-DD'
    });

    $('#myDatepicker3').datetimepicker({
        format: 'HH:mm'
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