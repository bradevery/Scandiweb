<?php

namespace App;

use PDO;

class Database
{
    public static function connect(): PDO
    {
        $host = getenv('MYSQLHOST') ?: 'localhost';
        $db   = getenv('MYSQLDATABASE') ?: 'scandiweb_test';
        $user = getenv('MYSQLUSER') ?: 'root';
        $pass = getenv('MYSQLPASSWORD') ?: '';
        $port = (int)(getenv('MYSQLPORT') ?: 3306);
        $charset = 'utf8mb4';

        $dsn = "mysql:host=$host;port=$port;dbname=$db;charset=$charset";
        $options = [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        ];

        return new PDO($dsn, $user, $pass, $options);
    }
}
