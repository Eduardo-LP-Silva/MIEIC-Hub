<?php 
    use App\Utils; 
    use App\User;
?>

@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="{{ asset('css/profile.css') }}">
        <link rel="stylesheet" href="{{ asset('css/profile-reviews.css') }}">
        <link rel="stylesheet" href="{{ asset('css/profile-orders.css') }}">
@endsection

@section('scripts')
    <script src="{{asset('js/profile.js')}}" defer></script>
@endsection

@section('title')
    <title>{{{$user->name}}} - MIEICHub</title>
@endsection

@section('content')    
<div id="cont" class="container" style="background: rgb(235,235,235);">
    <div style="margin-top: 3%" class="row">
        <div id="info_left" class="maininfo col-md-4">
            <div class="presentation row">
                <img id="profilepicture" src={{asset(Utils::replaceWhiteSpace($user->getPhoto(true)))}} alt="profile picture">
            <span id="name"> {{$user->name}} </span>
            </div>
            <div class="status row">
                <small style="margin-left: 10%">{{$user->user_description}}</small>
            </div>
            <div class="wishlist row">
                <a class="btn" href={{url("/users/" . Utils::slug($user->name) . "/wishlist")}}>
                    Wishlist
                </a>
                @if ($user->isAuthenticatedUser() || User::isAuthMod())
                <a href={{url('/users/' . Utils::slug($user->name) . '/settings')}}>
                    <img src={{asset('img/icons/settings.png')}} alt="Settings">
                </a>
                @endif
            </div>
        </div>
        <div id="info_right" class="otherinfo col-md-8">
            <span id="separationver"></span>
            @if(User::isAuthMod())
            <form id="privileges" action=<?="/users/" . Utils::slug($user->name) . "/privilege"?> method="GET">
                <p> Manage privileges</p>
                @if($user->isStockManager())
                    <button id="stock" data-super="1" class="btn" type="submit" name="role" 
                    value="rm_stock_manager">Stock Manager</button>
                @else
                    <button id="stock" data-super="0" class="btn" type="submit" name="role" 
                    value="stock_manager">Stock Manager</button>
                @endif

                @if($user->isMod())
                    <button id="mod" data-super="1" class="btn" type="submit" name="role" 
                    value="rm_moderator">Moderator</button>
                @else
                    <button id="mod" data-super="0" class="btn" type="submit" name="role" 
                    value="moderator">Moderator</button>
                @endif

                @if($user->isSubManager())
                    <button id="sub" data-super="1" class="btn" name="role" type="submit" 
                    value="rm_submission_manager">Submission Manager</button>
                @else
                    <button id="sub" data-super="0" class="btn" name="role" type="submit" 
                    value="submission_manager">Submission Manager</button>
                @endif
            </form>
            @endif
            @if($user->isAuthenticatedUser() || User::isAuthMod())
                <div id="options_buttons">
                    <a class="btn btn-danger" href={{url('/users/' . Utils::slug($user->name) . '/orders')}}>
                        Orders
                    </a> 
                    <a class="btn btn-danger" href={{url('/users/' . Utils::slug($user->name) . '/reviews')}}>
                        Reviews
                    </a> 
                </div>
            @endif
            @yield('details')
        </div>
    </div>
</div>
@endsection
