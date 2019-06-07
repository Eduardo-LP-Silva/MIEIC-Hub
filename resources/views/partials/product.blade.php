@php 
 use App\Product;
@endphp

<div data-id="{{$product->id_product}}" class="list-item">
    <a href={{{"/products/" . $product->id_product}}}>
        <img src="{{asset($product->getPhotos(true))}}" alt="Product Picture">
    </a>
    <div class="div"></div>
    <a href={{{"/products/" . $product->id_product}}}>
     <span>{{$product->product_name}}</span>
    </a>
    <div class="div"></div>
    <div class="to-flex rating">
        <div id="product-rating" class="stars-outer">
            <div data-rating="{{$product->rating}}" class="stars-inner"></div>
        </div>
    </div>
    <div class="div"></div>
    <span>{{$product->price}}€</span>
    <i class="fa fa-times"></i>
</div>