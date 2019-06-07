<?php 
    use App\Utils; 
    use App\Product;
?>

@extends('layouts.page')

@section('stylesheets')
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="{{ asset('css/search-params.css') }}">

    @if($filter == 'users')
        <link rel="stylesheet" href="{{ asset('css/search-person.css') }}">
    @else
        <link rel="stylesheet" href="{{ asset('css/search.css') }}">
    @endif
@endsection

@section('scripts')
    <script src="{{asset('js/search.js')}}" defer></script>
@endsection

@section('title')
    <title>Search - MIEIC Hub</title>
@endsection

@section('content')
<div id="search" data-token={{csrf_token()}}>
    <div id="search_parameters">
        <div>
            <span>Search results for:</span>
            <span>{{{$query}}}</span>
        </div>
        <div class="dropdown">
            <button class="btn btn-primary dropdown-toggle" type="button" id="searchDropDown" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                Filter by
            </button>
            <span>
                <?=$filter?>
            </span>
            <div class="dropdown-menu" aria-labelledby="searchDropDown">
                <a class="dropdown-item" href=<?="/search/products?query=" . $query?>>Products</a>
                <a class="dropdown-item" href=<?="/search/categories?query=" . $query?>>Categories</a>

                @if(($user = Auth::user()) != null && $user->isMod())
                <a class="dropdown-item" href="<?="/search/users?query=" . $query?>">Users</a>
                @endif
            </div>
        </div>
    </div>
    @if($filter == 'users')
        @foreach($results as $result)
        <a class="list-item" href={{url('users/' . Utils::slug($result->name))}}>
            <img src={{asset(Utils::replaceWhiteSpace($result->image_path))}} alt="User profile photo">
            <div class="div"></div>
            <span class="username">
                <p>Username</p>
                <p>{{{$result->name}}}</p>
            </span>
            <div class="div"></div>
            <span class="email">
                <p>email</p>
                <p>{{{$result->email}}}</p>
            </span>
            <div class="div"></div>
            <button type="submit" name=<?=Utils::slug($result->name)?> class="btn"> <i class="fa fa-ban"></i> </button>
        </a>
        @endforeach
    @else
        @foreach($results as $result)
        <a class="list-item" href=<?="/products/" . $result->id_product?>>
            <img src={{asset(Utils::replaceWhiteSpace(Product::find($result->id_product)->getPhotos(true)))}} alt="Product Picture">
            <div class="div"></div>
            <span>{{{$result->product_name}}}</span>
            <div class="div"></div>
            <div class="to-flex rating">
                <div class="stars-outer">
                    <div data-rating="{{$result->rating}}" class="stars-inner"></div>
                </div>
            </div>
            <div class="div"></div>
            <span>{{{$result->price}}}</span>
        </a>
        @endforeach
    @endif
    
</div>
@endsection
