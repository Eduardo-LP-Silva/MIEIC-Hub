@extends('layouts.page')

<?php 
    use App\Product;
    use App\User;
    use App\Utils;
?>

@section('stylesheets')

        <link rel="stylesheet" href="{{ asset('css/checkout.css') }}">
        <link rel="stylesheet" href="{{ asset('css/cart.css') }}">
        <link rel="stylesheet" href="{{ asset('css/submit.css') }}">

@endsection

@section('scripts')
    <script src="{{ asset('js/cart.js')}}" defer></script>
@endsection


@section('title')
    <title>Checkout - MIEIC Hub</title>
@endsection

@section('content')
    <!--Checkout Form-->
    <div id="content">
        <h1 id="checkout">Checkout</h1>
        <div id="list">

    @foreach ( $items as $item )

        <?php $product_photo = Product::find($item->id_product)->getPhotos(true);?>
            <a class="list-item" href="{{url('/products/' . $item->id_product)}}">
                <img src="{{asset(Utils::replaceWhiteSpace($product_photo))}}" alt="Product Picture">
                <div class="div"></div>
                <span><?=$item->product_name?></span>
                <div class="div"></div>
                <span><?=$item->price?></span>
                <i class="fa fa-minus"></i>
            </a>
    @endforeach
            <div class="div"></div>
            <div class="text-right" id="total">
                <span></span>
            </div>
        </div>
        <form action="{{url('users/'.Utils::slug($user->name).'/checkout')}}" method="POST" enctype="multipart/form-data">
        {{ csrf_field() }}

            <div class="form-group">
                <label for="contact">Contact: </label>
                <input id="contact" name="contact" type="text" required="true">
            </div>
            <div id="address" class="form-group">
                <label for="city">City: </label>

                <select id="city" name="city" class="form-control form-control-sm">
                    @foreach( $cities as $city)
                        <option value={{ $city->city }}>{{ $city->city }}</option>
                    @endforeach
                </select>

                <label class="to-block" for="desc">Shipping address: </label>
                <textarea id="address" required="address" name="address" rows="3" cols="35"></textarea>
            </div>
            <div id="payment" class="form-group">
                <label for="method">Payment method: </label>
                <div id="radios" class="form-check">
                    <div class="form-check-inline form-check custom-radio">
                        <input id="paypal" type="radio" class="form-check-input custom-control-input" name="method"
                            required="true">
                        <label for="paypal" class="form-check-label custom-control-label"></label>
                        <img alt="Paypal" src="../resources/icons/paypal.png" class="icon">
                    </div>
                </div>
            </div>
            <div id="submission" class="form-group">
                <input type="submit" value="Checkout" class="btn btn-success btn-lg">
            </div>
        </form>
    </div>


@endsection
