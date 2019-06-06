<?php
    use App\Submission;
    use App\User;
    use App\Utils;
    use Illuminate\Support\Facades\Input;
?>

@extends('layouts.page')

@section('stylesheets')
    <link rel="stylesheet" href="{{ asset('css/submissions.css') }}">
    <link rel="stylesheet" href="{{ asset('css/search-params.css') }}">
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
                {{{Utils::reverse_slug(Input::get('filter'))}}}
            </span>
            <div class="dropdown-menu" aria-labelledby="searchDropDown">
                <a class="dropdown-item" href="/submissions?filter=Last-Week">Last Week</a>
                <a class="dropdown-item" href="/submissions?filter=Last-Month">Last Month</a>
                <a class="dropdown-item" href="/submissions?filter=Ever">Ever</a>
            </div>
        </div>
    </div>
    @foreach($submissions as $submission)
    <div class="list-item">
         <a href=<?="/submission/" . $submission->id_submission?>>
            <img src={{asset(Utils::replaceWhiteSpace($submission->picture))}} alt="Submission Picture">
        </a>
        <div class="div"></div>
        <a href=<?="/submission/" . $submission->id_submission?>>
            {{{$submission->submission_name}}}
        </a>
        <div class="div"></div>
        <a href="{{{url('/users/' . $submission->name)}}}">
            {{{$submission->name}}}
        </a>
        <div class="div"></div>
        <span><?=substr($submission->submission_date, 0, 10)?></span>
        <form action="{{url('/submission/' . $submission->id_submission . '/accept') }}" method="GET">
            <button class="but1" type="submit"><i class="fas fa-check-circle"></i></button>
        </form>
        <form action="{{url('/submission/' . $submission->id_submission . '/remove') }}" method="GET">
            <button class="but2" type="submit"><i class="fas fa-times-circle"></i></button>
        </form>
    </div>
    @endforeach
</div>
@endsection
