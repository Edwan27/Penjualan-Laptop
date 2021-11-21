<!--
Into this file, we create a layout for welcome page.
-->

<?php
include_once('link.php');
include_once('header1.php');
require_once('connection.php');

$id = $_SESSION['id'];
$fname = $lname = $email = $gender = '';
$sql = "SELECT * FROM tbluser WHERE ID='$id'";
$result = mysqli_query($conn, $sql);
if(mysqli_num_rows($result) > 0)
{
	while($row = mysqli_fetch_assoc($result))
	{
		$fname = $row["Firstname"];
		$lname = $row["Lastname"];
		$email = $row["Email"];
		$gender = $row["Gender"];
	}
}

?>
<div class="jumbotron">
	<center>
		<h1>Welcome <?php echo $fname." ".$lname; ?></h1>
	</center>
</div>

<center>
<table border="3">
  <thead>
    <tr>
      <th>ID_CLIENT</th>
      <th>NAMA_PEMBELI</th>
      <th>NIK</th>
      <th>ALAMAT</th>
    </tr>
  </thead>
  <tbody>
  	<?php  

include "connection.php";

$result = mysqli_query($conn, 'select id_pembeli, nama_pembeli, nik, alamat from client');
foreach ($result as $nampil) {
	
	echo "<tr>";
	echo "<td>".$nampil['id_pembeli'];
	echo "<td>".$nampil['nama_pembeli'];
	echo "<td>".$nampil['nik'];
	echo "<td>".$nampil['alamat'];
}
    ?>
  </tbody>
</table>
</center>