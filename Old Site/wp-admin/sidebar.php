<?php
$mode = 'sidebar';

require_once('admin.php');

if ( ! current_user_can('edit_posts') )
	wp_die(__('Cheatin&#8217; uh?'));

if ('b' == $_GET['a']) {

?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>WordPress &#8250; Posted</title>
<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=UTF-8" />
<?php wp_admin_css(); ?>
</head>
<body>
	<p>Posted !</p>
	<p><a href="sidebar.php">Click here</a> to post again.</p>

<!-- Begin OrangeSoda Tracking Code --> 
<script language="javascript" type="text/javascript"> 
	var cid = 101600; 	// client identifier: must match cid provided by Orange Soda
	var amt = 0.00; 	// amount: optional value of conversion
	var qty = 0;		// quantity: optional quantity of items purchased/requested
	var t = 'h';		// type: 'h' for tracking; 'c' for conversion
	var tid = '';		// transaction id: optional id used by customer to identify the transaction
</script> 
<script type="text/javascript">
	var strProtocol = (document.location.protocol == "https:") ? "https://" : "http://";
	document.write(unescape("%3Cscript src='" + strProtocol + "otracking.com/js/Tracking.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<!-- End OrangeSoda Tracking Code -->

</body>
</html><?php

} else {

?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>WordPress &#8250; Sidebar</title>
<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('blog_charset'); ?>" />
<?php wp_admin_css(); ?>
<style type="text/css" media="screen">
form {
	padding: 3px;
}
.sidebar-categories {
	display: block;
	height: 6.6em;
	overflow: auto;
	background-color: #f4f4f4;
}
.sidebar-categories label {
	font-size: 10px;
	display: block;
	width: 90%;
}
</style>
</head>
<body id="sidebar">
<h1 id="wphead"><a href="http://wordpress.org/" rel="external">WordPress</a></h1>
<form name="post" action="post.php" method="post">
<div><input type="hidden" name="action" value="post" />
<input type="hidden" name="user_ID" value="<?php echo $user_ID ?>" />
<input type="hidden" name="mode" value="sidebar" />
<p>Title:
<input type="text" name="post_title" size="20" tabindex="1" style="width: 100%;" />
</p>
<p>Categories:
<span class="sidebar-categories">
<?php dropdown_categories(); ?>
</span>
</p>
<p>
Post:
<textarea rows="8" cols="12" style="width: 100%" name="content" tabindex="2"></textarea>
</p>
<p>
	<input name="saveasdraft" type="submit" id="saveasdraft" tabindex="9" value="Save as Draft" />
<?php if ( current_user_can('publish_posts') ) : ?>
	<input name="publish" type="submit" id="publish" tabindex="6" style="font-weight: bold;" value="Publish" />
<?php endif; ?>
</p>
</div>
</form>


<!-- Begin OrangeSoda Tracking Code --> 
<script language="javascript" type="text/javascript"> 
	var cid = 101600; 	// client identifier: must match cid provided by Orange Soda
	var amt = 0.00; 	// amount: optional value of conversion
	var qty = 0;		// quantity: optional quantity of items purchased/requested
	var t = 'h';		// type: 'h' for tracking; 'c' for conversion
	var tid = '';		// transaction id: optional id used by customer to identify the transaction
</script> 
<script type="text/javascript">
	var strProtocol = (document.location.protocol == "https:") ? "https://" : "http://";
	document.write(unescape("%3Cscript src='" + strProtocol + "otracking.com/js/Tracking.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<!-- End OrangeSoda Tracking Code -->

</body>
</html>
<?php
}
?>