<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <h1>hello world</h1>
    <h1>{{ $title }}</h1>
    @php
        $i = 0;
        for ($i=0; $i < 10; $i++) { 
            echo '<h1>anjay' . $i . '</h1>';
        }    
    @endphp
</body>
</html>