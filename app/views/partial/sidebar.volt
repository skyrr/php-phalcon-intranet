
            <li><a><i class="fa fa-clone"></i> Restaurant menu <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="{{ url.get('menu/index') }}">Restaurant #10</a></li>
                    {#<li><a href="form_advanced.html">Advanced Components</a></li>#}
                </ul>
            </li>
            <li><a><i class="fa fa-edit"></i> Messages <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="{{ url.get('usermail/index') }}">Inbox</a></li>
                    <li><a href="{{ url.get('usermail/sent') }}">Sent</a></li>
                    <li><a href="{{ url.get('usermail/trash') }}">Trash</a></li>
                    {#<li><a href="{{ url.get('usermail/createmulti') }}">Multiple messages</a></li>#}
                    {% if user.getRole() == 1 %}
                    <li><a href="{{ url.get('usermail/create') }}">Message to all</a></li>
                    {% endif %}
                </ul>
            </li>
            {#<li><a><i class="fa fa-sitemap"></i> Tasks <span class="fa fa-chevron-down"></span></a>#}
                {#<ul class="nav child_menu">#}
                    {#<li><a href="{{ url.get('task/index') }}">Tasks</a></li>#}
                    {#<li><a href="{{ url.get('task/create') }}">New task</a></li>#}
                {#</ul>#}
            {#</li>#}

            </ul>
    </div>
</div>
