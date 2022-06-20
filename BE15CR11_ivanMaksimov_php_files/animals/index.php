<?php
session_start();
require_once '../components/db_connect.php';

if (isset($_SESSION['user']) != "") {
    header("Location: ../home.php");
    exit;
}

if (!isset($_SESSION['adm']) && !isset($_SESSION['user'])) {
    header("Location: ../index.php");
    exit;
}

$sql = "SELECT * FROM animals";
$result = mysqli_query($connect, $sql);
$tbody = ''; //this variable will hold the body for the table
if (mysqli_num_rows($result)  > 0) {
    while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
        $tbody .= "<tr>
            <td class='not-visible'><img class='img-thumbnail' src='../pictures/" . $row['picture'] . "'</td>
            <td>" . $row['anim_id'] . "</td>
            <td>" . $row['kind'] . "</td>
            <td class='not-visible'>" . $row['breed'] . "</td>
            <td>" . $row['name'] . "</td>
            <td class='not-visible'>" . $row['size'] . "</td>
            <td class='not-visible'>" . $row['age'] . "</td>
            <td class='not-visible'>" . $row['location'] . "</td>
            <td>" . $row['status'] . "</td>
            <td><a href='update.php?id=" . $row['anim_id'] . "'><button class='btn btn-primary btn-sm' type='button'>Edit</button></a>
            <a href='delete.php?id=" . $row['anim_id'] . "'><button class='btn btn-danger btn-sm' type='button'>Delete</button></a></td>
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
    <title>Animals</title>
    <?php require_once '../components/boot.php' ?>
       <link rel="stylesheet" type="text/css" href="../2.css">
    <style type="text/css">
        .manageProduct {
            margin: auto;
        }

        .img-thumbnail {
            width: 70px !important;
            height: 70px !important;
        }

    </style>
</head>

<body  class="text-center">
<?php include '../components/hero.php' ?>
    
    <div class="">
        <div class='mb-3'>
            <a href="create.php"><button class='btn btn-primary' type="button">Add New Animal</button></a>
            <a href="../dashboard.php"><button class='btn btn-success' type="button">Home</button></a>
        </div>
        <p class='h2'>Animals</p>
        <div class="table1 table-responsive-sm">
            <table class='table'>
                <thead class='table-success'>
                    <tr>
                        <th class='not-visible'>Picture</th>
                        <th>ID</th>
                        <th>Kind</th>
                        <th class='not-visible'>Breed</th>
                        <th>Name</th>
                        <th class='not-visible'>Size</th>
                        <th class='not-visible'>Age</th>
                        <th class='not-visible'>Location</th>
                        <th>Status</th>
                        
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?= $tbody; ?>
                </tbody>
            </table>
        </div>
    </div>
    <?php include '../components/footer.php' ?>
    <?php require_once '../components/JS.php' ?>
</body>
</html>