@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/submission.css') }}">
@endsection

@section('title')
    <title>Submission {ID} - MIEIC Hub</title>
@endsection

@section('content')
<div id="content">
    <div id="header">
        <h1>Mouse Hoodie V2</h1>
        <div id="actions">
            <i class="fas fa-check-circle"></i>
            <i class="fas fa-times-circle"></i>
        </div>
    </div>
    <img src="../resources/images/apparel/hoodie_3.jpg">
    <br>
    <div id="author">
        <span>Author: </span>
        <a href="./profile-orders.html">edwardS</a>
    </div>
    <div id="category">
        <span>Category: </span>
        <span>Hoodie</span>
    </div>
    <p id="description">
        This design is an improvement to the original Mouse Hoodie. It features new drawings as well as new materials.
    </p>
</div>
@endsection