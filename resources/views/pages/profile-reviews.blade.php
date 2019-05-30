@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/profile.css') }}">
        <link rel="stylesheet" href="{{ asset('css/profile-reviews.css') }}">
@endsection

@section('title')
    <title>{{$user->name}} - MIEICHub</title>
@endsection

@section('content')
@include('partials.profile')
<section class="profile">
<div id="reviews">
    <div class="media container review">
        <img class="d-flex mr-3" data-src="holder.js/64x64?theme=sky" alt="Profile picture"
            style="width: 64px; height: 64px;"
            src="../resources/images/apparel/hoodie_2_single.jpg" alt="Product"
            data-holder-rendered="true">
        <a class="media-body row" href="./product.html">
            <h5 class="mt-0 col-6">Starbucks Hoodie</h5>
            <div class="rating col-6">
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star"></span>
                <span class="fa fa-star"></span>
            </div>
            <p class="ml-4">Very nice design</p>
        </a>
    </div>
    <div class="media container review">
        <img class="d-flex mr-3" data-src="holder.js/64x64?theme=sky" alt="Profile picture"
            style="width: 64px; height: 64px;" src="../resources/images/apparel/hoodie_2_smiley_single.jpg" alt="Product"
            data-holder-rendered="true">
        <a class="media-body row" href="./product.html">
            <h5 class="mt-0 col-6">Smiley Hoodie</h5>
            <div class="rating col-6">
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star"></span>
            </div>
            <p class="ml-4">Cool stuff</p>
        </a>
    </div>
    <div class="media container review">
            <img class="d-flex mr-3" data-src="holder.js/64x64?theme=sky" alt="Profile picture"
                style="width: 64px; height: 64px;" src="../resources/images/apparel/hoodie_2_smiley_single.jpg" alt="Product"
                data-holder-rendered="true">
            <a class="media-body row" href="./product.html">
                <h5 class="mt-0 col-6">Smiley Hoodie</h5>
                <div class="rating col-6">
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span>
                </div>
                <p class="ml-4">Cool stuff</p>
            </a>
        </div>
        <div class="media container review">
            <img class="d-flex mr-3" data-src="holder.js/64x64?theme=sky" alt="Profile picture"
                style="width: 64px; height: 64px;" src="../resources/images/apparel/hoodie_2_smiley_single.jpg" alt="Product"
                data-holder-rendered="true">
            <a class="media-body row" href="./product.html">
                <h5 class="mt-0 col-6">Smiley Hoodie</h5>
                <div class="rating col-6">
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span>
                </div>
                <p class="ml-4">Cool stuff</p>
            </a>
        </div>
        <div class="media container review">
            <img class="d-flex mr-3" data-src="holder.js/64x64?theme=sky" alt="Profile picture"
                style="width: 64px; height: 64px;" src="../resources/images/apparel/hoodie_2_smiley_single.jpg" alt="Product"
                data-holder-rendered="true">
            <a class="media-body row" href="./product.html">
                <h5 class="mt-0 col-6">Smiley Hoodie</h5>
                <div class="rating col-6">
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span>
                </div>
                <p class="ml-4">Cool stuff</p>
            </a>
        </div>
    </div>
</section>
@endsection

