@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/add-poll-admin.css') }}">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="{{ asset('css/navbar.css')}}">
        <link rel="stylesheet" href="{{ asset('css/footer.css')}}">
        <link rel="stylesheet" href="{{ asset('css/submit.css') }}">
@endsection

@section('title')
    <title>Add Poll - MIEIC Hub</title>
@endsection

@section('content')

<div id="content">
  <h1>Add poll</h1>

  <form action="" method="GET">
      <div id="title" class="form-group">
          <label for="name">Title: </label>
          <input id="name" name="name" type="text" required="true">
      </div>

      <section id="designs">
          <h4>Choose designs</h4>
          <div id="list">
              @for($i = 0; $i < count($accepted_submissions); $i++)
              <div class="list-item" href="./product.html">
                  <a href="./submission.html">
                      <img src="../resources/images/apparel/hoodie_3_single.jpg" alt="Submission Picture">
                  </a>
                  <div class="div"></div>
                  <a href="{{url('/submission/' .  $accepted_submissions[$i]->id_submission )}}"><?= $accepted_submissions[$i]->submission_name?></a>
                  <div class="div"></div>
                  <a href="{{url('/users/' .  $names[$i]->name . '/reviews')}}"><?= $names[$i]->name?></a>
                  <input type="checkbox">
              </div>
              @endfor
          </div>
      </section>

      <div id="date" class="form-group">
          <label for="expiration">Expiration date:</label>
          <input id="expiration" type="date">
      </div>

      <div id="submission" class="form-group">
          <input type="submit" value="Add poll!" class="btn btn-success btn-lg">
      </div>
  </form>
</div>

@endsection
