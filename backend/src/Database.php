<?php

namespace App;

use PDO;

class Database
{
    public static function connect(): PDO
    {
        $host = getenv('MYSQLHOST') ?: getenv('MYSQL_HOST') ?: 'mysql.railway.internal';
        $db   = getenv('MYSQLDATABASE') ?: getenv('MYSQL_DATABASE') ?: 'railway';
        $user = getenv('MYSQLUSER') ?: getenv('MYSQL_USER') ?: 'root';
        $pass = getenv('MYSQLPASSWORD') ?: getenv('MYSQL_PASSWORD') ?: 'RUpQrSSTzpIdvdyVhGDbVelfaFTLVsIJ';
        $port = (int)(getenv('MYSQLPORT') ?: getenv('MYSQL_PORT') ?: 3306);
        $charset = 'utf8mb4';

        $dsn = "mysql:host=$host;port=$port;dbname=$db;charset=$charset";
        $options = [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        ];

        return new PDO($dsn, $user, $pass, $options);
    }
}
