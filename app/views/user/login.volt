<body class="login">
<div>
    <a class="hiddenanchor" id="signup"></a>
    <a class="hiddenanchor" id="signin"></a>

    <div class="login_wrapper">
        <div id="register" >
            <section class="login_content">
                <form method="post">
                    {% if error1 is defined %}
                        <div class="alert alert-error">
                            <button class="close" data-dismiss="alert"></button>
                            {{ error1 }}
                        </div>
                    {% endif %}
                    <h1>Login Form</h1>
                    <div>
                        <input name="email" id="txtusername"  type="text" class="form-control" placeholder="Username" required="" />
                    </div>
                    <div>
                        <input  name="password" id="txtpassword" type="password" class="form-control" placeholder="Password" required="" />
                    </div>
                    <div>
                        <button class="btn btn-default submit" type="submit">Log in</button>
                        <a class="reset_pass" href="#">Lost your password?</a>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <p class="change_link">New to site?
                            <a href="{{ url.get("/user/signin") }}" class="to_register"> Create Account </a>
                        </p>

                        <div class="clearfix"></div>
                        <br />

                        <div>
                            <p>©2017 All Rights Reserved. eLED DESIGN s.r.o. </p>
                        </div>
                    </div>
                </form>
            </section>
        </div>
        {{ content() }}
    </div>
</div>
{#{{ assets.outputJs() }}#}
