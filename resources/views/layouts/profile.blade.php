<?php use App\Utils; ?>

@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="{{ asset('css/profile.css') }}">
        <link rel="stylesheet" href="{{ asset('css/profile-reviews.css') }}">
        <link rel="stylesheet" href="{{ asset('css/profile-orders.css') }}">
@endsection

@section('title')
    <title>{{$user->name}} - MIEICHub</title>
@endsection

@section('content')    
<div id="cont" class="container" style="background: rgb(235,235,235);">
    <div style="margin-top: 3%" class="row">
        <div id="info_left" class="maininfo col-md-4">
            <div class="presentation row">
                <img id="profilepicture" src={{asset(Utils::replaceWhiteSpace($user->getPhotoPath()))}} alt="profile picture">
            <span id="name"> {{$user->name}} </span>
            </div>
            <!-- <span class="separation"></span> -->
            <div class="status row">
                <small style="margin-left: 10%">{{$user->user_description}}</small>
            </div>
            <!-- <span class="separation"></span> -->
            <div class="wishlist row">
                <a href={{url("/users/" . Utils::slug($user->name) . "/wishlist")}}>
                    <button class="btn">Wishlist</button>
                </a>
                @if ($user->isAuthenticatedUser())
                <a href={{url('/users/' . Utils::slug($user->name) . '/settings')}}>
                    <img src={{asset('img/icons/settings.png')}} alt="Settings">
                </a>
                @endif
            </div>
        </div>
        <div id="info_right" class="otherinfo col-md-8">
            <span id="separationver"></span>
            @if($user->isAuthenticatedUser() || $user->isMod())
                <div id="options_buttons">
                    <a href={{url('/users/' . Utils::slug($user->name) . '/orders')}}><button type="button" class="btn btn-danger">Orders</button></a> 
                    <a href={{url('/users/' . Utils::slug($user->name) . '/reviews')}}><button type="button" class="btn btn-danger" autofocus>Reviews</button></a> 
                </div>
            @endif
            @yield('details')
        </div>
    </div>
</div>
@endsection
