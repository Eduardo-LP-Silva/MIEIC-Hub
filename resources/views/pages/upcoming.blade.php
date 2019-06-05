<?php 
    use App\Utils; 
    use App\UserSubVote;
?>

@extends('layouts.page')

@section('stylesheets')
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link rel="stylesheet" href="{{ asset('css/polls.css') }}">
@endsection

@section('scripts')
    <script src="{{asset('js/polls.js')}}" defer></script>
@endsection

@section('title')
    <title>Upcoming - MIEIC Hub</title>
@endsection

@section('content')
<input id="user" type="hidden" name=<?php if(Auth::check()) echo Auth::user()->name; else echo "null";?>>
@foreach($polls as $poll)
<?php $designs = $poll->getDesigns(); ?>
<section class="poll">
    <h1><?=$poll->poll_name?></h1>
        <div class="container">
            <div class="row">
                @foreach($designs as $design)
                <div class="col">
                    <div class="design_container" poll=<?=$poll->id_poll?>>
                        @if(($user = Auth::user()) != null)
                            @if(UserSubVote::hasUserVoted($user->id, $design->id_submission))
                                <i class="far fa-heart heart"></i>
                            @else
                                <i class="fa fa-heart heart"></i>
                            @endif
                        @endif
                        <span><?=$design->votes?></span>
                        <img src={{Utils::replaceWhiteSpace(asset($design->picture))}}>
                    </div>
                    <h1><?=$design->submission_name?></h1>
                </div>
                @endforeach
            </div>
        </div>
    <span>Poll expires on: </span>
    <span><?=$poll->expiration?></span>
</section>
@endforeach
@endsection