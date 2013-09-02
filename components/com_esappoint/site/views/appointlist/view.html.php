<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted access');
 
// import Joomla view library
jimport('joomla.application.component.view');

/**
 * HTML View class for the ESDelegation Component
 */
class ESAppointViewAppointList extends JView
{

	function display($tpl = null) 
	{
		$user=JFactory::getUser();
		if ($user->id == 0)
		{	parent::display("service");
			return;
		}
 
		
		// Display the template
		parent::display($tpl);
	}
}

/**
 * Setting the toolbar
protected function addToolBar() 
{
		JToolBarHelper::title(JText::_('COM_ESDELEGATION_CATEGORIES'));
		JToolBarHelper::deleteList('', 'delegationlist.delete');
		JToolBarHelper::editList('delegation.edit');
		JToolBarHelper::addNew('delegation.add');
}	
 */
?>
