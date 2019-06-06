@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/submit.css') }}">
@endsection

@section('title')
    <title>Submit - MIEIC Hub</title>
@endsection

@section('content')

<div id="content">
    <h1>Submit your design</h1>
    <form id="f" action="{{url('/submit')}}" method="POST" enctype="multipart/form-data">
        {{ csrf_field() }}
        <div id="title" class="form-group">
            <label for="name">Design name: </label>
            <input id="name" name="name" type="text" required>
        </div>
        <div id="types" class="form-group">
            <span>Product type: </span>
            <div id="radios" class = "form-check">
                <div class="form-check-inline form-check custom-radio">
                    <input id="apparel" value="Apparel" type="radio" class="form-check-input custom-control-input" name="type" required>
                    <label for="apparel" class="form-check-label custom-control-label" >Apparel</label>
                </div>
                <div class="form-check-inline form-check custom-radio">
                    <input id="sticker" value="Sticker" type="radio" class="form-check-input custom-control-input" name="type" required>
                    <label for="sticker" class="form-check-label custom-control-label" >Sticker</label>
                </div>
                <div class="form-check-inline form-check custom-radio">
                    <input id="poster" value="Poster" type="radio" class="form-check-input custom-control-input" name="type" required>
                    <label for="poster" class="form-check-label custom-control-label" >Poster</label>
                </div>
                <div class="form-check-inline form-check custom-radio">
                    <input id="mug" value="Mug" type="radio" class="form-check-input custom-control-input" name="type" required>
                    <label for="mug" class="form-check-label custom-control-label" >Mug</label>
                </div>
                <div class="form-check-inline form-check custom-radio">
                    <input id="m_pad" value="Mouse Pad" type="radio" class="form-check-input custom-control-input" name="type">
                    <label for="m_pad" class="form-check-label custom-control-label">Mouse pad</label>
                </div>
                <div class="form-check-inline form-check custom-radio">
                    <input id="case" value="Phone Case" type="radio" class="form-check-input custom-control-input" name="type">
                    <label for="case" class="form-check-label custom-control-label">Phone case</label>
                </div>
            </div>
        </div>
        <div id="description" class="form-group">
            <span>Tell us your design's story: </span>
            <textarea required name="description" rows="3" cols="35"></textarea>
        </div>
        <div id="files" class="form-group">
            <label for="images">Upload Image </label>
            <input id="images" class="form-control-file" name="photo" type="file" accept="image/png, image/jpeg" multiple>
        </div>
        <input type="submit" value="Submit!" class="btn btn-success btn-lg">
    </form>
</div>
@endsection
