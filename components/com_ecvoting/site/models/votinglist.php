<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted access');
// import the Joomla modellist library
jimport('joomla.application.component.modellist');
/**
 * Модель данных
 */
class ECVotingModelVotingList extends JModelList
{
	
	
	
	public function getPagination()
    {
		jimport('joomla.html.pagination');
		$this->_pagination = new JPagination($this->getTotal(), 0,  100);
		echo $this->getTotal();
		return $this->_pagination;
    }
}
