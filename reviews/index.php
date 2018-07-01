<?php 
require 'KlasifikasiNB.php'; 
$op = new KlasifikasiNB('opinion/rt-polarity.pos', 'pos','opinion/rt-polarity.neg', 'neg');
$result = $op->dataTesting;

?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="sentiment analysis for movies review with naive bayes">
    <meta name="author" content="munir, nadzir, kevin, yulfa, faris">

    <title>Movie Reviews Analysis</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/landing-page.css" rel="stylesheet">

    <!-- Plugin CSS -->
    <link href="css/magnific-popup.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="css/creative.min.css" rel="stylesheet">
    <link href="css/input.css" rel="stylesheet">

    <!-- Custom Fonts 
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
        <div class="container topnav">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand topnav" href="#">Movie Reviews Analysis</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#about">About</a>
                    </li>
                    <li>
                        <a href="#analysis">Analysis</a>
                    </li>
                    <li>
                        <a href="#team">Our Team</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>


    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>Movie Reviews</h1>
                        <h3>Sentiment Analysis using Naive Bayes</h3>
                        <hr class="intro-divider">
                        <ul class="list-inline intro-social-buttons">
                            <li>
                                <a href="#analysis" class="btn btn-default btn-lg"><i class="glyphicon glyphicon-hand-down"></i> <span class="network-name">START</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.intro-header -->

    <!-- Page Content -->

	<a  name="analysis" id="analysis"></a>
    <div class="content-section-a">

        <div class="container">
            <div class="row">
            <h2 class="section-heading text-center" style="padding-bottom: 0px">Start Analysis!</h2>    
            <hr>
                <div class="col-lg-5 col-sm-6">
                    <div class="clearfix"></div>
                    <h3 class="section-heading">Type a review here</h3>
                    <form method="post" action="#analysis">
                        <input required class="form-control" type="text" name="movie" id="movie" placeholder="Movie Title"><br>
                        <textarea required class="form-control" rows="5" id="review" name="review" placeholder="Review"></textarea><br>

                        <button id="analysis" type="submit" class="btn btn-primary btn-block">Analysis</button><br>    
                    </form>
                    <div id="result-analysis" class="section-heading">
                        <?php
                            $string = '';
                            if(isset($_POST['review'])){
                                $string = $_POST['review'];    
                            }
                            $result_classify = $op->klasifikasi($string);
                            if($result_classify == 'pos'){
                                $result_classify = 'positive';
                            }elseif($result_classify == 'neg'){
                                $result_classify = 'negative';
                            }
                        ?>
                    </div>
                </div>
                <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                    <h3 class="section-heading">Result analysis</h3>
                    <input readonly="true" class="form-control" type="text" value="Movie Title : <?php if(isset($_POST['movie'])) echo $_POST['movie']; ?>"><br>
                    <textarea readonly="true" class="form-control" rows="5">Review : <?php if(isset($_POST['review'])) echo $_POST['review']; ?></textarea><br>
                    <input readonly="true" class="form-control" type="text" value="Category : <?php echo $result_classify; ?>"><br>
                </div>
                <div>
                <table class="table table-bordered">
                    <thead>
                        <tr class="success"><td align="center">Detail Perhitungan</td></tr>
                    </thead>
                    <tbody>
                        <tr><td><?php echo 'Prior positive : '.$op->prior['pos']; ?></td></tr>    
                        <tr><td><?php echo 'Prior negative : '.$op->prior['neg']; ?></td></tr>    
                    </tbody>
                </table>
                    
                <table class="table table-bordered">         
                    <thead>
                        <tr class="success"><td align="center" colspan="3">Count(w,c)</td></tr>
                        <tr class="info"><td>Term</td><td>Positive</td><td>Negative</td></tr>
                    </thead>
                    <tbody>
                    <?php
                        foreach($op->term as $key => $value){
                            echo '<tr>';
                            echo '<td>'.$value.'</td><td>'.$op->countwc[$value]['pos'].'</td><td>'.$op->countwc[$value]['neg'].'</td>';
                            echo '</tr>';
                        }
                    ?>
                    </tbody>                
                </table>
                    
                <table class="table table-bordered">         
                    <thead>
                        <tr class="success"><td align="center" colspan="3">P(w|c)</td></tr>
                        <tr class="info"><td>Term</td><td>Positive</td><td>Negative</td></tr>
                    </thead>
                    <tbody>
                    <?php
                        foreach ($op->term as $key => $value) {
                            echo '<tr>';
                            echo '<td>'.$value.'</td><td>'.number_format($op->pwc[$value]['pos'], 10).'</td><td>'.number_format($op->pwc[$value]['neg'], 10).'</td>';
                            echo '</tr>';
                        }
                    ?>
                    </tbody>                
                </table>
                    
                <table class="table table-bordered">
                    <thead>
                        <tr class="success"><td align="center">Hasil Posterior</td></tr>
                    </thead>
                    <tbody>
                        <tr><td>Positive : <?php echo $op->pcw['pos']; ?></td></tr> 
                        <tr><td>Negative : <?php echo $op->pcw['neg']; ?></td></tr> 
                    </tbody>
                </table>                    
                </div>

                <!--
                <h2 class="section-heading text-left">System Testing</h2>    
                <div>
                    <table class="table table-bordered">
                        <thead>
                        <tr class="success">
                            <td>No</td>
                            <td>Movie Title</td>
                            <td>Movie Review</td>
                            <td>Category</td>
                            <td>Classify</td>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                            $counter = 1;
                            $posTotal = 0;
                            $negTotal = 0;
                            if ($result->num_rows > 0) {
                                while($row = $result->fetch_assoc()) {
                                    $real = ($row['category']==1?'positive':'negative');
                                    $classify = ($op->klasifikasi($row['movie_review'])=='pos'?'positive':'negative');
                                    if($real===$classify && $row['category']==1){
                                        ++$posTotal;
                                    }
                                    if($real===$classify && $row['category']==2){
                                        ++$negTotal;
                                    }
                                    echo '<tr>';
                                    echo '<td>'.($counter++).'</td>';
                                    echo '<td>'.$row['movie_title'].'</td>';
                                    echo '<td>'.$row['movie_review'].'</td>';
                                    echo '<td>'.$real.'</td>';
                                    echo '<td>'.$classify.'</td>';
                                    echo '</tr>';
                                }
                            }
                            echo '</tbody>';
                            echo '<tfoot>';
                            echo '<tr><td colspan="5">Positive Accuracy Success : '.(($posTotal/50)*100).'% </td></tr>';        
                            echo '<tr><td colspan="5">Positive Accuracy Failure : '.(100-(($posTotal/50)*100)).'% </td></tr>';        
                            echo '<tr><td colspan="5">Negative Accuracy Success : '.(($negTotal/50)*100).'% </td></tr>';        
                            echo '<tr><td colspan="5">Negative Accuracy Failure : '.(100-(($negTotal/50)*100)).'% </td></tr>';        
                            echo '</tfoot>';
                        ?>
                    </table>

                </div>
                -->
            </div>


        </div>
        <!-- /.container -->

    </div>
    

	<a  name="team" id="team"></a>
    <div class="banner">
        <h2 class="section-heading text-center" style="padding-bottom: 40px">Our Team</h2>    
        <div class="container" >
            <div class="row no-gutter popup-gallery">
                <div class="col-sm-2" >
                    <a class="portfolio-box">
                        <img src="img/portfolio/thumbnails/1.png" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Anggota 1
                                </div>
                                <div class="project-name">
                                    Muhammad Mishbahul Munir
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-2">
                    <a class="portfolio-box">
                        <img src="img/portfolio/thumbnails/1.png" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Anggota 2
                                </div>
                                <div class="project-name">
                                    Muhammad Nadzir
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-2">
                    <a class="portfolio-box">
                        <img src="img/portfolio/thumbnails/1.png" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Anggota 3
                                </div>
                                <div class="project-name">
                                    M. Kevin Pahlevi
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-2">
                    <a class="portfolio-box">
                        <img src="img/portfolio/thumbnails/1.png" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Anggota 4
                                </div>
                                <div class="project-name">
                                    Yulfa Hadi Wicaksono
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-sm-2">
                    <a class="portfolio-box">
                        <img src="img/portfolio/thumbnails/1.png" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Anggota 5
                                </div>
                                <div class="project-name">
                                    Muhammad Faris Masud
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
              </div>
            
        </div>
        <!-- /.container -->

    </div>
    <!-- /.banner -->

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h4 class="copyright text-muted medium">Copyright &copy; Text Mining Unknown Group</h4>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Calculate -->
    <script src="js/analysis.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>