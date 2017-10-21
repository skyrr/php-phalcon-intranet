
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
            events: [
                {% for calendar in calendars %}
                {
                    {#start: new Date({{ calendar.getYear() }}, {{ calendar.getMonth() }}, {{ calendar.getDay() }}, {{ calendar.getHour() }}, {{ calendar.getMinute() }}),#}

                    title: '{{ calendar.getYear() }}-{{ calendar.getMonth() }}-{{ calendar.getDay() }}  :: {{ calendar.getHour() }} - {{ calendar.getMinute() }}',
                    start: new Date({{ calendar.getYear() }}, {{ calendar.getMonth() }} - 1, {{ calendar.getDay() }}, {{ calendar.getHour() }}, {{ calendar.getMinute() }}),
                    end: new Date({{ calendar.getYear() }}, {{ calendar.getMonth() }} - 1, {{ calendar.getDay() }}, {{ calendar.getHour() }}, {{ calendar.getMinute() }} + {{ calendar.getTimeShift() }})
                },
                {% endfor %}

//            {
//                title: 'All Day Event',
//                start: new Date(y, m, 1)
//            }, {
//                title: 'Long Event',
//                start: new Date(y, m, d - 5),
//                end: new Date(y, m, d - 2)
//            }, {
//                title: 'Meeting',
//                start: new Date(y, m, d, 10, 1),
//                end: new Date(y, m, d, 14, 12),
//                allDay: false
//            }, {
//                title: 'Lunch',
//                start: new Date(y, m, d + 14, 12, 0),
//                end: new Date(y, m, d, 14, 0),
//                allDay: false
//            }, {
//                title: 'Birthday Party',
//                start: new Date(y, m, d + 1, 19, 0),
//                end: new Date(y, m, d + 1, 22, 30),
//                allDay: false
//            }, {
//                title: 'Birthday Party2',
//                start: new Date(y, m, d + 1, 11, 0),
//                end: new Date(y, m, d + 1, 12, 30),
//                allDay: false
//            }, {
//                title: 'Click for Google',
//                start: new Date(y, m + 1, 28),
//                end: new Date(y, m + 2, 29),
//                url: 'http://google.com/'
//            },
            ]
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
