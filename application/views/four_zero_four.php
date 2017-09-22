<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
    <head>
        <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
        <?php include 'includes.php';?>
        <title>Page not found | <?php echo $system_title;?></title>
    </head>
<body>
    <div class="navbar navbar-top navbar-inverse">
        <div class="navbar-inner">
            <div class="container-fluid">
                <a class="brand" href="<?php echo base_url();?>"><?php echo $system_name;?></a>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row-fluid">
            <div class="span8 offset2">
                <div class="error-box">
                    <div class="message-small">
                        Whoa! What are you doing here?
                    </div>
                    <div class="message-big">
                        404
                    </div>
                    <div class="message-small">
                        You are not where you're supposed to be
                    </div>
                    <div style="margin-top: 50px">
                        <a class="btn btn-blue" href="<?php echo base_url();?>">
                        <i class="icon-arrow-left"></i> Back to dashboard </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</html>