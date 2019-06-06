<?php use Illuminate\Support\Facades\URL; ?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <meta name="csrf-token" content="{{ csrf_token() }}">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="{{ asset('css/error.css') }}">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous" defer></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous" defer></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous" defer></script>
        <title>Whoops - MIEIC Hub</title>
    </head>
    <body>
        <div id="banner">
            <a href="/home">Break</a>
            <a href="/home">Hub</a>
        <div>
        <p>Something went wrong...</p>
        @switch($code)
            @case(301)
                <p>You don't have permission to access this content!</p>
            @case(400)
                <p>That one isn't on us...</p>
                @break
            @case(404)
                <p>Whatever you were looking for, it's not here...</p>
                @break

            
            @default
                
        @endswitch

        <a href="/home">Go Back</a>
    </body>
</html>

