<?= $this->partial('bodystart') ?>

<!-- menu profile quick info -->
<?= $this->partial('quick') ?>
<!-- /menu profile quick info -->

<br />

<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
    <div class="menu_section">
        <br><br><br>
        <ul class="nav side-menu">
            <li><a><i class="fa fa-edit"></i> Scheduler <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="{{ url.get('calendar/1/show') }}">1st floor</a></li>
                    <li><a href="{{ url.get('calendar/2/show') }}">2nd floor</a></li>
                </ul>
            </li>
            <li><a><i class="fa fa-table"></i> Restaurant menu <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="{{ url.get('menu/index') }}">Menu</a></li>
                    {#<li><a href="form_advanced.html">Advanced Components</a></li>#}
                </ul>
            </li>
            <li><a><i class="fa fa-desktop"></i> Sample <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="general_elements.html">General Elements</a></li>
                    <li><a href="media_gallery.html">Media Gallery</a></li>
                    <li><a href="typography.html">Typography</a></li>
                    <li><a href="icons.html">Icons</a></li>
                    <li><a href="glyphicons.html">Glyphicons</a></li>
                    <li><a href="widgets.html">Widgets</a></li>
                    <li><a href="invoice.html">Invoice</a></li>
                    <li><a href="inbox.html">Inbox</a></li>
                    <li><a href="calendar.html">Calendar</a></li>
                </ul>
            </li>
            <li><a><i class="fa fa-table"></i> Sample <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="tables.html">Tables</a></li>
                    <li><a href="tables_dynamic.html">Table Dynamic</a></li>
                </ul>
            </li>
            <li><a><i class="fa fa-bar-chart-o"></i> Sample <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="chartjs.html">Chart JS</a></li>
                    <li><a href="chartjs2.html">Chart JS2</a></li>
                    <li><a href="morisjs.html">Moris JS</a></li>
                    <li><a href="echarts.html">ECharts</a></li>
                    <li><a href="other_charts.html">Other Charts</a></li>
                </ul>
            </li>        </ul>
    </div>
</div>


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
                        {% for calendarItem in calendarsFutureList %}
                            {#<div align="left"><a href="{{ url.get(urlForEdit) }}">  <b> {{ calendarItem.getDate() }} </b> at <b> {{ calendarItem.getTime() }}</b> for: <b>{{ calendarItem.getTimeShift() }}</b>min.  {{ calendarItem.getComment() }}</a></div>#}
                            <tr>
                                <td>{{ calendarItem.getId() }}</td>
                                <td>
                                    <a>{{ calendarItem.getComment() }}</a>
                                    <br>
                                </td>
                                <td>
                                    <a>{{ calendarItem.getDate() }} at {{ calendarItem.getTime() }}</a>
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
                                    <a href="{{ url.get('calendar/'~calendarItem.getFloorId()~'/'~ calendarItem.getId() ~'/remove') }}" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                                </td>
                            </tr>
                        {% endfor %}

                        </tbody>
                    </table>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-4">
                    <div class="x_panel">
                        {{ partial('formaddingevent') }}
                    </div>
                </div>


            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>{{ floor }} floor conference room scheduler </h2>

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
{{ partial('calendarscript') }}

</body>