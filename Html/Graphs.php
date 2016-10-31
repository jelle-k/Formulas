<?php
/* Include the pData class */
include("class/pData.class.php");

/* Create the pData object */
$MyData = new pData();  

/* Connect to the MySQL database */
$db = mysqli_connect("localhost", "root", "Passw0rd", "utilities");
mysql_select_db("pchart",$db);
    
/* Build the query that will returns the data to graph */
$Requete = "SELECT * FROM utlt";
$Result  = mysql_query($Requete,$db);
while($row = mysql_fetch_array($Result))
 {
  /* Get the data from the query result */
  $id = $row["id"];
  $adate = $row['adate'];
  $hwater = $row'hwater'];
    
    /* Save the data in the pData array */
  $myData->addPoints($timestamp,"id");
  $myData->addPoints($temperature,"adate");
  $myData->addPoints($humidity,"hwater");
 }

/* Put the timestamp column on the abscissa axis */
$myData->setAbscissa("adate");

/* Associate the "Humidity" data serie to the second axis */
$myData->setSerieOnAxis("hwater", 1);
 
/* Name this axis "Time" */
$myData->setXAxisName("Date");
 
/* Specify that this axis will display time values */
$myData->setXAxisDisplay(AXIS_FORMAT_DATE,"H:i");

?>