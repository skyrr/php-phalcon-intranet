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
                    <div class="col-md-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>2nd floor conference room scheduler <small>Sessions</small></h2>

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
{{ partial('calendarmodal') }}
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
</body>