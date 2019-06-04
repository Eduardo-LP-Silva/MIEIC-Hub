<?php use App\Utils; ?>

@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/submission.css') }}">
        <link rel="stylesheet" href="{{ asset('css/footer.css') }}">
        <link rel="stylesheet" href="{{ asset('css/navbar.css') }}">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

@endsection

@section('title')
    <title>Submission {{$submission->submission_name}} - MIEIC Hub</title>
@endsection

@section('content')
<div id="content">
    <div id="header">
        <h1>Name: {{$submission->submission_name}}</h1>
        <div id="actions">
            <!--<form id="accept" action="{{url('/submission/' . $submission->id_submission)}}" method="POST">
                {{ csrf_field() }}-->
              <button id="but1" form="accept" type="submit"><i class="fas fa-check-circle"></i></button>
              <button id="but2" form="delete" type="submit"><i class="fas fa-times-circle"></i></button>
              <form id="accept" action="{{url('/submission/' . $submission->id_submission . '/accept') }}" method="POST">
                  {{ csrf_field() }}
              </form>
              <form id="delete" action="{{url('/submission/' . $submission->id_submission . '/remove') }}" method="POST">
                  {{ csrf_field() }}
              </form>
        </div>
    </div>
    <img src="../resources/images/apparel/hoodie_3.jpg">
    <br>
    <div id="author">
        <span>Author: </span>
        <a href="{{url('/users/' . Utils::slug($user->name))}}">{{$user->name}}</a>
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
