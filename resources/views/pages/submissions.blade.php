<?php
    use App\Submission;
    use App\User;
?>

@extends('layouts.page')

@section('stylesheets')
    <link rel="stylesheet" href="{{ asset('css/submissions.css') }}">
    <link rel="stylesheet" href="../css/search-params.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
@endsection

@section('title')
    <title>Submissions - MIEIC Hub</title>
@endsection

@section('content')
<div id="list">
    <div id="search_parameters">
        <div class="dropdown">
            <button class="btn btn-primary dropdown-toggle" type="button" id="searchDropDown" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                From:
            </button>
            <span>
                Last Week
            </span>
            <div class="dropdown-menu" aria-labelledby="searchDropDown">
                <a class="dropdown-item" href="./submissions.html">Last Week</a>
                <a class="dropdown-item" href="./submissions.html">Last Month</a>
                <a class="dropdown-item" href="./submissions.html">Ever</a>
            </div>
        </div>
    </div>
    @for($i = 0; $i < count($submissions); $i++)
    <div class="list-item" href="./product.html">

         <a href="./submission.html">
            <img src="../resources/images/apparel/hoodie_3_single.jpg" alt="Submission Picture">
        </a>
        <div class="div"></div>
        <a href="./submission.html"><?= $submissions[$i]->submission_name ?></a>
        <div class="div"></div>
        <a href="./profile-orders.html"><?= $names[$i]->name?></a>
        <div class="div"></div>
        <span><?=$submissions[$i]->submission_date?></span>
        <div>
            <i class="fas fa-check-circle"></i>
            <i class="fas fa-times-circle"></i>
        </div>
    </div>
    @endfor
</div>
@endsection
