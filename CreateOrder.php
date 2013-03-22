<?php
/*
 * "CreateOrder.php"
 * View that loads and displays the available meal options and will allow user
 * to choose options and save them.
 * 
 * Author: Justin Walrath <walrathjaw@gmail.com>
 * Since 2/1/2013
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

require_once("Controllers/LoadMealOptions.php");
//require_once("Controllers/SaveMeal.php");
?>
<!DOCTYPE html>
<html>
<head>
	<title>IDI Chinese Friday</title>
	<link href="Styles/index.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<h1>Create an order</h1>
		<a href="index.php">Go Back</a><br>
		
		<?php
		
		$loader = new LoadMealOptions();	//Class to populate available meal data
		$meals = $loader->LoadMealData();	//MealData class.
		?>
		
		<form action='SubmitOrder.php' onsubmit="return validations()">
			<!--Show users-->
			<h3>Choose User:</h3>
			<select id='userSelect' name='userSelect'>
				<option value="nil" selected="selected"></option>
				<?php
				foreach ($meals->User as $key => $value)
				{
					print "<option value='".$key."'>".$value."</option>";
				}
				?>
			</select>
			
			<br>
			
			<!--Show Meals-->
			<h3>Choose Meal:</h3>
			<select id='mealSelect' name='mealSelect' size=25>
				<?php
				foreach ($meals->Meal as $key => $value)
				{
					print "<option value='".$key."'>".$value["name"]." - ".$value["price"]."</option>";
				}
				?>
			</select>
			<div id = 'mealOptions'></div>
			
			<!--Show Rice Options-->
			<h3>Choose Side:</h3>
			<select id='riceSelect' name='riceSelect'>
				<?php
				foreach ($meals->Rice as $key => $value)
				{
					print "<option value='".$key."'>".$value."</option>";
				}
				?>
			</select>
			<br>
			<input id="submitButton" type="submit" value="Submit" disabled="disabled"/>
			
		</form>
	</div>
	
	<!--Load scripts at the end so as to not freeze shit up.-->
	<script src="Scripts/jquery-1.9.0.min.js"></script>
	<script src="Scripts/CreateOrder.js"></script>
</body>
</html>
