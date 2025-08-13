{ pkgs, ... }: {
  channel = "stable-24.05";

  packages = [
    pkgs.php83
    pkgs.php83Extensions.curl
    pkgs.php83Extensions.fileinfo
    pkgs.php83Extensions.mbstring
    pkgs.php83Extensions.openssl
    pkgs.php83Extensions.pdo_mysql
    pkgs.php83Extensions.tokenizer
    pkgs.php83Extensions.xml
    pkgs.php83Packages.composer
    pkgs.nodejs_20
    pkgs.python3
    pkgs.tailwindcss
  ];

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  env = {
    PHP_PATH = "${pkgs.php83}/bin/php";
    COMPOSER_ALLOW_SUPERUSER = "1";
  };

  idx = {
    extensions = [
      # Laravel & Blade
      "amirmarmul.laravel-blade-vscode"
      "onecentlin.laravel-blade"
      "shufo.vscode-blade-formatter"
      "codingyu.laravel-goto-view"
      "stef-k.laravel-goto-controller"
      "ahinkle.laravel-model-snippets"

      # Tailwind & Frontend
      "bradlc.vscode-tailwindcss"
      "imgildev.vscode-tailwindcss-snippets"
      "esbenp.prettier-vscode"

      # PHP & Debugging
      "bmewburn.vscode-intelephense-client"
      "xdebug.php-debug"

      # Database
      "cweijan.vscode-database-client2"
      "formulahendry.vscode-mysql"

      # API Testing
      "rangav.vscode-thunder-client"

      # Utils
      "yandeu.five-server"
    ];

    previews = {
      enable = true;
      previews = {
        web = {
          command = ["php" "artisan" "serve" "--host=0.0.0.0" "--port=$PORT"];
          manager = "web";
        };
      };
    };

    workspace = {
      onCreate = {
        default.openFiles = ["routes/web.php"];
        setup-laravel = "composer create-project laravel/laravel .";
      };
      onStart = {
        run-server = "php artisan serve --host=0.0.0.0 --port=8080";
      };
    };
  };
}