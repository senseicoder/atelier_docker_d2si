<!-- BEGIN ANSIBLE MANAGED BLOCK -->
<?php
$sql="select hello from mytable";
$conn = new mysqli("db","root", "password","mydb");
// check connection
if ($conn->connect_error) {
    echo 'Unable to connect to DB. Error: '  . $conn->connect_error;
    exit();
}
$rs=$conn->query($sql);
if($rs === false) {
    echo "Unable to retrieve data: ".$conn->error;
} else {
    $rs->data_seek(0);
    $row = $rs->fetch_row();
}
?>
<html>
<body>
<h2>
</h2>
<p>Content of the first table row: <?php echo $row[0]; ?></p>
</body>
</html>
<!-- END ANSIBLE MANAGED BLOCK -->
