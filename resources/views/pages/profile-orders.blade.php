<?php 
    use App\Product;
    use App\Utils;
?>

@extends('layouts.profile')
@section('details')
<div id="list">
    @foreach($orders as $order)
    <?php $product_photo = Product::find($order->id_product)->getPhotos(true);?>
    <a class="list-item" href="{{url('/products/' . $order->id_product)}}">
        <img src={{asset(Utils::replaceWhiteSpace($product_photo))}} alt="Product Picture">
        <div class="div"></div>
        <span><?=$order->product_name?></span>
        <div class="div"></div>
        <div>
            <span><?=$order->price * $order->quantity?></span>
            <div class="div"></div>
            <span><?=$order->quantity?></span>
        </div>
        <div class="div"></div>
        <div>
            <span><?=$order->purchase_date?></span>
            <div class="div"></div>
            <span><?=$order->status?></span>
        </div>
    </a>
    @endforeach
</div>
@endsection

