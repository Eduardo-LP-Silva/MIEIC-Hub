@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/about.css') }}">
@endsection

@section('title')
    <title>About - MIEIC Hub</title>
@endsection

@section('content')
  <!--Pictures-->
  <div id="about">
    <div class="about-us">
      <h1>Our Team</h1>
      <div class="pictures">
        <a href="#edu"><img src="{{asset('img/about-us/edu.jpg')}}" alt="Eduardo"></a>
        <a href="#joana"><img src="{{asset('img/about-us/joana.png')}}" alt="Joana"></a>
        <a href="#miguel"><img src="{{asset('img/about-us/miguel.jpg')}}" alt="Miguel"></a>
        <a href="#tomas"><img src="{{asset('img/about-us/tomas.png')}}" alt="Tomás"></a>
      </div>
    </div>
    <div class="section" id="edu">
      <span class="name">Eduardo Silva</span>
      <p>
        "I'm Eduardo! I'm a MIEIC student in my 3rd year with an interest in history and military aviation."
      </p>
    </div>
    <div class="section" id="joana">
      <span class="name">Joana Ramos</span>
      <p>
        "I'm Joana! I spend a lot of time listening to music and reading books."
      </p>
    </div>
    <div class="section" id="miguel">
      <span class="name">Miguel Carvalho</span>
      <p>
        "I'm Miguel! "
      </p>
    </div>
    <div class="section" id="tomas">
      <span class="name">Tomas Novo</span>
      <p>
        "I'm Tomás ! I love football, Hip Hop and web development."
      </p>
    </div>
  </div>
@endsection