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
        <img class="img-responsive" src="/assets/img/menuR10.jpg" alt="Menu">
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