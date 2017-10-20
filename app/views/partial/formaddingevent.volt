<form method="post">
    <div>
        <table align="center">
            <tr>
                <td width="54%">
                    <div>
                        <div class="input-group date" id="myDatepicker2">
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
                        <div class="input-group date" id="myDatepicker3">
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
            <select name="timeshift" class="form-control">
                <option value=0.5>0:30 hour</option>
                <option value=1>1:00 hour</option>
                <option value=1.5>1:30 hour</option>
                <option value=2>2:00 hours</option>
                <option value=2.5>2:30 hours</option>
            </select>
        </div>
        <div class="control-group">
            <div class="input-group">
                <input name="comment" type="text" class="form-control" placeholder="comment">
                <span class="input-group-btn">
                                                    <button type="submit" class="btn btn-primary">Go!</button>
                                                </span>
            </div>
        </div>
    </div>
</form>