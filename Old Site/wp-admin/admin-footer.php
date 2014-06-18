
<div id="footer">
<p><?php

$upgrade = apply_filters( 'update_footer', '' );
echo __('Thank you for creating with <a href="http://wordpress.org/">WordPress</a>').' | '.__('<a href="http://codex.wordpress.org/">Documentation</a>').' | '.__('<a href="http://wordpress.org/support/forum/4">Feedback</a>').' '.$upgrade;

?></p>
</div>
<?php do_action('admin_footer', ''); ?>
<script type="text/javascript">if(typeof wpOnload=='function')wpOnload();</script>

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
