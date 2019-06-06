@extends('layouts.auth')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/login.css') }}">
@endsection

@section('title')
    <title>Login - MIEIC Hub</title>
@endsection

@section('content')

    <div class="login">

        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
         @endif

        <img src="{{asset('img/website/avatar.png')}}" class="avatar" alt="Avatar">
        <h1>Sign In</h1>
        <form method="POST" action="{{ route('login') }}">
            {{ csrf_field() }}
            <input id="email" type="email" name="email" placeholder="🕵🏻    Email" required>
            <input id="password" type="password" name="password" placeholder="🔒    Password" required>
            <input type="submit" value="Login">
            <br>
            <br>
            <a href="{{ route('register') }}">Don't have an account?
            <p>Register here<p>
            <a href="{{route('password.reset')}}">Forgot Password?</a>
            </a>
        </form>
    </div>
@endsection
