<?php include "partials/db.php"; ?>
<?php include "partials/header.php"; ?>
<?php include "partials/navigation.php"; ?>
<?php include "./dashboard/functions.php"; ?>
<?php ob_start(); ?>

<!--Checking if Logged in User-->
<?php 
if(!isset($_SESSION)){
    session_start();    
}

if(!isset($_SESSION['username'])) {
    header("Location:registration.php");
}
?>
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <h1 class="page-header">
                Open Tasks
                <small>that might interest you <?php echo htmlspecialchars($_SESSION['username'])?></small>
            </h1>
            <!--Getting personalised tasks that might interest users-->
            <?php
            users_personl_stream();
            ?>
        </div>
        <!-- Sidebar Widgets Column -->
        <?php include "partials/sideBar.php"; ?>   
    </div>
</div>
<?php include "partials/footer.php"; ?>

       