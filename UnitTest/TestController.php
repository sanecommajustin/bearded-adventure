<?php
require_once('DbTest.php');

//Tests Loading meal data from the database.
print "Load Meal Data: \nOutput-->\n";
print (LoadMealDataTest()) ? "\n-->Passed\n" : "\n-->Failed\n";
print "Store new meal: \nOutput-->\n";
print (StoreNewMeal()) ? "\n-->Passed\n" : "\n-->Failed\n";
?>