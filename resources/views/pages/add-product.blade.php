@extends('layouts.page')

@section('stylesheets')
    <link rel="stylesheet" href="{{ asset('css/add-product-admin.css') }}">
    <link rel="stylesheet" href="{{ asset('css/submit.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
@endsection

@section('title')
    <title>Add new product - MIEIC Hub</title>
@endsection

@section('content')
<!--New Product Form-->
<div id="content">
    <h1>Add product</h1>

    <form method="POST" action="{{url('/products/add')}}" enctype="multipart/form-data">
        {{ csrf_field() }}
        <div id="title" class="form-group">
            <label for="name">Name: </label>
            <input id="name" name="name" type="text" required>
        </div>

        <div id="price" class="form-group">
            <label for="price-input">Price: </label>
            <input id="price-input" name="price" type="number" required min="0.01" step="0.01">
        </div>
        
        <div id="types" class="form-group">
            <label for="tshirt">Category: </label>
            <div id="radios" class = "form-check">
                <div class="form-check-inline form-check custom-radio">
                    <input id="tshirt" value="Apparel" type="radio" class="form-check-input custom-control-input" name="type" required> 
                    <label for="tshirt" class="form-check-label custom-control-label" >Apparel</label>
                </div>
                <div class="form-check-inline form-check custom-radio">
                    <input id="hoodie" value="Phone Case" type="radio" class="form-check-input custom-control-input" name="type"> 
                    <label for="hoodie" class="form-check-label custom-control-label">Phone Cases</label>
                </div>
                <div class="form-check-inline form-check custom-radio">
                    <input id="jacket" value="Sticker" type="radio" class="form-check-input custom-control-input" name="type"> 
                    <label for="jacket" class="form-check-label custom-control-label">Stickers</label>
                </div>
                <div class="form-check-inline form-check custom-radio">
                    <input id="pad" value="Poster" type="radio" class="form-check-input custom-control-input" name="type"> 
                    <label for="pad" class="form-check-label custom-control-label">Posters</label> 
                </div>
                <div class="form-check-inline form-check custom-radio">
                    <input id="case" value="Ticket" type="radio" class="form-check-input custom-control-input" name="type"> 
                    <label for="case" class="form-check-label custom-control-label">Tickets</label> 
                </div>
            </div>
        </div>

        <div id="description" class="form-group">
            <label for="desc">Description and details (one bullet per line): </label>
            <textarea id="desc" required name="description" rows="3" cols="35"></textarea>
        </div>

        <div id="files" class="form-group">
            <label for="images" >Upload images to display</label>
            <input id="images" class="form-control-file" name="images" type="file" accept="image/png, image/jpeg" multiple required>
        </div>

        <div id="submission" class="form-group">
            <input type="submit" value="Add!" class="btn btn-success btn-lg">
        </div>
            
    </form>
</div>
@endsection