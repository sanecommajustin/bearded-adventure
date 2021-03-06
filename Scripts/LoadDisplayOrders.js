//Script that loads the Orders and 
//Author: Justin Walrath <walrathjaw@gmail.com>
//Since: 2/7/2013
//
//Copyright 2013 Justin Walrath & Associates
// 	This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.

//Load as soon as the document is ready.
$(document).ready
(
	function()
	{
		//Load the user data immediately once the rest of the page loads
		$.getJSON("Controllers/ControlOrderLoading.php",
			{ 
				actionControl: "loadOrders"
			},
			function(orderList)
			{
				var orderTable = "";
						
				for(i = 0; i < orderList.length; i += 1)
				{
					orderTable += "<table class = 'DisplayOrder tutorial'>";
					orderTable += orderList[i];
					orderTable += "</table>";
				}
				
				orderTable += "<script src='Scripts/ManageDisplayOrders.js'></script>";
				
				$("#orderList").html(orderTable);
			}
		);
	}
);