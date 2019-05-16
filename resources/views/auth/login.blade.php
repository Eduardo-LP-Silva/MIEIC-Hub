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

        <img src="{{asset('img/images/website/avatar.png')}}" class="avatar">
        <h1>Sign In</h1>
        <form method="POST" action="{{ route('login') }}">
            {{ csrf_field() }}

            <input id="email" type="email" name="email" placeholder="🕵🏻    Email" required>
            {{-- @if ($errors->has('email'))
                <span class="error">
                {{ $errors->first('email') }}
                </span>
            @endif --}}

            <input id="password" type="password" name="password" placeholder="🔒    Password" required>
            {{-- @if ($errors->has('password'))
                <span class="error">
                    {{ $errors->first('password') }}
                </span>
            @endif --}}

            <a><input type="submit" value="Login"></a> 
            <br>
            <br>
            <a href="{{ route('register') }}">Don't have an account?
            <p>Register here<p>
            </a>
        </form>
    </div>
@endsection
