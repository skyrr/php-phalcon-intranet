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
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <img class="img-responsive" src="/assets/img/mbmainpage.jpg" alt="Chania">
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12 bg-success text-white text-center">
                    {#<pre class="bg-success col-xs-12" width="10%">#}
                    <h3>
                        {% for usermail in usermailforall %}
                            {{ usermail.getText() }}
                        {% endfor %}
                    </h3>
                    {#</pre>#}
                </div>
                {% if user.getPasswordChanged() == 0 %}
                <div class="col-md-12 col-sm-12 col-xs-12 bg-danger text-white text-center">
                    {#<pre class="bg-success col-xs-12" width="10%">#}
                    <h5>
                         <a href="{{ url.get("user/show") }}">Please, change password here</a>
                    </h5>
                    {#</pre>#}
                </div>
                {% endif %}

                <div class="col-md-8 col-sm-8 col-xs-12">
                    {#currencies#}
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_content counters counters-text-dark">
                                        <div class="col-md-4 col-sm-4 col-xs-4 text-center">
                                            <div class="counter appear-animation" data-appear-animation="fadeInUp" data-appear-animation-delay="300">
                                                <h2>21.40
                                                <small> / <i class="fa fa-usd"></i></small></h2>

                                                {#<p class="text-color-primary mb-xl">to CZK</p>#}
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-4 col-xs-4 text-center">
                                            <div class="counter appear-animation" data-appear-animation="fadeInUp" data-appear-animation-delay="600">
                                                <h2>25.46
                                                <small> / <i class="fa fa-eur"></i></small></h2>

                                                {#<p class="text-color-primary mb-xl">to CZK</p>#}
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-4 col-xs-4 text-center">
                                            <div class="counter appear-animation" data-appear-animation="fadeInUp" data-appear-animation-delay="900">
                                                <h2>28.43
                                                <small> / <i class="fa fa-gbp"></i></small></h2>

                                                {#<p class="text-color-primary mb-xl">to CZK</p>#}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    {#weather#}
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_content">
                                        <iframe id="forecast_embed" frameborder="0" height="245" width="100%" src="//forecast.io/embed/#lat=50.450023&lon=14.903543&name=Bradlec&units=uk"></iframe>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {#<div class="row">#}

                        {#<!-- Start to do list -->#}
                        {#<div class="col-md-6 col-sm-6 col-xs-12">#}
                        {#<div class="x_panel">#}
                        {#<div class="x_title">#}
                        {#<h2>To Do List </h2>#}
                        {#<div class="clearfix"></div>#}
                        {#</div>#}
                        {#<div class="x_content">#}

                        {#<div class="">#}
                        {#<ul class="to_do">#}
                        {#{% for task in tasks %}#}
                        {#<li>#}
                        {#{{ task.getSubjectSymbols(35) }}#}
                        {#</li>#}
                        {#{% endfor %}#}
                        {#</ul>#}
                        {#</div>#}
                        {#</div>#}
                        {#</div>#}
                        {#</div>#}
                        {#<!-- End to do list -->#}

                        {#</div>#}
                    </div>
                    <style>
                        #box {
                            height: 510px;
                            overflow: hidden;
                        }
                    </style>

                </div>
                <!-- Start weather -->
                <!-- Start usermail list -->
                <div class="col-md-4 col-sm-4 col-xs-12">
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
                <!-- End weather -->



            </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        {{ partial('footer') }}
        <!-- /footer content -->
    </div>
</div>
{{ partial('accountindexscript') }}