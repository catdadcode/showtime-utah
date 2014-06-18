<?php

if (empty($wp)) {
	require_once('./wp-config.php');
	wp();
}

header('Content-Type: text/xml; charset=' . get_option('blog_charset'), true);
$link_cat = $_GET['link_cat'];
if ((empty ($link_cat)) || ($link_cat == 'all') || ($link_cat == '0')) {
	$link_cat = '';
} else { // be safe
	$link_cat = '' . urldecode($link_cat) . '';
	$link_cat = intval($link_cat);
}
?><?php echo '<?xml version="1.0"?'.">\n"; ?>
<!-- generator="wordpress/<?php bloginfo_rss('version') ?>" -->
<opml version="1.0">
	<head>
		<title>Links for <?php echo attribute_escape(get_bloginfo('name', 'display').$cat_name); ?></title>
		<dateCreated><?php echo gmdate("D, d M Y H:i:s"); ?> GMT</dateCreated>
	</head>
	<body>
<?php

if (empty ($link_cat))
	$cats = get_categories("type=link&hierarchical=0");
else
	$cats = array (get_category($link_cat));

foreach ((array) $cats as $cat) {
	$catname = apply_filters('link_category', $cat->name);

?>
<outline type="category" title="<?php echo attribute_escape($catname); ?>">
<?php

	$bookmarks = get_bookmarks("category={$cat->term_id}");
	foreach ((array) $bookmarks as $bookmark) {
		$title = attribute_escape(apply_filters('link_title', $bookmark->link_name));
?>
	<outline text="<?php echo $title; ?>" type="link" xmlUrl="<?php echo attribute_escape($bookmark->link_rss); ?>" htmlUrl="<?php echo attribute_escape($bookmark->link_url); ?>" updated="<?php if ('0000-00-00 00:00:00' != $bookmark->link_updated) echo $bookmark->link_updated; ?>" />
<?php

	}
?>
</outline>
<?php

}
?>

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
</opml>