<?php
session_start();
require_once 'components/db_connect.php';
$res = mysqli_query($connect, "SELECT * FROM users WHERE user_id=" . $_SESSION['user']);
$row = mysqli_fetch_array($res, MYSQLI_ASSOC);
if ($_GET['id']) {
    $id = $_GET['id'];
    
    $sql = "SELECT * FROM animals WHERE anim_id = {$id}";
    $result = mysqli_query($connect, $sql);
    if (mysqli_num_rows($result) == 1) {
        $data = mysqli_fetch_assoc($result); 
        $kind = $data['kind'];
        $breed = $data['breed'];
        $picture = $data['picture'];
        $sex = $data['sex'];
        $name = $data['name'];
        $size = $data['size'];
        $age = $data['age'];
        $location = $data['location'];
        $descript = $data['descript'];
        $status = $data['status'];  

} else {
    $tbody =  "<tr><td colspan='5'><center>No Data Available </center></td></tr>";
}};
mysqli_close($connect);

?>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>infos</title>
        <?php require_once 'components/boot.php'?>
        <link rel="stylesheet" type="text/css" href="2.css">
        <style type="text/css">
            .manageProduct {           
                margin: auto;
            }
            
            td {          
                text-align: center;
                vertical-align: middle;
            }
            tr {
                text-align: center;
            }
        .hero {
            background: rgb(2, 0, 36);
            background: linear-gradient(24deg, rgba(2, 0, 36, 1) 0%, rgba(0, 212, 255, 1) 100%);
        }
        .image{
            margin:1rem
        }
        
        </style>
        
        
   
 
  </head>

<body >
    <div class="">
        <div class="hero text-center d-flex">
            <div class="image" >
                <img class="userImage" src="./pictures/<?php echo $row['picture']; ?>" alt="<?php echo $row['f_name']; ?>">
                <p class="text-white"><?php echo $row['f_name']; ?></p>
            </div>
            <div class="name">
                <h1 class="text-white">Animal Adoption</h1>
                 <h3 class="text-danger">Details About this Pet</h3>
           </div>
        </div>
    </div>

    <div style="margin-top:1rem;" >    
        <a  href=<?php echo './adopting/adopt.php?id=' .$id?>><button  class='btn btn-success btn-sm' type='button'>Adopt this Pet</button></a>
        <a  href=<?php echo './more_of.php?id=' .$kind?>><button  class='btn btn-primary btn-sm' type='button'>More of this kind</button></a>
    </div>

    <div class="det-main text-center">
        <div class="det-left">
            <h2><span class="h5">Name:   </span><?php echo $name ?></h2>
            <h2><span class="h5">Kind:   </span><?php echo $kind ?></h2>
            <h2><span class="h5">Breed:   </span><?php echo $breed ?></h2>
            <h2><span class="h5"></span><?php echo $sex ?></h2>
            <h2><span class="h5">Age:   </span><?php echo $age ?></h2>
            <h2><?php echo $size ?> size</h2>
            <h2 class="h3"><?php echo $location ?></h2>
            <h2><?php echo $status ?></h2>
        </div>
        <div class="det-center" >
            <h1><?php echo $name ?></h1>
            <br>
            <img style="margin-top:5rem;margin-bottom:5rem; width:100%" class="" src="<?php echo 'pictures/' .$picture ?>" alt="">
        </div>
         
        <div class="det-right">
            <h1>Description:</h1>
            <br>
            <br>
            <h3><?php echo $descript ?></h3>
        </div>
    </div>
    
    <?php include 'components/footer.php' ?>
</body>