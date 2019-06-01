<?php use App\Product; ?>
@extends('layouts.profile')
@section('details')
    <div id="reviews">
        @foreach($reviews as $review)
        <?php $product_photo = Product::find($review->id_product)->getPhotos(true);?>
        <div class="media container review">
            <img class="d-flex mr-3" data-src="holder.js/64x64?theme=sky" alt="Product picture"
                style="width: 64px; height: 64px;"
                src={{asset($product_photo)}} alt="Product"
                data-holder-rendered="true">
            <a class="media-body row" href={{url('/product/' . $review->id_product)}}>
                <h5 class="mt-0 col-6"><?=$review->product_name?></h5>
                <div class="rating col-6">
                    @for($i = 0; $i < $review->rating; $i++)
                        <span class="fa fa-star checked"></span>
                    @endfor

                    @for($i = 0; $i < 5 - $review->rating; $i++)
                        <span class="fa fa-star"></span>
                    @endfor
                </div>
                <p class="ml-4"><?=$review->comment?></p>
            </a>
        </div>
        @endforeach
    </div>
@endsection

