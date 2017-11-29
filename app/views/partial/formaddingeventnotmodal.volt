<form method="post" id="simple" class="sol-md-3">
    <div>
        <table align="center">
            <tr>
                <td width="54%">
                    <div>
                        <div class="input-group date" id="myDatepicker22">
                            <input name="date" type="text" class="form-control">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                </td>
                <td width="1%"></td>
                <td>
                    <div>
                        <div class="input-group date" id="myDatepicker33">
                            <input name="time" type="text" class="form-control">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                </td>
            </tr>
        </table>

        <div class="input-group">
            <table>
                <tr>
                    <td>
                        <select name="floor_id" class="form-control">
                            <option value=1>1 floor</option>
                            <option value=2>2 floor</option>
                        </select>

                    </td>
                    <td>
                        <br>-
                    </td>
                    <td>
                        <select name="timeshift" class="form-control">
                            <option value=15>0:15 hour</option>
                            <option value=30>0:30 hour</option>
                            <option value=60>1:00 hour</option>
                            <option value=90>1:30 hour</option>
                            <option value=120>2:00 hours</option>
                            <option value=150>2:30 hours</option>
                        </select>

                    </td>
                </tr>
            </table>
        </div>
        <div class="control-group">
            <div class="input-group">
                <input name="comment" type="text" class="form-control" placeholder="title">
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-primary">Go!</button>
                </span>
            </div>
        </div>
    </div>
</form>
