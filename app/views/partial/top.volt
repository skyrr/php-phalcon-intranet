<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <li class="">
                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <img src="/assets/images/img.jpg" alt="">{{ user.name }}
                        <span class=" fa fa-angle-down"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                        <li><a href="{{ url.get('user/show') }}"> Profile</a></li>
                        {#<li>#}
                            {#<a href="javascript:;">#}
                                {#<span class="badge bg-red pull-right">50%</span>#}
                                {#<span>Settings</span>#}
                            {#</a>#}
                        {#</li>#}
                        <li><a href="{{ url.get('user/logout') }}"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                    </ul>
                </li>

                <li role="presentation" class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-envelope-o"></i>
                        {% if unreadMessages %}<span class="badge bg-green">{{ unreadMessages }}</span>{% endif %}
                    </a>
                    <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                        {% for usermailt in usermailtotop %}
                        <li>
                            <a href="{{ url.get('usermail/'~ usermailt.getUserId() ~'/show') }}">
                                <span>
                          <span>{{ usermailt.getUserById() }}</span>
                          <span class="time">{{ usermailt.getDate() }} </span>
                        </span>
                                <span class="message">
                          {{ usermailt.getText() }}
                        </span>
                            </a>
                        </li>
                        {% endfor %}
                        <li>
                            <div class="text-center">
                                <a href="{{ url.get('usermail/index') }}">
                                    <strong>See All Alerts</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </li>

                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>
