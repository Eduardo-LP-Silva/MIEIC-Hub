@extends('layouts.auth')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/login.css') }}">
@endsection

@section('title')
    <title>Reset Password - MIEIC Hub</title>
@endsection

@section('content')

    <div class="login">
        <img src="{{asset('img/website/avatar.png')}}" class="avatar">
        
        @if (session('status'))
            <div class="alert alert-success">
                {{ session('status') }}
            </div>
        @endif

        <form method="POST" role="form" action="{{ route('password.email') }}">
            {{ csrf_field() }}

            @if ($errors->has('email'))
            <span class="help-block" style="color: white;"><strong>{{ $errors->first('email') }}</strong></span>
            @endif
            
            <input id="email" type="email" name="email" placeholder="🕵🏻    Email" required>
            <a><input type="submit" value="Confirm"></a> 
            <br>
            <br>
            </a>
        </form>
    </div>
@endsection
