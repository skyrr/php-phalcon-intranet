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
            <div class="x_panel">
                <div class="x_title">
                    <h2>New message</h2>
                    {#<small>User Mail</small>#}
                    <div class="clearfix"></div>
                </div>
                {#mail list#}
                <div class="col-sm-3 mail_list_column">
                    <a href="{{  url.get('usermail/create')  }}" id="compose" class="btn btn-sm btn-success btn-block" type="button">COMPOSE</a>

                    <div align="center">
                        <input type="text" name="search" id="search" placeholder="Search User" class="form-control" />
                    </div>
                    <ul class="list-group" id="result"></ul>
                    {#{{ json_encoded_from_model }}#}
                    {% for user in userList %}
                        <a href="#">
                            <div class="mail_list">
                                <div class="right">
                                    <h3>{{ user.getName() }}</h3>
                                    {#<p>{{ user.getEmail() }}</p>#}
                                </div>
                            </div>
                        </a>
                    {% endfor %}
                </div>
                {#end mail list#}

                {#new message#}
                <div class="col-md-9 col-sm-9 col-xs-12 mail_list_column">
                    <form method="post">
                        {#<input name="recipient_email" type="text" class="form-control has-feedback-left" id="inputSuccess4" placeholder="recipient">#}
                        {#<br/>#}
                        <select name="recipient_id" id="inputSuccess4"  class="form-control has-feedback-left" required="">
                            <option value="">recipient..</option>
                            {% for user in userList %}
                                <option value="{{ user.getId() }}">{{ user.getName() }}</option>
                            {% endfor %}
                        </select>
                        <br/>
                        <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>
                        <input name="subject" type="text" class="form-control" placeholder="subject">
                        <br/>
                        <textarea name="text" class="form-control" rows="10" placeholder=""></textarea>
                        <br/>
                        <button type="submit" class="btn btn-success pull-right">Send</button>
                    </form>
                </div>

                {#new message#}
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
<!-- bootstrap-wysiwyg -->
<script src="/assets/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
<script src="/assets/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
<script src="/assets/vendors/google-code-prettify/src/prettify.js"></script>
<!-- jQuery Tags Input -->
<script src="/assets/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
<!-- Switchery -->
<script src="/assets/vendors/switchery/dist/switchery.min.js"></script>
<!-- Select2 -->
<script src="/assets/vendors/select2/dist/js/select2.full.min.js"></script>
<!-- Parsley -->
<script src="/assets/vendors/parsleyjs/dist/parsley.min.js"></script>
<!-- Autosize -->
<script src="/assets/vendors/autosize/dist/autosize.min.js"></script>
<!-- jQuery autocomplete -->
<script src="/assets/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
<!-- starrr -->
<script src="/assets/vendors/starrr/dist/starrr.js"></script>

