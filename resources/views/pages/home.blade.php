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
    <!--Slideshow-->
    <div id="slideShow" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#slideShow" data-slide-to="0" class="active"></li>
            <li data-target="#slideShow" data-slide-to="1"></li>
            <li data-target="#slideShow" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active img-fluid">
                <a href="./product.html">
                    <img class="d-block w-100" src="../resources/images/apparel/hoodie_2_smiley.jpg" alt="First slide">
                </a>
            </div>
            <div class="carousel-item">
                <a href="./product.html">
                    <img class="d-block w-100 img-fluid" src="../resources/images/posters/poster_code_sleep_repeat.jpg" alt="Second slide">
                </a>
            </div>
            <div class="carousel-item img-fluid">
                <a href="./product.html">
                    <img class="d-block w-100" src="../resources/images/apparel/hoddie_sudo_rm.jpg" alt="Third slide">
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
                            <a href="./search.html">
                                <img src="../resources/images/apparel/hoodie_example.jpg">
                            </a>
                        </div>
                        <h1>Apparel</h1>
                    </div>
                    <div class="col offset-md-1">
                        <div class="grid_container">
                            <a href="./search.html">
                                <img src="../resources/images/stickers/sticker_github.png">
                            </a>
                        </div>
                        <h1>Stickers</h1>
                    </div>
                    <div class="col offset-md-1">
                        <div class="grid_container">
                            <a href="./search.html">
                                <img src="../resources/images/cases/case_example.jpg">
                            </a>
                        </div>
                        <h1>Cases</h1>
                    </div>
                    <div class="col offset-md-1">
                        <div class="grid_container">
                            <a href="./search.html">
                                <img src="../resources/images/posters/poster_gabi.jpg">
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
                        <a href="./polls.html">
                            <div class="grid_container"></div>
                        </a>
                        <h1>Vote on upcoming products!</h1>
                    </div>
                    <div class="col offset-md-1">
                        <a href="./submit.html">
                            <div class="grid_container"></div>
                        </a>
                        <h1>Submit your designs!</h1>
                    </div>
                    <div class="col offset-md-1">
                        <a href="./product.html">
                            <div class="grid_container"></div>
                        </a>
                        <h1>Workshops!</h1>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
