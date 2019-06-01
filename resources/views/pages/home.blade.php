@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/home.css') }}">
@endsection

@section('scripts')
        <script src="{{asset('js/home.js')}}" defer></script>
@endsection

@section('title')
    <title>Home - MIEIC Hub</title>
@endsection

@section('content')
    <!--Slideshow (Mudar links dos produtos e categorias) -->
    <div id="slideShow" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#slideShow" data-slide-to="0" class="active"></li>
            <li data-target="#slideShow" data-slide-to="1"></li>
            <li data-target="#slideShow" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active img-fluid">
                <a href="{{ url('/products/5') }}">
                    <img class="d-block w-100" src="{{asset('img/apparel/hoodie_2_smiley.jpg')}}" alt="First slide">
                </a>
            </div>
            <div class="carousel-item">
                <a href="{{ url('/products/35') }}">
                    <img class="d-block w-100 img-fluid" src="{{asset('img/posters/semi.jpg')}}" alt="Second slide">
                </a>
            </div>
            <div class="carousel-item img-fluid">
                <a href="{{ url('/products/2') }}">
                    <img class="d-block w-100" src="{{asset('img/apparel/hoddie_sudo_rm.jpg')}}" alt="Third slide">
                </a>
            </div>
        </div>
        <a class="carousel-control-prev left" href="#slideShow" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#slideShow" role="button" data-slide="next">
            <span class="carousel-control-next-icon"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div id="panels">
        <section>
            <h1>Products</h1>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="grid_container">
                            <a href="{{ url('/search/category') }}">
                                <img src="{{asset('img/apparel/hoodie_example.jpg')}}">
                            </a>
                        </div>
                        <h1>Apparel</h1>
                    </div>
                    <div class="col offset-md-1">
                        <div class="grid_container">
                            <a href="{{ url('/search/category') }}">
                                <img src="{{asset('img/stickers/stickers.jpg')}}">
                            </a>
                        </div>
                        <h1>Stickers</h1>
                    </div>
                    <div class="col offset-md-1">
                        <div class="grid_container">
                            <a href="{{ url('/search/category') }}">
                                <img src="{{asset('img/cases/case_example.jpg')}}">
                            </a>
                        </div>
                        <h1>Cases</h1>
                    </div>
                    <div class="col offset-md-1">
                        <div class="grid_container">
                            <a href="{{ url('/search/category') }}">
                                <img src="{{asset('img/posters/super.jpg')}}">
                            </a>
                        </div>
                        <h1>Posters</h1>
                    </div>
                </div>
            </div>
        </section>
        <section id="other">
            <h1>Other</h1>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <a href="{{ url('/upcoming') }}">
                            <div class="grid_container" 
                            style="background-image: url('{{asset('img/website/calendar.jpg')}}');">
                            </div>
                        </a>
                        <h1>Vote on upcoming products!</h1>
                    </div>
                    <div class="col offset-md-1">
                        <a href="{{ url('/submit') }}">
                            <div class="grid_container"
                            style="background-image: url('{{asset('img/apparel/hoodie_drawing.jpg')}}');">
                            </div>
                        </a>
                        <h1>Submit your designs!</h1>
                    </div>
                    <div class="col offset-md-1">
                        <a href="{{ url('/search/category') }}">
                            <div class="grid_container" 
                            style="background-image: url('{{asset('img/website/workshop.jpg')}}');">
                            </div>
                        </a>
                        <h1>Workshops!</h1>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
