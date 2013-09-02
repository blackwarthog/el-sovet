<?php
// No direct access to this file
defined('_JEXEC') or die('Restricted access');
// import the Joomla modellist library
jimport('joomla.application.component.modellist');
/**
 * Модель данных
 */
class ESDelegationModelDelegationList extends JModelList
{
	/**
	 * Строим строку запроса в базу данных.
	 */
	/*protected function getListQuery()
	{
		//Запрашиваем информацию о текущем пользователе
		$user=JFactory::getUser();
		
		// Создаём новый объект JDatabaseQuery.		
		$db = JFactory::getDBO();
		$query = $db->getQuery(true);
		// Выбираем поля
		$query->select('id, name AS categoryname, d.delegateid AS delegateid, d.rating AS rating');
		$query->from('#__delegationcategory');
		$query->join('LEFT OUTER','#__delegation AS d ON d.categoryid = dc.id');
		// которые относятся к нашему пользователю
		$query->where('d.userid='.(int)$user->id.' OR d.userid is null');
		return $query;
	}*/
	protected function getCategoryListQuery()
	{
		//Запрашиваем информацию о текущем пользователе
		$user=JFactory::getUser();
			
		// Создаём новый объект JDatabaseQuery.		
		$db = JFactory::getDBO();
		$query = $db->getQuery(true);
		// Выбираем поля
		$query->select('id, name, description');
		$query->from('#__delegationcategory');
		$query->order('id ASC');
		return $query;
	}
	protected function getDelegationListQuery()
	{
		//Запрашиваем информацию о текущем пользователе
		$user=JFactory::getUser();
		
		// Создаём новый объект JDatabaseQuery.		
		$db = JFactory::getDBO();
		$query = $db->getQuery(true);
		// Выбираем поля
		$query->select('id, delegateid, categoryid, rating');
		$query->from('#__delegation');
		$query->where('userid='.(int)$user->id);
		$query->order('categoryid ASC');
		$query->order('rating DESC');
		return $query;
	}
	
	public function getCategoryItems()
	{
		// Get a storage key.
		// Так как у нас в модели два разных запроса, добавляем унмкальные ключи для кеша.
		$store = $this->getStoreId('Category');

		// Try to load the data from internal storage.
		if (isset($this->cache[$store]))
		{
			return $this->cache[$store];
		}

		 // Load the list items.
		 // Не используем кеш для запроса, из-за этого заменяем _getListQuery, на getListQuery
		 // Не используем глобальные настройки числа выводимых элементов, из-за этого оставляем в _getList только 1 параметр $query
		$query = $this->getCategoryListQuery();
		$items = $this->_getList($query);

		 // Check for a database error.
		if ($this->_db->getErrorNum())
		{
			$this->setError($this->_db->getErrorMsg());
			return false;
		}

		// Add the items to the internal cache.
		$this->cache[$store] = $items;

		return $this->cache[$store];
	}

	//Список делегатов попробуем получать всегда динамически, из-за этого никаких кешей 
	public function getDelegationItems()
	{
		 // Load the list items.
		 // Не используем кеш для запроса, из-за этого заменяем _getListQuery, на getListQuery
		 // Не используем глобальные настройки числа выводимых элементов, из-за этого оставляем в _getList только 1 параметр $query
		$query = $this->getDelegationListQuery();
		$items = $this->_getList($query);

		return $items;
	}
	
	public function getItems()
	{
		$items['category']=$this->getCategoryItems();
		$items['delegation']=$this->getDelegationItems();
		return $items;
	}
	
	
	
	public function getPagination()
    {
		jimport('joomla.html.pagination');
		$this->_pagination = new JPagination($this->getTotal(), 0,  100);
		echo $this->getTotal();
		return $this->_pagination;
    }
}
