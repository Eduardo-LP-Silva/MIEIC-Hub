@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/cart.css') }}">
@endsection

@section('scripts')
        <script src="{{ asset('js/cart.js') }}" defer></script>
        <script src="{{ asset('js/home.js') }}" defer></script>
@endsection

@section('title')
    <title>Cart - MIEIC Hub</title>
@endsection

@section('content')

        <div id="list">
            <a class="list-item" href="./product.html">
                <img src="../resources/images/apparel/hoodie_3_single.jpg" alt="Product Picture">
                <div class="div"></div>
                <span>Mouse Hoodie</span>
                <div class="div"></div>
                <span>24.99€</span>
                <i class="fa fa-minus"></i>
            </a>
            <a class="list-item" href="./product.html">
                <img src="../resources/images/apparel/hoodie_2_smiley_single.jpg" alt="Product Picture">
                <div class="div"></div>
                <span>Smiley Hoodie</span>
                <div class="div"></div>
                <span>19.99€</span>
                <i class="fa fa-minus"></i>
            </a>
            <div class="div"></div>
            <div class="text-right"> 
                <span></span>
                <button id="buy" type="button" class="btn btn-success btn-lg"><a href="./checkout.html">Checkout</a></button>
            </div>
        </div>

@endsection
