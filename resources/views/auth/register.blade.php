@extends('layouts.auth')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/register.css') }}">
@endsection

@section('title')
    <title>Register - MIEIC Hub</title>
@endsection

@section('content')
  <div class="register">
    <img src="{{asset('img/images/website/avatar.png')}}" class="avatar">
    <h1>Sign Up</h1>
    <form method="POST" action="{{ route('register') }}">
        {{ csrf_field() }}

      <input id="name" type="text" name="name" placeholder="🕵🏻    Enter Name" required>
      @if ($errors->has('name'))
        <span class="error">
            {{ $errors->first('name') }}
        </span>
      @endif

      <input id="email" type="email" name="email" placeholder="📧   Enter Email" required>
      @if ($errors->has('email'))
        <span class="error">
            {{ $errors->first('email') }}
        </span>
      @endif

      <input id="password" type="password" name="password" placeholder="🔒    Enter Password" required>
      @if ($errors->has('password'))
        <span class="error">
            {{ $errors->first('password') }}
        </span>
      @endif

      <input id="password-confirm" type="password" name="password_confirmation" placeholder="🔐   Confirm Password" required>
     
      <a>Birthday:</a> <input class="dateform" id="birth_date" name="birth_date" type="date" name="bithdaydate">
      @if ($errors->has('birth_date'))
        <span class="error">
            {{ $errors->first('birth_date') }}
        </span>
      @endif

      <a><input type="submit" value="Register"></a>
      <a class="button button-outline" href="{{ route('login') }}">Login instead</a>
    </form>
  </div>
@endsection