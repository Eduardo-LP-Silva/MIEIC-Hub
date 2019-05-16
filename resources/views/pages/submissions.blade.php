@extends('layouts.page')

@section('stylesheets')
    <link rel="stylesheet" href="{{ asset('css/submissions.css') }}">
    <link rel="stylesheet" href="../css/search-params.css">
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
    <div class="list-item" href="./product.html">
        <a href="./submission.html">
            <img src="../resources/images/apparel/hoodie_3_single.jpg" alt="Submission Picture">
        </a> 
        <div class="div"></div>
        <a href="./submission.html">Mouse Hoodie V2</a>
        <div class="div"></div>
        <a href="./profile-orders.html">edwardS</a>
        <div class="div"></div>
        <span>12-01-2019</span>
        <div>
            <i class="fas fa-check-circle"></i>
            <i class="fas fa-times-circle"></i>
        </div>
    </div>
    <div class="list-item" href="./product.html">
        <a href="./submission.html">
            <img src="../resources/images/apparel/hoodie_2_smiley_single.jpg" alt="Submission Picture">
        </a> 
        <div class="div"></div>
        <a href="./submission.html">Smiley Hoodie V2.1</a>
        <div class="div"></div>
        <a href="./profile-orders.html">edwardS</a>
        <div class="div"></div>
        <span>12-01-2019</span>
        <div>
            <i class="fas fa-check-circle"></i>
            <i class="fas fa-times-circle"></i>
        </div>
    </div>
</div>
@endsection