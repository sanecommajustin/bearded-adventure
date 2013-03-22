<?php
/*
 * Controller that loads all of the meals and options.
 * Author: Justin Walrath <walrathjaw@gmail.com>
 * Since: 3/22/2013
 * 
 	This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */


require_once 'db/db.php';	//Load the database functions

class LoadAllOptgroups
{
	public $db;
	
	/*
	 * Constructor opens the database connection.
	 */
	public function __construct()
	{
		$this->db = new DB();
	}
	
	/*
	 * Pulls the optgroups from the database.
	 * Return: List of meal groups, information mapped as $optgroups[group id][group name]
	 */
	public function LoadOptgroups()
	{
		return($this->db->PullOptgroups());
	}
}

?>