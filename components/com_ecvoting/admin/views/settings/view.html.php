<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted access');
 
// import Joomla view library
jimport('joomla.application.component.view');
 
/**
 * ESDelegation View
 */
class ECVotingViewSettings extends JView
{
	/**
	 * Categories view display method
	 * @return void
	 */
	function display($tpl = null) 
	{
		// Display the template
		parent::display($tpl);
	}
	
	/**
	 * Setting the toolbar
	 */
	protected function addToolBar() 
	{
			JToolBarHelper::title(JText::_('COM_ESDELEGATION_CATEGORIES'));
			JToolBarHelper::deleteList('', 'categories.delete');
			JToolBarHelper::editList('category.edit');
			JToolBarHelper::addNew('category.add');
	}	
}
