<?php
session_start();
require_once 'components/db_connect.php';

// if adm will redirect to dashboard
if (isset($_SESSION['adm'])) {
    header("Location: dashboard.php");
    exit;
}
// if session is not set this will redirect to login page
if (!isset($_SESSION['adm']) && !isset($_SESSION['user'])) {
    header("Location: index.php");
    exit;
}

// select logged-in users details - procedural style
$res = mysqli_query($connect, "SELECT * FROM users WHERE user_id=" . $_SESSION['user']);
$row = mysqli_fetch_array($res, MYSQLI_ASSOC);
$sql = "SELECT adoptions.adpt_id, adoptions.date,   animals.kind, animals.name 
FROM adoptions JOIN animals on animals.anim_id = adoptions.fk_anim_id 
JOIN users on users.user_id = adoptions.fk_user_id WHERE users.user_id = ". $_SESSION['user'];  
$result = mysqli_query($connect ,$sql);
$tbody=''; //this variable will hold the body for the table
if(mysqli_num_rows($result)  > 0) {     
    while($rows = mysqli_fetch_array($result, MYSQLI_ASSOC)){         
        $tbody .= "<tr>
            
            <td>" .$rows['date']."</td>
            <td>" .$rows['kind']."</td>
            <td>" .$rows['name']."</td>
            </tr>";
    };
} else {
    $tbody =  "<tr><td colspan='5'><center>No Data Available </center></td></tr>";
}
mysqli_close($connect);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - <?php echo $row['fname']; ?></title>
    <?php require_once 'components/boot.php' ?>
     <link rel="stylesheet" type="text/css" href="2.css">
    <style>
        
        .img-thumbnail {
            width: 70px !important;
            height: 70px !important;
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
    <div class="hero text-center d-flex ">
        <div class="image" >
            <img class="userImage" src="pictures/<?php echo $row['picture']; ?>" alt="<?php echo $row['f_name']; ?>">
            <p class="text-white">Hi <?php echo $row['f_name']; ?></p>
        </div>
         <div class="name">
           <h1 class="text-white">Animal Adoption </h1> 
           <h3 class="text-danger">My Adoptions</h3>
        </div>
    </div>
    <div class=" text-center  ">
        <a class="btn btn-primary" href="home.php">Home</a> 
    </div>

    <div class="container">
        <p class='h2'>My Adoptions</p>
        <table class='table '>
            <thead class='table-success'>
                 <tr >
                    <th>Date</th>
                    <th>Kind</th>
                    <th>Name</th>
                </tr>
            </thead>
            <tbody >
                <?= $tbody;?>
            </tbody>
        </table>
        <div class="margin3"></div>
  </div>
  
  <?php include 'components/footer.php' ?>
</body>
</html>