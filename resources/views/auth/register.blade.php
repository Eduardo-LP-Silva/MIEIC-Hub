{{-- @extends('layouts.app')

@section('content')
<form method="POST" action="{{ route('register') }}">
    {{ csrf_field() }}

    <label for="name">Name</label>
    <input id="name" type="text" name="name" value="{{ old('name') }}" required autofocus>
    @if ($errors->has('name'))
      <span class="error">
          {{ $errors->first('name') }}
      </span>
    @endif

    <label for="email">E-Mail Address</label>
    <input id="email" type="email" name="email" value="{{ old('email') }}" required>
    @if ($errors->has('email'))
      <span class="error">
          {{ $errors->first('email') }}
      </span>
    @endif

    <label for="password">Password</label>
    <input id="password" type="password" name="password" required>
    @if ($errors->has('password'))
      <span class="error">
          {{ $errors->first('password') }}
      </span>
    @endif

    <label for="password-confirm">Confirm Password</label>
    <input id="password-confirm" type="password" name="password_confirmation" required>

    <button type="submit">
      Register
    </button>
    <a class="button button-outline" href="{{ route('login') }}">Login</a>
</form>
@endsection --}}

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
     
      {{-- <form class="dateform">
          <a>Birthday:</a> <input type="date" name="bithdaydate">
      </form> --}}

      <a><input type="submit" value="Register"></a> 
      <a class="button button-outline" href="{{ route('login') }}">Login instead</a>
    </form>
  </div>
@endsection