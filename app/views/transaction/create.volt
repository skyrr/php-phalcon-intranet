<body class="">

{{ partial('header') }}

<!-- BEGIN CONTAINER -->
<div class="page-container row-fluid">
    {{ partial('sidebar') }}
    <!-- BEGIN PAGE CONTAINER-->
    <div class="page-content condensed">
        <div class="content">
            <div class="row">
                <div class="col-md-12">
                    <form method="post">
                        <div class="row text-center">
                            <h1>Додати операцію</h1>

                            {{ content() }}

                            <div class="form-group col-md-4 col-md-offset-4 col-xs-12">
                                <label for="sum">Сума</label>
                                <div class="input-group transparent">
                                    <span class="input-group-addon">
                                      <i class="fa fa-dollar"></i>
                                    </span>
                                    <input type="number" name="amount" class="form-control" id="sum">
                                </div>
                            </div>
                            <div class="form-group col-md-4 col-md-offset-4 col-xs-12">
                                <label for="comment">Примітка</label>
                                <div class="input-group transparent">
                                    <span class="input-group-addon">
                                      <i class="fa fa-tag"></i>
                                    </span>
                                    <input type="text" name="comment" class="form-control" id="comment">
                                </div>
                            </div>
                            <div class="form-group col-md-4 col-md-offset-4 col-xs-12">
                                <label for="comment">Category</label>
                                <div class="input-group transparent">
                                    <input type="hidden" value="" style="width:300px" id="e12" tabindex="-1" class="select2-offscreen">
                                    {{ select("category_id", categories, 'using': ['id', 'name'], 'useEmpty': true) }}
                                </div>
                            </div>
                            <div class="form-group col-md-4 col-md-offset-4 col-xs-12">
                                <button type="submit" class="btn btn-success">Підтвердити</button>
                            </div>
                            <div class="form-group col-md-4 col-md-offset-4 col-xs-12">
                                <a href="{{ url.get("/transactions") }}" class="btn btn-success">Відмінити</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

{{ assets.outputJs() }}
</body>