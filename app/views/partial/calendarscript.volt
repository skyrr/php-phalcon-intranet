
<!-- jQuery -->
<script src="/assets/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/assets/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="/assets/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="/assets/vendors/nprogress/nprogress.js"></script>
<!-- bootstrap-datetimepicker -->
<script src="/assets/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<!-- jquery.inputmask -->
<script src="/assets/vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
<!-- jQuery Knob -->
<script src="/assets/vendors/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- Cropper -->
<script src="/assets/vendors/cropper/dist/cropper.min.js"></script>

<!-- FullCalendar -->
<script src="/assets/vendors/moment/min/moment.min.js"></script>
<script src="/assets/vendors/fullcalendar/dist/fullcalendar.min.js"></script>

<!-- Custom Theme Scripts -->
<script src="/assets/build/js/custom.min.js"></script>

<!-- FullCalendar1 -->
<script>
    $(window).load(function() {
        var date = new Date(),
                d = date.getDate(),
                m = date.getMonth(),
                y = date.getFullYear(),
                started,
                categoryClass;

        var calendar = $('#calendar1').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            defaultView: 'agenda', // or 'agenda' or 'basic'
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
                {% for calendar in calendars1 %}
                {
                    title: '{{ calendar.getComment() }} - {{ calendar.getYear() }}-{{ calendar.getMonth() }}-{{ calendar.getDay() }}   {{ calendar.getHour() }}:{{ calendar.getMinute() }}',
                    start: new Date({{ calendar.getYear() }}, {{ calendar.getMonth() }} - 1, {{ calendar.getDay() }}, {{ calendar.getHour() }}, {{ calendar.getMinute() }}),
                    end: new Date({{ calendar.getYear() }}, {{ calendar.getMonth() }} - 1, {{ calendar.getDay() }}, {{ calendar.getHour() }}, {{ calendar.getMinute() }} + {{ calendar.getTimeShift() }})
                },
                {% endfor %}

            ]
        });
    });
</script>
<!-- /FullCalendar -->
<!-- FullCalendar2 -->
<script>
    $(window).load(function() {
        var date = new Date(),
                d = date.getDate(),
                m = date.getMonth(),
                y = date.getFullYear(),
                started,
                categoryClass;

        var calendar = $('#calendar2').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            defaultView: 'agenda', // or 'agenda' or 'basic'
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
                {% for calendar in calendars2 %}
                {
                    title: '{{ calendar.getComment() }} - {{ calendar.getYear() }}-{{ calendar.getMonth() }}-{{ calendar.getDay() }}   {{ calendar.getHour() }}:{{ calendar.getMinute() }}',
                    start: new Date({{ calendar.getYear() }}, {{ calendar.getMonth() }} - 1, {{ calendar.getDay() }}, {{ calendar.getHour() }}, {{ calendar.getMinute() }}),
                    end: new Date({{ calendar.getYear() }}, {{ calendar.getMonth() }} - 1, {{ calendar.getDay() }}, {{ calendar.getHour() }}, {{ calendar.getMinute() }} + {{ calendar.getTimeShift() }})
                },
                {% endfor %}

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

    $('#myDatepicker22').datetimepicker({
        format: 'YYYY-MM-DD'
    });

    $('#myDatepicker3').datetimepicker({
        format: 'HH:mm'
    });

    $('#myDatepicker33').datetimepicker({
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