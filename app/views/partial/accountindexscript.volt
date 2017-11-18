
<!-- jQuery -->
<script src="/assets/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/assets/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="/assets/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="/assets/vendors/nprogress/nprogress.js"></script>
<!-- Chart.js -->
<script src="/assets/vendors/Chart.js/dist/Chart.min.js"></script>
<!-- gauge.js -->
<script src="/assets/vendors/gauge.js/dist/gauge.min.js"></script>
<!-- bootstrap-progressbar -->
<script src="/assets/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="/assets/vendors/iCheck/icheck.min.js"></script>
<!-- Skycons -->
<script src="/assets/vendors/skycons/skycons.js"></script>
<!-- Flot -->
<script src="/assets/vendors/Flot/jquery.flot.js"></script>
<script src="/assets/vendors/Flot/jquery.flot.pie.js"></script>
<script src="/assets/vendors/Flot/jquery.flot.time.js"></script>
<script src="/assets/vendors/Flot/jquery.flot.stack.js"></script>
<script src="/assets/vendors/Flot/jquery.flot.resize.js"></script>
<!-- Flot plugins -->
<script src="/assets/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
<script src="/assets/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
<script src="/assets/vendors/flot.curvedlines/curvedLines.js"></script>
<!-- DateJS -->
<script src="/assets/vendors/DateJS/build/date.js"></script>
<!-- JQVMap -->
<script src="/assets/vendors/jqvmap/dist/jquery.vmap.js"></script>
<script src="/assets/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="/assets/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="/assets/js/moment/moment.min.js"></script>
<script src="/assets/js/datepicker/daterangepicker.js"></script>

<!-- Custom Theme Scripts -->
<script src="/assets/build/js/custom.min.js"></script>

{#notification#}
<!-- Custom Theme Style -->
<script src="/assets/build/js/notify.js"></script>
<script src="/assets/build/js/notify.min.js"></script>
<script src="/assets/build/js/bootstrap-notify.js"></script>
<script src="/assets/build/js/bootstrap-notify.min.js"></script>


<!-- bootstrap-daterangepicker -->
<script>
    $(document).ready(function() {

        var cb = function(start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
            $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        };

        var optionSet1 = {
            startDate: moment().subtract(29, 'days'),
            endDate: moment(),
            minDate: '01/01/2012',
            maxDate: '12/31/2015',
            dateLimit: {
                days: 60
            },
            showDropdowns: true,
            showWeekNumbers: true,
            timePicker: false,
            timePickerIncrement: 1,
            timePicker12Hour: true,
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            },
            opens: 'left',
            buttonClasses: ['btn btn-default'],
            applyClass: 'btn-small btn-primary',
            cancelClass: 'btn-small',
            format: 'MM/DD/YYYY',
            separator: ' to ',
            locale: {
                applyLabel: 'Submit',
                cancelLabel: 'Clear',
                fromLabel: 'From',
                toLabel: 'To',
                customRangeLabel: 'Custom',
                daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
                monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                firstDay: 1
            }
        };
        $('#reportrange span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
        $('#reportrange').daterangepicker(optionSet1, cb);
        $('#reportrange').on('show.daterangepicker', function() {
            console.log("show event fired");
        });
        $('#reportrange').on('hide.daterangepicker', function() {
            console.log("hide event fired");
        });
        $('#reportrange').on('apply.daterangepicker', function(ev, picker) {
            console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));
        });
        $('#reportrange').on('cancel.daterangepicker', function(ev, picker) {
            console.log("cancel event fired");
        });
        $('#options1').click(function() {
            $('#reportrange').data('daterangepicker').setOptions(optionSet1, cb);
        });
        $('#options2').click(function() {
            $('#reportrange').data('daterangepicker').setOptions(optionSet2, cb);
        });
        $('#destroy').click(function() {
            $('#reportrange').data('daterangepicker').remove();
        });
    });
</script>
<!-- /bootstrap-daterangepicker -->

<!-- gauge.js -->
<script>
    var opts = {
        lines: 12,
        angle: 0,
        lineWidth: 0.4,
        pointer: {
            length: 0.75,
            strokeWidth: 0.042,
            color: '#1D212A'
        },
        limitMax: 'false',
        colorStart: '#1ABC9C',
        colorStop: '#1ABC9C',
        strokeColor: '#F0F3F3',
        generateGradient: true
    };
    var target = document.getElementById('foo'),
            gauge = new Gauge(target).setOptions(opts);

    gauge.maxValue = 6000;
    gauge.animationSpeed = 32;
    gauge.set(3200);
    gauge.setTextField(document.getElementById("gauge-text"));
</script>
<!-- /gauge.js -->
//script for notification

<script type="text/javascript">

    function setIframeSrc() {
        var s = "http://docs.google.com/gview?url=http://skyrr.space/menu/menu.pdf&embedded=true";
        var iframe1 = document.getElementById('miiframe');
        if ( -1 == navigator.userAgent.indexOf("MSIE") ) {
            iframe1.src = s;
        }
        else {
            iframe1.location = s;
        }
    }
    setTimeout(setIframeSrc, 5);
</script>
<script>
    var ajax_call = function() {
        //your jQuery ajax code
        $.get( "/user/lastvisit", function( data ) {
            $( ".result" ).html( data );
//            alert( "Load was performed." );
        });
        $.get(
                "/user/getnotification",
                {paramOne : 1, paramX : 'abc'},
                function(data) {
                    if (data == "from else") {
                    } else
                    {
                        document.getElementById('xyz').play();
//                        alert(' ' + data);
//                    alert("Thank you!");
                        $( "#here" ).load(window.location.href + " #here" );
                        $.notify({
                            title: '',
                            button: 'Confirm'
                        }, {
                            style: 'foo',
                            autoHide: false,
                            clickToHide: true
                        });
                    }
                }

        );
        $.notify('hello !!', {
            style: 'happyblue'
        });

    };

    var interval = 1000 * 10 * 1; // where X is your every X minutes // middle number means seconds
    //    var interval = 1000 * 60 * 1; // where X is your every X minutes

    setInterval(ajax_call, interval);
</script>

<script>
    //add a new style 'foo'
    $.notify.addStyle('foo', {
        html:
        "<div>" +
        "<div class='clearfix'>" +
        "<button class='no pull-right fa fa-close'></button>" +
        "<h4><a href=/usermail/index>view incoming mail</a> </h4>" +
        "</div>"
    });

    //listen for click events from this style
    $(document).on('click', '.notifyjs-foo-base .no', function() {
        //programmatically trigger propogating hide event
        $(this).trigger('notify-hide');
    });
    $(document).on('click', '.notifyjs-foo-base .yes', function() {
        //show button text
        alert($(this).text() + " clicked!");
        //hide notification
        $(this).trigger('notify-hide');
    });
</script>