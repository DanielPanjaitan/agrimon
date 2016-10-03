<?php

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;

/* @var $this \yii\web\View */
/* @var $content string */
?>

<header class="main-header">

<?= Html::a('<span class="logo-mini"></span><span class="logo-lg"> Agrimon</span>', Yii::$app->homeUrl, ['class' => 'logo']) ?>

    <nav class="navbar navbar-static-top" role="navigation">

        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">

            <ul class="nav navbar-nav">

                <li class="dropdown user user-menu">
                    <!--<a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="<?= Yii::$app->homeUrl ?>/img/person.png" class="user-image" alt="User Image"/>
                        <span class="hidden-xs"><?=Yii::$app->user->identity->username?></span>
                    </a>-->
					<?=
                                Html::a(
                                        '<i class="glyphicon glyphicon-log-out"></i><span> Sign Out', ['/site/logout'], ['data-method' => 'post', ]
                                )
                                ?>
					
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="<?= Yii::$app->homeUrl ?>/img/person.png" class="img-circle"
                                 alt="User Image"/>

                            <p>
                                Welcome <?=Yii::$app->user->identity->username?>
                                <small>Sistem Informasi BTA 13 </small>
                            </p>
                        </li>
                        
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                
                            </div>
                            <div class="pull-right">
                                <?=
                                Html::a(
                                        'Sign out', ['/site/logout'], ['data-method' => 'post', 'class' => 'btn btn-default btn-flat']
                                )
                                ?>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
