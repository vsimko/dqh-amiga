#!/usr/bin/php
<?php

//level foundation
//$w = 816;
//$h = 564;
//$color = array(
//	'#000000',
//	'#FFFFFF',
//	'#008000',
//	'#B00000',
//	'#FF8080',
//	'#00FFFF',
//	'#FFB000',
//	'#503000',
//	);

//intro
$w = 320;
$h = 212;
$color = array(
	'#000000',
	'#FFFFFF',
	'#008000',
	'#B00000',
	'#FF8080',
	'#00FFFF',
	'#FFB000',
	'#503000',
	);

$nc = count($color);
$np = ceil(log($nc)/log(2));


$mask = array(1,2,4,8,16,32,64,128);
$invmask = array(128,64,32,16,8,4,2,1);

echo "/* XPM */\n";
echo "static char * XFACE[] = {\n";
echo "\"$w $h $nc 1\",\n";

for($i=0; $i<$nc; ++$i)
	echo '"'.chr(65+$i).' c '.$color[$i]."\",\n";

for($y=0; $y<$h; ++$y)
	$d[$y] = str_repeat("\000", $w);

$fh = fopen('acbm', 'r');
for($i=0; $i<$np; ++$i)
{
	for($y=0; $y<$h; ++$y)
		for($x=0; $x<$w/8; ++$x)
		{
			$c = ord(fread($fh, 1));
			for($b=0; $b<8; ++$b)
				if($c & $invmask[$b])
					$d[$y][$x*8+$b] = chr(ord($d[$y][$x*8+$b]) + $mask[$i]);
		}
}

for($y=0; $y<$h; ++$y)
{
	echo '"';
	for($x=0; $x<$w; ++$x)
		echo chr(65 + ord($d[$y][$x]));
	
	echo "\",\n";
}

echo '};'
?>
