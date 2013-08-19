<?php
	// No direct access to this file
	defined('_JEXEC') or die('Restricted access');

	//Include CBs API
	global $_CB_framework, $ueConfig, $mainframe;

	if ( defined( 'JPATH_ADMINISTRATOR' ) )
	{
		if ( ! file_exists( JPATH_ADMINISTRATOR . '/components/com_comprofiler/plugin.foundation.php' ) )
		{
			echo 'CB not installed!';
			return;
		}
		include_once( JPATH_ADMINISTRATOR . '/components/com_comprofiler/plugin.foundation.php' );
	}
	else
	{
		if ( ! file_exists( $mainframe->getCfg( 'absolute_path' ) . '/administrator/components/com_comprofiler/plugin.foundation.php' ) )
		{
			echo 'CB not installed!';
			return;
		}
		include_once( $mainframe->getCfg( 'absolute_path' ) . '/administrator/components/com_comprofiler/plugin.foundation.php' );
	}
?>

Компонент назначений
