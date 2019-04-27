@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/polls.css') }}">
@endsection

@section('title')
    <title>Upcoming - MIEIC Hub</title>
@endsection

@section('content')
<section class="poll">
    <h1>Hoodies 2019</h1>
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="design_container">
                    <i class="far fa-heart heart"></i>
                    <span>17</span>
                    <img src="../resources/images/apparel/hoodie_1_red.jpg">
                    </div>
                    <h1>Design #1</h1>
                </div>
                <div class="col offset-md-1">
                    <div class="design_container">
                        <i class="far fa-heart heart"></i>
                        <span>5</span>
                        <img src="../resources/images/apparel/hoodie_2.jpg">
                    </div>
                    <h1>Design #2</h1>
                </div>
                <div class="col offset-md-1">
                    <div class="design_container">
                        <i class="far fa-heart heart"></i>
                        <span>35</span>
                        <img src="../resources/images/apparel/hoodie_3.jpg">
                    </div>
                    <h1>Design #3</h1>
                </div>
                <div class="col offset-md-1">
                    <div class="design_container">
                        <i class="far fa-heart heart"></i>
                        <span>10</span>
                        <img src="../resources/images/apparel/hoodie_5.jpg">
                    </div>
                    <h1>Design #4</h1>
                </div>
            </div>
        </div>
    <span>Poll expires on: </span>
    <span>25-04-2019</span>
</section>
<section class="poll">
    <h1>Misc January 19</h1>
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="design_container">
                    <i class="far fa-heart heart"></i>
                    <span>17</span>
                    <img src="../resources/images/posters/poster_1.jpg">
                </div>
                <h1>Item #1</h1>
            </div>
            <div class="col offset-md-1">
                <div class="design_container">
                    <i class="far fa-heart heart"></i>
                    <span>5</span>
                    <img src="../resources/images/posters/poster_new_year.jpg">
                </div>
                <h1>Item #2</h1>
            </div>
        </div>
    </div>
    <span>Poll expires on: </span>
    <span>20-03-2019</span>
</section>
@endsection