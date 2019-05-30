@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/submission.css') }}">
@endsection

@section('title')
    <title>Submission {{$submission->submission_name}} - MIEIC Hub</title>
@endsection

@section('content')
<div id="content">
    <div id="header">
        <h1>Name: {{$submission->submission_name}}</h1>
        <div id="actions">
            <i class="fas fa-check-circle"></i>
            <i class="fas fa-times-circle"></i>
        </div>
    </div>
    <img src="../resources/images/apparel/hoodie_3.jpg">
    <br>
    <div id="author">
        <span>Author: </span>
        <a href="./profile-orders.html">{{$user->name}}</a>
    </div>
    <div id="category">
        <span>Category: </span>
        <span>{{$category->category}}</span>
    </div>
    <p id="description">
        {{$submission->submission_description}}
    </p>
</div>
@endsection