
<?php 
    use App\Product;
    use App\Utils;
?>

@extends('layouts.page')

@section('stylesheets')
    <link rel="stylesheet" href="{{ asset('css/cart.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
@endsection

@section('scripts')
    <script src="{{ asset('js/cart.js')}}" defer></script>
@endsection

@section('title')
    <title>Cart - MIEIC Hub</title>
@endsection

@section('content')

<div id="list">

    @forelse ( $items as $item )

        @for ( $i = 0 ; $i < $item->quantity ; $i++ )

        <?php $product_photo = Product::find($item->id_product)->getPhotos(true);?>
                <a token={{csrf_token()}} id_user=<?=$user->id?> id_product=<?=$item->id_product?> class="list-item" href="{{url('/products/' . $item->id_product)}}">
                    <img src={{asset(Utils::replaceWhiteSpace($product_photo))}} alt="Product Picture">
                    <div class="div"></div>
                    <span><?=$item->product_name?></span>
                    <div class="div"></div>
                    <span><?=$item->price?>€</span>
                    <i class="fa fa-minus"></i>
                </a>

        @endfor

    @empty

            <div class="div" style="text-align: center;">No items added to cart</div> <!-- Tá um bocado feio -->

    @endforelse
            <div class="div"></div> <!-- Que div é este? -->
            <div class="text-right"> 
                <span></span>
                <button id="buy" type="button" class="btn btn-success btn-lg"><a href="{{url('/users/' . Utils::slug(Auth::user()->name) . '/checkout')}}">Checkout</a></button>
            </div>
</div>
@endsection