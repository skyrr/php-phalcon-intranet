<?= $this->partial('bodystart') ?>

<!-- menu profile quick info -->
<?= $this->partial('quick') ?>
<!-- /menu profile quick info -->

<br />


            <!-- sidebar menu -->
            {{ partial('sidebarstartforshow') }}
            {{ partial('sidebar') }}
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
{{ partial('formaddingevent') }}
<div class="right_col" role="main">
    <div class="">

        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-6">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>1st floor</h2>
                        {#<small>Sessions</small>#}
                        <div class="clearfix"></div>
                    </div>
                    <table class="table table-striped projects">
                        <thead>
                        <tr>
                            <th style="width: 1%">#</th>
                            <th style="width: 35%">Comment</th>
                            <th style="width: 24%">Date/Time</th>
                            <th style="width: 20%">#Edit</th>
                        </tr>
                        </thead>
                        <tbody>
                        {% for calendarItem in calendarsFutureList1 %}
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
                                    <a href="{{ url.get('calendar/'~calendarItem.getFloorId()~'/'~ calendarItem.getId() ~'/remove') }}" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                                </td>
                            </tr>
                        {% endfor %}

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-6">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>2nd floor</h2>
                        {#<small>Sessions</small>#}
                        <div class="clearfix"></div>
                    </div>
                    <table class="table table-striped projects">
                        <thead>
                        <tr>
                            <th style="width: 1%">#</th>
                            <th style="width: 35%">Comment</th>
                            <th style="width: 24%">Date/Time</th>
                            <th style="width: 20%">#Edit</th>
                        </tr>
                        </thead>
                        <tbody>
                        {% for calendarItem in calendarsFutureList2 %}
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
                                    <a href="{{ url.get('calendar/'~calendarItem.getFloorId()~'/'~ calendarItem.getId() ~'/remove') }}" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                                </td>
                            </tr>
                        {% endfor %}

                        </tbody>
                    </table>
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