<?php 
    use App\Product;
    use App\Utils;
?>

@extends('layouts.profile')
@section('details')
    <div id="reviews">
        @foreach($reviews as $review)
        <?php $product_photo = Product::find($review->id_product)->getPhotos(true);?>
        <div class="media container review">
            <img class="d-flex mr-3" data-src="holder.js/64x64?theme=sky" alt="Product picture"
                style="width: 64px; height: 64px;"
                src={{asset(Utils::replaceWhiteSpace($product_photo))}} alt="Product"
                data-holder-rendered="true">
            <a class="media-body row" href={{url('/products/' . $review->id_product)}}>
                <h5 class="mt-0 col-6">{{{$review->product_name}}}</h5>
                <div class="to-flex rating">
                        <div id="product-rating" class="stars-outer">
                            <div data-rating="{{$review->rating}}" class="stars-inner"></div>
                        </div>
                    </div>
                <p class="ml-4">{{{$review->comment}}}</p>
            </a>
        </div>
        @endforeach
    </div>
@endsection

