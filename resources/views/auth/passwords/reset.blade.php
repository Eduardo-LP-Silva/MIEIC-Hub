@extends('layouts.auth')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/login.css') }}">
@endsection

@section('title')
    <title>Reset Password - MIEIC Hub</title>
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
        <img src="{{asset('img/website/avatar.png')}}" class="avatar">
        <form method="POST" action="{{ route('password.reset') }}">
            {{ csrf_field() }}
            <input type="hidden" name="token" value="{{ $token }}">
            <input id="email" type="email" name="email" placeholder="🕵🏻    Email" required>
            <input id="password" type="password" name="password" placeholder="🔒    Password" required>
            <input id="password_confirmation" type="password" name="password_confirmation" 
            placeholder="🔒    Confirm password" required>
            <a><input type="submit" value="Reset"></a> 
            <br>
            <br>
            </a>
        </form>
    </div>
@endsection
