<?php

require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'src' . DIRECTORY_SEPARATOR . 'Transformer.php';

$t = new Transformer(dirname(__DIR__) . DIRECTORY_SEPARATOR . 'samples');
$t->run();
