<?php
session_start();
require_once './components/db_connect.php';

if (!isset($_SESSION['adm']) && !isset($_SESSION['user'])) {
    header("Location: index.php");
    exit;
}

if (isset($_SESSION["user"])) {
    header("Location: home.php");
    exit;
}

$sql = "SELECT users.user_id, users.f_name, users.l_name, users.email,  users.address, users.birth_date, users.city, users.phone,animals.anim_id, animals.kind, animals.name, animals.breed, animals.age, animals.location, animals.size, animals.sex, adoptions.adpt_id, adoptions.date  FROM users 
JOIN adoptions ON adoptions.fk_user_id = users.user_id 
JOIN animals on animals.anim_id = adoptions.fk_anim_id
WHERE animals.status = 'Adopted'";
$result = mysqli_query($connect, $sql);

$tbody = '';

if(mysqli_num_rows($result)  > 0) {     
    while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
    
 $tbody .= "<tr>
            <td class='not-visible'>" . $row['adpt_id'] . "</td>
            <td>" . $row['f_name'] . "</td>
            <td>" . $row['l_name'] . " </td>
            <td class='not-visible'>" . $row['email'] . " </td>
            <td class='not-visible'>" . $row['address'] . "</td>
            <td class='not-visible'>" . $row['city'] . "</td>
            <td class='not-visible'>" . $row['birth_date'] . "</td>
            <td class='not-visible'>" . $row['phone'] . "</td>
            <td class='not-visible'>" . $row['anim_id'] . "</td>
            <td>" . $row['kind'] . "</td>
            <td>" . $row['name'] . "</td>
            <td class='not-visible'>" . $row['breed'] . " </td>
            <td class='not-visible'>" . $row['age'] . " </td>
            <td class='not-visible'>" . $row['location'] . "</td>
            <td class='not-visible'>" . $row['size'] . "</td>
            <td class='not-visible'>" . $row['sex'] . "</td>
            <td>" . $row['date'] . "</td>
            <td><a href='adopting/delete.php?id=" . $row['adpt_id'] . "'><button class='btn btn-danger btn-sm' type='button'>Delete</button></a></td>
         </tr>";
    }
    
} else {
    $tbody = "<tr><td colspan='5'><center>No Data Available </center></td></tr>";
}

mysqli_close($connect);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adm-Dashboard</title>
    <?php require_once './components/boot.php' ?>
       <link rel="stylesheet" type="text/css" href="2.css">
    <style type="text/css">
        .img-thumbnail {
            width: 70px !important;
            height: 70px !important;
        }

        td {
            text-align: left;
            vertical-align: middle;
        }

        tr {
            text-align: center;
        }

        .userImage {
            width: 100px;
            height: auto;
        }
    </style>
</head>

<body  >
<?php include 'components/hero.php'?>
        
            <div  class="text-center">
                <img class="userImage" src="./pictures/admavatar.png" alt="Adm avatar">
                <p class="">Administrator</p>
                
                <a class="btn btn-warning" href="dashboard.php">Back</a>
               
            </div>
            <div   class="text-center container ">
                <p class='h2'>Adoptions</p>

                <table class='table table1 table-striped'>
                    <thead class='table-success'>
                        <tr>
                            <th class='not-visible'>Adoption ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th class='not-visible'>Email</th>
                            <th class='not-visible'>Address</th>
                            <th class='not-visible'>City</th>
                            <th class='not-visible'>Date of Birth</th>
                            <th class='not-visible'>Phone</th>
                            <th class='not-visible'>Animal  ID</th>
                            <th>Kind</th>
                            <th>Name</th>
                            <th class='not-visible'>Breed</th>
                            <th class='not-visible'>Age</th>
                            <th class='not-visible'>Location</th>
                            <th class='not-visible'>Size</th>
                            <th class='not-visible'>Sex</th>
                            <th>Adoption Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?= $tbody ?>
                    </tbody>
                </table>
            </div>
       
            <?php include 'components/footer.php'?>
</body>
</html>