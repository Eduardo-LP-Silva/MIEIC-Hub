
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

        <?php $product_photo = Product::find($item->id_product)->getPhotos(true);?>
                <a data-token={{csrf_token()}} data-quantity=<?=$item->quantity?> data-id_user=<?=$user->id?> data-id_product=<?=$item->id_product?> class="list-item" href="{{url('/products/' . $item->id_product)}}">
                    <img src={{asset(Utils::replaceWhiteSpace($product_photo))}} alt="Product Picture">
                    <div class="div"></div>
                    <span><?=$item->product_name?></span>
                    <div class="div"></div>
                    @if($item->quantity > 1)
                    <div>
                        <span id="itemprice"><?=$item->price . "€"?></span>
                        <div class="div"></div>
                        <span id="itemquantity"><?=$item->quantity?></span>
                    </div>
                    @else
                        <span id="itemprice"><?=$item->price . "€"?></span>
                    @endif
                    <i class="fa fa-minus"></i>
                </a>

    @empty

            <div class="div" id="no-items" style="text-align: center;">No items added to cart</div>

    @endforelse
            <div class="div"></div> 
            <div class="text-right"> 
                <span id="totalprice"></span>
                <a id="buy" class="btn btn-success btn-lg" href="{{url('/users/' . Utils::slug(Auth::user()->name) . '/checkout')}}">
                    Checkout
                </a>
            </div>
</div>
@endsection