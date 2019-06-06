@extends('layouts.page')

@section('stylesheets')
    <link rel="stylesheet" href="{{ asset('css/product.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
@endsection

@section('scripts')
    <script src="{{ asset('js/product.js')}}" defer></script>
@endsection

@section('title')
    <title>{{$product->product_name}} - MIEIC Hub</title>
@endsection

@section('content')
<div id="content" class="container" data-id="{{$product->id_product}}" data-token="{{csrf_token()}}">
            <!-- Product -->
            <div id="product" class="row">
                <!-- Product photos-->
                <div id="gallery" class="carousel slide col-md-6" data-ride="carousel">
                    <ol class="carousel-indicators">
                        @foreach ($photos as $photo)
                            @if($loop->first)
                            <li data-target="#gallery" data-slide-to="{{$loop->index}}" class="active"></li>
                            @else
                            <li data-target="#gallery" data-slide-to="{{$loop->index}}"></li>
                            @endif
                        @endforeach
                    </ol>
                    <div class="carousel-inner">
                        @foreach ($photos as $photo)
                            @if ($loop->first)
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="{{asset($photo->image_path)}}" alt="product photo">
                            </div>
                            @else 
                            <div class="carousel-item">
                                <img class="d-block w-100" src="{{asset($photo->image_path)}}" alt="product photo">
                            </div>
                            @endif
                        @endforeach
                    </div>
                    <a class="carousel-control-prev" href="#gallery" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#gallery" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>

                <!-- Informations -->
                <div id="info" class="col-md-6">
                    @can('viewDeleteProduct', App\Product::class)
                        <div>
                        <button id="delete-product" class="btn btn-danger">Delete product</button>
                        </div>
                    @endcan
                
                    <h1>{{ $product->product_name }}</h1>
                    @can('create', App\Wishlist::class)
                        @if($inWishlist)
                        <i class="fa fa-heart heart" ></i>
                        @else
                        <i class="far fa-heart heart"></i>
                        @endif
                    @endcan

                    <div class="to-flex">
                        <h2 id="price">Price: {{ $product->price }}€</h2>
                        <div id="product-rating" class="stars-outer">
                            <div data-rating="{{$product->rating}}" class="stars-inner"></div>
                        </div>
                    </div>

                    <div id="size">
                        <h2>Size:</h2>
                        @if(sizeof($sizes) > 0)
                        <div class="btn-group w-75" role="group" aria-label="Size">
                            @foreach($sizes as $size)
                                <button type="button" name ="{{$size->size}}" class="btn btn-secondary">{{$size->size}}</button>
                            @endforeach
                        </div>
                        @else 
                        <div class="btn-group w-25" role="group" aria-label="Size">
                                <button type="button" name="One-Size" class="btn btn-secondary">One-Size</button>
                        </div>    
                        @endif 
                    </div>

                    @if(sizeof($colors) > 0)
                    <div id="color">
                        <h2>Color:</h2>
                        <select class="custom-select">
                            @foreach($colors as $color)
                                @if($loop->first)
                                <option selected="" value="{{$color->color}}">{{$color->color}}</option>
                                @else
                                <option value="{{$color->color}}">{{$color->color}}</option>
                                @endif
                            @endforeach
                        </select>  
                    </div>
                    @endif

                    <div id="informations" class="accordion">
                        <div class="card">
                            <div class="card-header" id="descriptionheader">
                                <h2 class="mb-0">
                                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#description"
                                        aria-expanded="false" aria-controls="description">
                                        Description and details
                                    </button>
                                </h2>
                            </div>
                            <div id="description" class="collapse" aria-labelledby="descriptionheader" data-parent="#informations">
                                <div class="card-body">
                                    <p> {{ $product->product_description }} </p>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="deliveryheader">
                                <h2 class="mb-0">
                                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#delivery"
                                        aria-expanded="false" aria-controls="delivery">
                                        Delivery info
                                    </button>
                                </h2>
                            </div>
                            <div id="delivery" class="collapse" aria-labelledby="deliveryheader" data-parent="#informations">
                                <div class="card-body">
                                    <p> To Portugal: {{$product->delivery_cost}}€ </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="buy">
                        <button type="button" class="btn btn-success">Buy now</button>
                        <button type="button" class="btn btn-success">Add to cart</button>
                    </div>
                </div>
            </div>

            <!-- Reviews -->
            @if(sizeof($reviews) || $canReview)
            <div id="reviews" class="row">
                <div class="col-12">
                    <h1>Reviews</h1>
                    
                    @if($canReview)
                        <form id="add" class="media container" action={{{"/products/" . $product->id_product . "/reviews/" . Auth::id()}}} method="POST">
                            {{ csrf_field() }}
                            <img class="d-flex mr-3" alt="64x64" style="width: 64px; height: 64px;" src="{{asset(Auth::user()->getPhoto(true))}}" data-holder-rendered="true">
                            <div class="media-body row">
                                <h5 class="mt-0 col-6">You</h5>
                                <div class="rating col-6">
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                </div> 
                                <input id="new-rating" name="rating" type="hidden" value="0">
                                <input type="hidden" name="_method" value="PUT">
                                <textarea class="ml-3" name="review" placeholder="Add your review" maxlength="250">
                                </textarea>
                                <button type="submit" class="btn btn-success">Submit</button>
                            </div>
                        </form>
                    @endif

                    @each('partials.review', $reviews, 'review')
                          
                </div>
            </div>
            @endif
        </div>
@endsection