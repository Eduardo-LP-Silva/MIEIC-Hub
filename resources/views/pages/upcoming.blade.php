<?php 
    use App\Utils; 
    use App\UserSubVote;

    $user = Auth::user();
?>

@extends('layouts.page')

@section('stylesheets')
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link rel="stylesheet" href="{{ asset('css/polls.css') }}">

    @if($user != null && $user->isSubManager())
    <link rel="stylesheet" href={{asset("css/edit-polls-admin.css")}}>
    @endif
@endsection

@section('scripts')
    <script src="{{asset('js/polls.js')}}" defer></script>
@endsection

@section('title')
    <title>Upcoming - MIEIC Hub</title>
@endsection

@section('content')
<input id="main" type="hidden" name=<?php if(Auth::check()) echo Utils::slug(Auth::user()->name); else echo "null";?>
    token={{csrf_token()}}>
@if($user != null && $user->isSubManager())
<div id="addPoll">
    <a href="/add-poll-admin">
        <button type="button" class="btn btn-light">
            <i class="fa fa-plus"></i>
            Add poll
        </button>
    </a>
</div>
@endif
@foreach($polls as $poll)
<?php $designs = $poll->getDesigns(); ?>
<section class="poll">
    <h1>{{{$poll->poll_name}}}</h1>
        @if($user != null && $user->isSubManager())
        <form action=<?="/poll/" . $poll->id_poll?> method="GET">
            @if($poll->active)
            <button class="btn" type="submit" name="option" value="close">Close poll</button>
            @endif
            <button class="btn" type="submit" name="option" value="delete">Delete poll</button>
        </form>
        @endif
        <div class="container">
            <div class="row">
                @foreach($designs as $design)
                <div class="col">
                    <div class="design_container" sub=<?=$design->id_submission?>>
                        @if($user != null && $poll->active)
                            @if(UserSubVote::hasUserVoted($user->id, $design->id_submission))
                                <i class="fa fa-heart heart"></i>
                            @else
                                <i class="far fa-heart heart"></i>
                            @endif
                        @else
                            <input type="hidden">
                        @endif
                        <span><?=$design->votes?></span>
                        <img src={{Utils::replaceWhiteSpace(asset($design->picture))}}>
                    </div>
                    <h1>{{{$design->submission_name}}}</h1>
                </div>
                @endforeach
            </div>
        </div>
    <span>Poll expires on: </span>
    <span><?=$poll->expiration?></span>
</section>
@endforeach
@endsection