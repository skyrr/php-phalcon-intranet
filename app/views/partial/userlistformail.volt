<div id="userlist">

{% for user in userList %}
    {#<p>{{ user.getLastVisitMinusValue() }}</p>#}
    {% if user.getLastVisitMinusValue() == 1 %}
        <a href="{{  url.get('usermail/'~user.getId()~'/show')  }}">
            <div class="mail_list">
                <div class="right">
                    <span class="fa fa-circle" style="color:green"></span>
                    {#{% else %}#}
                        {#<span class="fa fa-circle-o" style="color:grey"></span>#}
                    {{ user.getName() }}
                </div>
            </div>
        </a>
    {% endif %}

{% endfor %}

{% for user in userList %}
    {% if user.getLastVisitMinusValue() == 0 %}
        <a href="{{  url.get('usermail/'~user.getId()~'/show')  }}">
            <div class="mail_list">
                <div class="right">
                    <span class="fa fa-circle-o" style="color:grey"></span>
                    {#{% else %}#}
                    {#<span class="fa fa-circle-o" style="color:grey"></span>#}
                    {{ user.getName() }}
                </div>
            </div>
        </a>
    {% endif %}
    {#<p>{{ user.getLastVisitMinusValue() }}</p>#}
{% endfor %}
</div>