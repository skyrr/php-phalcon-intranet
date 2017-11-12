{% for user in userList %}
    <a href="{{  url.get('usermail/'~user.getId()~'/show')  }}">
        <div class="mail_list">
            <div class="right">
                {% if user.getLastVisitMinusValue() == 1 %}
                    <span class="fa fa-circle" style="color:green"></span>
                    {% else %}
                        <span class="fa fa-circle-o" style="color:grey"></span>
                {% endif %}
                {{ user.getName() }}
                {#<p>{{ user.getLastVisitMinusValue() }}</p>#}

            </div>
        </div>
    </a>
{% endfor %}
