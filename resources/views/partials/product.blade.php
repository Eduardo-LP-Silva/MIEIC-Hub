@php 
 use App\Product;
@endphp

<a data-id="{{$product->id_product}}" class="list-item">
    <img src="{{asset($product->getPhotos(true))}}" alt="Product Picture">
    <div class="div"></div>
    <span>{{$product->product_name}}</span>
    <div class="div"></div>
    <div class="to-flex rating">
        <div id="product-rating" class="stars-outer">
            <div data-rating="{{$product->rating}}" class="stars-inner"></div>
        </div>
    </div>
    <div class="div"></div>
    <span>{{$product->price}}€</span>
    <i class="fa fa-times"></i>
</a>