@extends('layouts.auth')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/login.css') }}">
@endsection

@section('title')
    <title>Login - MIEIC Hub</title>
@endsection

@section('content')
  <div class="login">
    <img src="{{asset('img/images/website/avatar.png')}}" class="avatar">
    <h1>Sign In</h1>
    <form>
      <input type="text" name="" placeholder="🕵🏻    Username" required>
      <input type="password" name="" placeholder="🔒    Password" required>
      <a href="./home.html"><input type="submit" name="" value="Login"></a> 
      <a href="#">Forgot your password?</a>
      <br>
      <br>
      <a href="./register.html">Don't have an account?
        <p>Register here<p>
      </a>
    </form>
  </div>
@endsection