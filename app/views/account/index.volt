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
            <br />
            <div class="row">

                <div class="col-md-8 col-sm-8 col-xs-12">

                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Welcome to eLED</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div class="dashboard-widget-content">
                                        <div class="col-md-4 col-sm-4 col-xs-12 hidden-small">
                                            <h2 class="line_30">Company message</h2>

                                            <table class="countries_list">
                                                <tbody>
                                                {% for usermail in usermailforall %}
                                                <tr>
                                                    <td>{{ usermail.getText() }} </td>
                                                    {#<td class="fs15 fw700 text-right">33%</td>#}
                                                </tr>
                                                {% endfor %}
                                                {#<tr>#}
                                                    {#<td>Message 2</td>#}
                                                    {#<td class="fs15 fw700 text-right">27%</td>#}
                                                {#</tr>#}
                                                {#<tr>#}
                                                    {#<td>Message 3</td>#}
                                                    {#<td class="fs15 fw700 text-right">16%</td>#}
                                                {#</tr>#}
                                                {#<tr>#}
                                                    {#<td>Message 4</td>#}
                                                    {#<td class="fs15 fw700 text-right">11%</td>#}
                                                {#</tr>#}
                                                {#<tr>#}
                                                    {#<td>Message 5</td>#}
                                                    {#<td class="fs15 fw700 text-right">10%</td>#}
                                                {#</tr>#}
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-m-8 col-md-8 col-sm-12 col-xs-12">
                                            <img src="/assets/img/future.jpg" class="col-m-12 col-md-12 col-sm-12 col-xs-12">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


                    <div class="row">
                        <!-- Start usermail list -->
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Incoming mail </h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                    <div class="">
                                        <ul class="to_do">
                                            {% for usermail in usermails %}
                                                <li>
                                                    {{ usermail.getUsermailSymbols(35) }}
                                                </li>
                                            {% endfor %}
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End usermail list -->




                        <!-- start Restaurant -->
                        {#<a href="https://www.accuweather.com/cs/cz/mlada-boleslav/125998/driving-current-weather/125998" class="aw-widget-legal">#}
                        {#<!--#}
                        {#By accessing and/or using this code snippet, you agree to AccuWeather’s terms and conditions (in English) which can be found at https://www.accuweather.com/en/free-weather-widgets/terms and AccuWeather’s Privacy Statement (in English) which can be found at https://www.accuweather.com/en/privacy.#}
                        {#-->#}
                        {#</a><div id="awtd1508841677357" class="aw-widget-36hour"  data-locationkey="125998" data-unit="c" data-language="cs" data-useip="false" data-uid="awtd1508841677357" data-editlocation="true" data-lifestyle="driving"></div><script type="text/javascript" src="https://oap.accuweather.com/launch.js"></script>#}

                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Restaurant menu <small></small></h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <iframe id="miiframe" src="https://drive.google.com/viewerng/viewer?
url=http://skyrr.space/menu/menu.pdf?
pid=explorer&efh=false&a=v&chrome=false&embedded=true" style="width:100%; height:400px;" frameborder="0"></iframe>
                                </div>
                            </div>

                        </div>
                        <!-- end of Restaurant -->

                        <!-- Start to do list -->
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>To Do List </h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                    <div class="">
                                        <ul class="to_do">
                                            {% for task in tasks %}
                                                <li>
                                                    {{ task.getSubjectSymbols(35) }}
                                                </li>
                                            {% endfor %}
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End to do list -->

                    </div>
                </div>
                <style>
                    #box {
                        height: 510px;
                        overflow: hidden;
                    }
                </style>
                <!-- Start weather -->
                <div class="col-md-4 col-sm-4 col-xs-12" id="box">
                    <a href="https://www.accuweather.com/cs/cz/mlada-boleslav/125998/driving-current-weather/125998" class="aw-widget-legal">
                    </a><div id="awtd1508841677357" class="aw-widget-36hour"  data-locationkey="125998" data-unit="c" data-language="cs" data-useip="false" data-uid="awtd1508841677357" data-editlocation="true" data-lifestyle="driving"></div><script type="text/javascript" src="https://oap.accuweather.com/launch.js"></script>
                </div>
                <!-- End weather -->
                {#<!-- weather widget start --><a target="_blank" href="http://www.booked.cz/weather/mlada-boleslav-56270"><img src="https://w.bookcdn.com/weather/picture/4_56270_1_13_009b48_293_ffffff_333333_08488D_1_ffffff_333333_0_6.png?scode=124&domid=&anc_id=92452"  alt="booked.net"/></a><!-- weather widget end -->#}


            </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        {{ partial('footer') }}
        <!-- /footer content -->
    </div>
</div>
{{ partial('accountindexscript') }}