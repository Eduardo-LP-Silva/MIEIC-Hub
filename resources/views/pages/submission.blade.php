<?php use App\Utils; ?>

@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/submission.css') }}">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                <i class="fas fa-check-circle"></i>
            <!--</form>-->
            <form id="delete" action="{{url('/submission/' . $submission->id_submission . '/remove') }}" method="POST">
                {{ csrf_field() }}
                <button type="submit"><i class="fas fa-times-circle"></i></button> 
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
