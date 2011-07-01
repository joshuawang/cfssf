<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    
    <?php include_http_metas() ?>
    <?php include_metas() ?>
    <?php include_title() ?>
    <link rel="shortcut icon" href="/favicon.ico" />
    <?php include_stylesheets() ?>
    <?php include_javascripts() ?>
  </head>
  <body>
    <div>
	<?php if ($sf_user->isAuthenticated()): ?>
	  <div id="menu">
	    <ul>
	      <li><?php echo link_to('Grants', 'grantx') ?></li>
	      <li><?php echo link_to('Organizations', 'organization') ?></li>
	      <li><?php echo link_to('Logout', 'sf_guard_signout') ?></li> 
            </ul>
	  </div>
	<?php endif ?> 
    </div>
    <hr/>
    <?php echo $sf_content ?>
  </body>
</html>
