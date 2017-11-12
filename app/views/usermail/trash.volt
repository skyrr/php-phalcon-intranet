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

        {#<div class="page-title">#}
            {#<div class="title_left">#}
                {#<h3>Inbox Design <small>Some examples to get you started</small></h3>#}
            {#</div>#}

            {#<div class="title_right">#}
                {#<div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">#}
                    {#<div class="input-group">#}
                        {#<input type="text" class="form-control" placeholder="Search for...">#}
                        {#<span class="input-group-btn">#}
                      {#<button class="btn btn-default" type="button">Go!</button>#}
                    {#</span>#}
                    {#</div>#}
                {#</div>#}
            {#</div>#}
        {#</div>#}

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Trash</h2>
                        {#<small>User Mail</small>#}
                        <div class="clearfix"></div>
                    </div>


                    <!-- /MAIL LIST -->
                    <div class="col-sm-3 mail_list_column">
                        <a href="{{  url.get('usermail/create')  }}" id="compose" class="btn btn-sm btn-success btn-block" type="button">COMPOSE</a>

                        <div align="center">
                            <input type="text" name="search" id="search" placeholder="Search User" class="form-control" />
                        </div>
                        <ul class="list-group" id="result"></ul>
                        {#{{ json_encoded_from_model }}#}
                        {{ partial("userlistformail") }}
                    </div>
                    <!-- /MAIL LIST -->
                    <!-- CONTENT MAIL -->
                    <div class="col-sm-9">
                        <div class="inbox-body">
                            <div class="mail_heading row">
                            </div>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th style="width: 1%">#</th>
                                    <th style="width: 20%">To</th>
                                    <th style="width: 53%">Text</th>
                                    <th style="width: 14%">Date</th>
                                    <th style="width: 13%"></th>                                                                                                                                                                                                                                                                                                 </Operations></th>
                                </tr>
                                </thead>
                                <tbody>

                                {% for usermail in usermails %}
                                    {#<div align="left"><a href="{{ url.get(urlForEdit) }}">  <b> {{ calendarItem.getDate() }} </b> at <b> {{ calendarItem.getTime() }}</b> for: <b>{{ calendarItem.getTimeShift() }}</b>min.  {{ calendarItem.getComment() }}</a></div>#}
                                    <tr>
                                        <td>{% if  usermail.getStatus() == '0' %} <strong> {% endif %} {{ usermail.getId() }} {% if  usermail.getStatus() == '0' %} </strong> {% endif %}</td>

                                        <td>
                                            <a href="{{ url.get('usermail/'~ usermail.getId() ~'/show') }}">{% if  usermail.getStatus() == '0' %} <strong> {% endif %} {{ usermail.getRecipientById() }}{% if  usermail.getStatus() == '0' %} </strong> {% endif %}</a>
                                            <br>
                                        </td>
                                        <td>
                                            <a href="{{ url.get('usermail/'~ usermail.getId() ~'/show') }}">{% if  usermail.getStatus() == '0' %} <strong> {% endif %} {{ usermail.getText() }}{% if  usermail.getStatus() == '0' %} </strong> {% endif %}</a>
                                            <br>
                                        </td>
                                        <td>
                                            <a>{{ usermail.getDate() }}</a>
                                        </td>
                                        <td>
                                            <a href="{{ url.get('usermail/'~ usermail.getId() ~'/show') }}" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i>  </a>
                                            <a href="{{ url.get('usermail/'~ usermail.getId() ~'/removeforever') }}" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i>  </a>
                                        </td>
                                    </tr>
                                {% endfor %}

                                </tbody>
                            </table>
                        </div>

                    </div>
                    <!-- /CONTENT MAIL -->

                </div>
            </div>
        </div>
    </div>
</div>
</div>
        <!-- footer content -->
        {{ partial('footer') }}
        <!-- /footer content -->
    </div>
</div>

{{ partial('accountindexscript') }}