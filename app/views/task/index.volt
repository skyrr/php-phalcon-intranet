{{ partial('bodystart') }}

<!-- menu profile quick info -->
{{ partial('quick') }}
<!-- /menu profile quick info -->

<br />


            <!-- sidebar menu -->
            {{ partial('sidebarstart') }}
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
                    {{ partial('formaddingevent') }}
                </div>
            </div>
            <div class="col-md-4">
                <div class="x_panel">
                    <div class="control-group">
                        {#<label class="control-label" align="center">Today's reservations (total{{ count }}):</label>#}

                        {#{% for calendarItem in calendarsList %}#}
                            {#<div align="left"><a href="{{ url.get(urlForEdit) }}">  <b> {{ calendarItem.getDate() }} </b> at <b> {{ calendarItem.getTime() }}</b> for: <b>{{ calendarItem.getTimeShift() }}</b>min.  {{ calendarItem.getComment() }}</a></div>#}
                        {#{% endfor %}#}

                        {#<div align="right"><a href="{{ url.get(urlForEdit) }}"> ...more </a></div>#}

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
                        {#<h2>{{ floor }} floor conference room scheduler </h2>#}
                        {#<small>Sessions</small>#}
                        {#<div class="clearfix"></div>#}
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

<!-- /calendar modal -->

{{ partial('calendarscript') }}
</body>