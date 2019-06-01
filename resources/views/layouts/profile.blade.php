@extends('layouts.page')

@section('stylesheets')
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
                <img id="profilepicture" src={{asset('img/users/default.png')}} alt="profile picture">
            <span id="name"> {{$user->name}} </span>
            </div>
            <!-- <span class="separation"></span> -->
            <div class="status row">
                <small style="margin-left: 10%">{{$user->user_description}}</small>
            </div>
            <!-- <span class="separation"></span> -->
            <div class="wishlist row">
                <a href={{'/users/' . $user->name . '/wishlist'}}>
                    <button class="btn">Wishlist</button>
                </a>
                @if ($user->isAuthenticatedUser())
                <a href={{'/users/' . $user->name . '/settings'}}>
                    <img src={{asset('img/icons/settings.png')}} alt="Settings">
                </a>
                @endif
            </div>
        </div>
        <div id="info_right" class="otherinfo col-md-8">
            <span id="separationver"></span>
            <div id="options_buttons">
                <a href={{url('/users/' . $user->name . '/orders')}}><button type="button" class="btn btn-danger">Orders</button></a> 
                <a href={{url('/users/' . $user->name . '/reviews')}}><button type="button" class="btn btn-danger" autofocus>Reviews</button></a> 
            </div>
            @yield('details')
        </div>
    </div>
</div>
@endsection
