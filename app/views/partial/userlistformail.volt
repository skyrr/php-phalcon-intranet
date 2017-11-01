{% for user in userList %}
    <a href="{{  url.get('usermail/'~user.getId()~'/create')  }}">
        <div class="mail_list">
            <div class="right">
                <h3>{{ user.getName() }}</h3>
                {#<p>{{ user.getEmail() }}</p>#}
            </div>
        </div>
    </a>
{% endfor %}
