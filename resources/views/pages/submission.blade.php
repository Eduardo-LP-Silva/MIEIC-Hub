<?php use App\Utils; ?>

@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/submission.css') }}">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
@endsection

@section('title')
    <title>{{$submission->submission_name}} - MIEIC Hub</title>
@endsection

@section('content')
<div id="content">
    <div id="header">
        <h1>Name: {{{$submission->submission_name}}}</h1>
        <div id="actions">
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
    <img src={{asset(Utils::replaceWhiteSpace($submission->picture))}}>
    <br>
    <div id="author">
        <span>Author: </span>
        <a href="{{url('/users/' . Utils::slug($user->name))}}">{{{$user->name}}}</a>
    </div>
    <div id="category">
        <span>Category: </span>
        <span>{{$category->category}}</span>
    </div>
    <p id="description">
        {{{$submission->submission_description}}}
    </p>
</div>
@endsection
