@php 
 use App\Product;
@endphp

<a class="list-item" href="{{url('/products/' . $product->id_product)}}">
    <img src="{{asset($product->getPhotos(true))}}" alt="Product Picture">
    <div class="div"></div>
    <span>{{$product->product_name}}</span>
    <div class="div"></div>
    <div class="rating">
        <span class="fa fa-star checked"></span>
        <span class="fa fa-star checked"></span>
        <span class="fa fa-star checked"></span>
        <span class="fa fa-star checked"></span>
        <span class="fa fa-star checked"></span>
    </div>
    <div class="div"></div>
    <span>{{$product->price}}€</span>
    <i class="fa fa-times"></i>
</a>