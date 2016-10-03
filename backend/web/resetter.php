<?php

$page = '';
$fh = fopen('http://192.168.88.88:8989/ubuntu15/reset','r') or die($php_errormsg);
while (! feof($fh)) {
    $page .= fread($fh,1048576);
}
fclose($fh);
?>





