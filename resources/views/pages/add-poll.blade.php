<?php 
  use App\User;
?>

@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/add-poll-admin.css') }}">
        <link rel="stylesheet" href="{{ asset('css/submit.css') }}">
@endsection

<script src="http://code.jquery.com/jquery.min.js"></script>
@yield('scripts')

@section('title')
    <title>Add Poll - MIEIC Hub</title>
@endsection

@section('content')

<div id="content">
  <h1>Add poll</h1>

  <form id="submit_checked" action="{{url('upcoming/newpoll')}}" method="POST">
      {{ csrf_field() }}
      <div id="title" class="form-group">
          <label for="name">Title: </label>
          <input id="name" name="name" type="text" required="true">
      </div>

      <section id="designs">
          <h4>Choose designs</h4>
          <div id="list">
              <input type="hidden" name="size" value=<?=sizeof($accepted_submissions)?>>
              @foreach($accepted_submissions as $submission)
              <?php $author = User::find($submission->id_user); ?>
              <div class="list-item" href="./product.html">
                  <a href="./submission.html">
                      <img src="../resources/images/apparel/hoodie_3_single.jpg" alt="Submission Picture">
                  </a>
                  <div class="div"></div>
                  <a href={{url('/submission/' .  $submission->id_submission)}}>{{{$submission->submission_name}}} </a>
                  <div class="div"></div>
                  <a href="{{url('/users/' . $author->name . '/reviews')}}">{{{$author->name}}}</a>
                  <input type="checkbox" name=<?="sub" . $loop->index?> value ="{{{$submission->id_submission}}}" >
              </div>
              @endforeach
          </div>
      </section>
      <div id="date" class="form-group">
          <label for="expiration">Expiration date:</label>
          <input id="expiration" name="expiration" type="date">
      </div>
      <div id="poll" class="form-group">
        <input type="submit" form="submit_checked" value="Add poll!" class="btn btn-success btn-lg">
      </div>
  </form>
</div>
@endsection
