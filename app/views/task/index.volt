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

                {#mail list#}

                <div class="col-md-2 col-sm-2 col-xs-12 mail_list_column">
                    <div class="x_title">
                        <h2>Add task</h2>
                        {#<small>User Mail</small>#}
                        <div class="clearfix"></div>
                    </div>
                    <form method="post">

                        <div align="center">
                            <input type="text" name="comment" id="search" placeholder="Task"
                                   class="form-control"/>
                            <br/>
                            <select class="form-control">
                                <option>Choose option</option>
                                <option>Option one</option>
                                <option>Option two</option>
                                <option>Option three</option>
                                <option>Option four</option>
                            </select>
                            <br/>
                            <button type="submit" class="btn btn-primary antosubmit2">ADD</button>
                        </div>
                    </form>
                </div>
                {#end mail list#}

                {#new message#}
                <div class="col-md-5 col-sm-5 col-xs-12  mail_list_column">
                    <div class="x_title">
                        <h2>In progress</h2>
                        {#<small>User Mail</small>#}
                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">

                        <div class="">
                            <ul class="to_do">
                                <li>
                                    <p>
                                    <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Schedule meeting with new client </p>
                                    <ul class="to_do">
                                        <li>
                                            <p>
                                            <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Create email address for new intern</p>
                                        </li>
                                        <li>
                                            <p>
                                            <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Create email address for new intern</p>
                                        </li>
                                        <li>
                                            <p>
                                            <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Create email address for new intern</p>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <p>
                                    <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Create email address for new intern</p>
                                </li>
                                <li>
                                    <p>
                                    <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Have IT fix the network printer</p>
                                </li>
                                <li>
                                    <p>
                                    <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Copy backups to offsite location</p>
                                </li>
                                <li>
                                    <p>
                                    <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Food truck fixie locavors mcsweeney</p>
                                </li>
                                <li>
                                    <p>
                                    <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Food truck fixie locavors mcsweeney</p>
                                </li>
                                <li>
                                    <p>
                                    <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Create email address for new intern</p>
                                </li>
                                <li>
                                    <p>
                                    <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Have IT fix the network printer</p>
                                </li>
                                <li>
                                    <p>
                                    <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Copy backups to offsite location</p>
                                </li>
                            </ul>
                        </div>
                    </div>                </div>
                {#new message#}

                {#new message#}
                <div class="col-md-5 col-sm-5 col-xs-12  mail_list_column">
                    <div class="x_title">
                        <h2>Done</h2>
                        {#<small>User Mail</small>#}
                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">

                        <div class="">
                            <ul class="to_do">
                                <li>
                                    <p>
                                    <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Schedule meeting with new client </p>
                                </li>
                                <li>
                                    <p>
                                    <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Create email address for new intern</p>
                                </li>
                                <li>
                                    <p>
                                    <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Have IT fix the network printer</p>
                                </li>
                                <li>
                                    <p>
                                    <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Copy backups to offsite location</p>
                                </li>
                                <li>
                                    <p>
                                    <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Food truck fixie locavors mcsweeney</p>
                                </li>
                                <li>
                                    <p>
                                    <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Food truck fixie locavors mcsweeney</p>
                                </li>
                                <li>
                                    <p>
                                    <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Create email address for new intern</p>
                                </li>
                                <li>
                                    <p>
                                    <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Have IT fix the network printer</p>
                                </li>
                                <li>
                                    <p>
                                    <div class="icheckbox_flat-green" style="position: relative;"><input type="checkbox" class="flat" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div> Copy backups to offsite location</p>
                                </li>
                            </ul>
                        </div>
                    </div>                </div>
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

