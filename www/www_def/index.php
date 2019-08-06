<?PHP

  namespace main;

    defined("PATH_ROOT") || define("PATH_ROOT", __DIR__, true);

    print file_get_contents(PATH_ROOT . DIRECTORY_SEPARATOR . "index.html");
