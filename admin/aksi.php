<?php
session_start();
error_reporting(0);
include "../inc/koneksi.php";
include "../inc/tanggal.php";

$mod=$_GET[mod];
$act=$_GET[act];


// Menghapus data
if (isset($mod) AND $act=='hapus'){
  mysql_query("DELETE FROM ".$mod." WHERE id ='$_GET[id]'");
  header('location:admin.php?mod='.$mod);
}


//Add Category
elseif ($mod=='category' AND $act=='input'){
	$insert = mysql_query("INSERT INTO category (id,category) VALUES ('','$_POST[nama_kategori]')");
	if($insert == FALSE){
		echo "<p>Kategori gagal ditambahkan, alesannya:".(mysql_error())."</p>";
		}
	header('location:admin.php?mod='.$mod);
	}
//Category Update
elseif ($mod=='category' AND $act=='update'){
	$update = mysql_query("UPDATE category SET category = '$_POST[nama_kategori]' WHERE id = '$_POST[id]'");
	if($update ==FALSE){
		echo "<p>Update gagal dilakukan karena:".(mysql_error())."</p>";
		}
	header('location:admin.php?mod='.$mod);
	}
	
//Add Product
elseif ($mod=='product' AND $act=='input'){
$lokasi_file 	= $_FILES['fgambar']['tmp_name'];
$tipe_file		= $_FILES['fgambar']['type'];
$nama_file		= $_FILES['fgambar']['name'];

move_uploaded_file($lokasi_file,"../foto/$nama_file");
	$insert = mysql_query("INSERT INTO product (product_name,
												price,
												image,
												id_category,
												deskripsi) 
										VALUES ('$_POST[product_name]',
												'$_POST[price]',
												'$nama_file',
												'$_POST[cat]',
												'$_POST[deskripsi]')");
	header('location:admin.php?mod='.$mod);
}
//Product Update
elseif ($mod=='product' AND $act=='update'){
	$lokasi_file	= $_FILES['fgambar']['tmp_name'];
	$tipe_file		= $_FILES['fgambar']['type'];
	$nama_file		= $_FILES['fgambar']['name'];

	//If the image doesnt change
	if (empty($lokasi_file)){
		mysql_query("UPDATE product SET product_name		= '$_POST[product_name]',
										price		= '$_POST[price]',
										id_category	= '$_POST[cat]',
										deskripsi	= '$_POST[deskripsi]'
									WHERE id = '$_POST[id]'");
	}
	else {
		move_uploaded_file($lokasi_file,"../foto/$nama_file");
		mysql_query("UPDATE product SET product_name= '$_POST[product_name]',
										price		= '$_POST[price]',
										image	= '$nama_file',
										id_category	= '$_POST[cat]',
										deskripsi	= '$_POST[deskripsi]'
									WHERE id = '$_POST[id]'");
	}
	header('location:admin.php?mod='.$mod);
}
?>
