@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/wishlist.css') }}">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
@endsection

@section('scripts')
    <script src="{{ asset('js/wishlist.js')}}" defer></script>
@endsection

@section('title')
    <title>Wishlist - MIEIC Hub</title>
@endsection

@section('content')
    @if(isset($products))
    <div id="list">
        @each('partials.product', $products, 'product')
    </div>
    @else 
        <div class="jumbotron">
            <h1 class="display-3">There's nothing here!</h1>
            <p class="lead">Browse our website and click the heart button next to products to add them to your wishlist!</p>
            <hr class="my-2">
            <p class="lead">
            <a class="btn btn-primary btn-lg" href="{{url('/home')}}" role="button">Home</a>
            </p>
        </div>
    @endif
@endsection