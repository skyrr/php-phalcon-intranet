
<body class="login">
<div>
    <a class="hiddenanchor" id="signup"></a>
    <a class="hiddenanchor" id="signin"></a>

    <div class="login_wrapper">
        <div id="register" >
            <section class="login_content">
                <form method="post">
                    <h1>Create Account</h1>
                    <div>
                        <input name="name" id="txtusername"  type="text" class="form-control" placeholder="Username" required="" />
                    </div>
                    <div>
                        <input name="email" id="txtusername"  type="text" class="form-control" placeholder="Email" required="" />
                    </div>
                    <div>
                        <input  name="password" id="txtpassword" type="password" class="form-control" placeholder="Password" required="" />
                    </div>
                    <div>
                        <button class="btn btn-default submit" type="submit">Submit</button>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <p class="change_link">Already a member ?
                            <a href="{{ url.get("/") }}" class="to_register"> Log in </a>
                        </p>

                        <div class="clearfix"></div>
                        <br />

                        <div>
                            <p>© 2017 All Rights Reserved. eLED DESIGN s.r.o. </p>
                        </div>
                    </div>
                </form>
            </section>
        </div>
        {{ content() }}
    </div>
</div>
{{ assets.outputJs() }}
</body>
