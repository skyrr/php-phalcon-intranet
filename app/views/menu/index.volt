{{ partial('bodystart') }}

<!-- menu profile quick info -->
{{ partial('quick') }}
<!-- /menu profile quick info -->

<br />

<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
    <div class="menu_section">
        <br><br><br>
        <ul class="nav side-menu">
            <li><a><i class="fa fa-edit"></i> Scheduler <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="{{ url.get('calendar/1/index') }}">1st floor</a></li>
                    <li><a href="{{ url.get('calendar/2/index') }}">2nd floor</a></li>
                </ul>
            </li>
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
        <div class="page-title">
            <div class="title_left">
                <h3>Restaurant menu</h3>
            </div>

            <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for...">
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="button">Go!</button>
                    </span>
                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>
            <div class="mobileShow">
                <div class="row">
                    <div class="col-md-12">
                        <div class="x_panel">
                            <div class="x_content">
                                {#<embed src="/menu/menu.pdf" width="100%" height="1170" alt="pdf" type='application/pdf'>#}
                                <iframe id="miiframe" src="http://skyrr.space/menu/menu.pdf" style="width:100%; height:400px;" frameborder="0"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="desktopShow">
                <div class="row">
                    <div class="col-md-12">
                        <div class="x_panel">
                            <div class="x_content" >
                                {#<embed src="/menu/menu.pdf" width="100%" height="1170" alt="pdf" type='application/pdf'>#}
                                <iframe id="miiframe" src="http://skyrr.space/menu/menu.pdf" style="width:100%; height:1170px;" frameborder="0"></iframe>
                            </div>
                        </div>
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
{{ partial('calendarscript') }}
</body>