<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Wrong Login</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            display: flex;
            height: 100vh;
            align-items: center;
            justify-content: center;
        }
        .container {
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            width: 100%;
            max-width: 400px;
            padding: 30px;
            text-align: center;
        }
        .error-title {
            font-size: 24px;
            color: #d9534f;
            font-weight: bold;
        }
        .error-text {
            font-size: 16px;
            color: #555;
            margin-top: 10px;
        }
        a {
            display: inline-block;
            background-color: #00A8CC;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 20px;
        }
        a:hover {
            background-color: #007B99;
        }
        .logo {
            width: 100px;
            height: auto;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="top-line"></div>
    <div class="container">
        <img src="images/wp.jpg" alt="Logo" class="logo">
        <div class="error-title">Sorry</div>
        <div class="error-text"> Your login failed.</div>
        <div class="error-text">This happens due to - Incorrect Username / Incorrect password.</div>
        <a href="index.html">Click here to go back</a>
    </div>
</body>
</html>
