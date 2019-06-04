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
    <form action="" method="POST">
        <div id="title" class="form-group">
            <label for="name">Design name: </label>
            <input id="name" name="name" type="text" required="true">
        </div>
        <div id="types" class="form-group">
            <label for="type">Product type: </label>
            <div id="radios" class = "form-check">
                <div class="form-check-inline form-check custom-radio">
                    <input id="tshirt" type="radio" class="form-check-input custom-control-input" name="type" required="true"> 
                    <label for="tshirt" class="form-check-label custom-control-label" >T-Shirt</label>
                </div>
                <div class="form-check-inline form-check custom-radio">
                    <input id="hoodie" type="radio" class="form-check-input custom-control-input" name="type"> 
                    <label for="hoodie" class="form-check-label custom-control-label">Hoodie</label>
                </div>
                <div class="form-check-inline form-check custom-radio">
                    <input id="jacket" type="radio" class="form-check-input custom-control-input" name="type"> 
                    <label for="jacket" class="form-check-label custom-control-label">Jacket</label>
                </div>
                <div class="form-check-inline form-check custom-radio">
                    <input id="pad" type="radio" class="form-check-input custom-control-input" name="type"> 
                    <label for="pad" class="form-check-label custom-control-label">Mouse pad</label> 
                </div>
                <div class="form-check-inline form-check custom-radio">
                    <input id="case" type="radio" class="form-check-input custom-control-input" name="type"> 
                    <label for="case" class="form-check-label custom-control-label">Phone case</label> 
                </div>
            </div>
        </div>
        <div id="description" class="form-group">
            <label for="desc">Tell us your design's story: </label>
            <textarea id="desc" required="true" name="description" rows="3" cols="35"></textarea>
        </div>
        <div id="files" class="form-group">
            <label for="images" >Upload images of your design </label>
            <input id="images" class="form-control-file" name="images" type="file" accept="image/png, image/jpeg" multiple>
        </div>
        <div id="submission" class="form-group">
            <input type="submit" value="Submit!" class="btn btn-success btn-lg">
        </div>  
    </form>
</div>

@endsection