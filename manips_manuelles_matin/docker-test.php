<?php

session_start();
if (isset($_SESSION['count']))
{
    $_SESSION["count"]++;
} else {
    $_SESSION["count"]=0;
}

$hostname = gethostname();
$dbname = 'mysql';
$dbuser = 'root';
$dbpass = 'root';
$dbhost = 'db';
$connect = mysql_connect($dbhost, $dbuser, $dbpass) or die("Unable to Connect to '$dbhost'");
mysql_select_db($dbname) or die("Could not open the db '$dbname'");
$test_query = "SHOW TABLES FROM $dbname";
$result = mysql_query($test_query);
$tblCnt = 0;

while($tbl = mysql_fetch_array($result)) {
    $tblCnt++;
}

echo "Container ID: $hostname<br />\n";
echo "Session information. ID: ".session_id().", count: ${_SESSION["count"]}<br />\n";

if (!$tblCnt) {
    echo "There are no tables<br />\n";
} else {
    echo "There are $tblCnt tables<br />\n";
}
?>
