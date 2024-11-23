<?PHP

	defined("PATH_ROOT") || define("PATH_ROOT", dirname(__FILE__, 3), true);

	require_once PATH_ROOT . DIRECTORY_SEPARATOR .'core' . DIRECTORY_SEPARATOR . "define.php";

?>
<!doctype html>
<html>
<head>
	<meta name="robots" content="noindex,nofollow">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>404 Page Not Found</title>
	<style>
	body {align-items: center;background-color: #f5f5f5;display: flex;min-height: 100vh;justify-content: center;margin: 0;}
	.container {text-align: center;}
	.container h1 {font-size: 8rem;letter-spacing: 10px;margin: 0;}
	.container h4 {font-size: 1.25rem;font-weight: 300;}
	</style>
</head>
<body>
	<div class="container">
		<h1>404</h1>
		<h2>Мы не можем найти страницу, которую вы ищете.</h2>
		<h4>Страница, которую вы запросили, не найдена.<br />
		Скорее всего вы опечатались при вводе URL</h4>
		<p><a href="/">Перейти на главную страницу</a></p>
		<p>All rights reserved SDBS (Sensor-Dream)<br />
    Best location in the area of RUSSIA<br />
		2009 - <?PHP print(SERVER_DATE); ?></p>
	</div>
</body>
</html>