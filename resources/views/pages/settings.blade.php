@extends('layouts.page')

@section('stylesheets')
    <link rel="stylesheet" href="{{ asset('css/settings.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
@endsection

@section('scripts')
    <script src="{{ asset('js/settings.js')}}" defer></script>
@endsection

@section('title')
    <title>Settings - MIEIC Hub</title>
@endsection

@section('content')
    <div id="content">
        <div>
            <h1>Settings</h1>
            <img src="{{asset('img/icons/settings.png')}}" class="avatar" alt="Settings Icon">
        </div>
        <div class="accordion" id="accordionExample">
          <!--Email-->
          <form class="card" action="settings/edit" method="POST">
            <div class="card-header" id="headingThree">
              <div class="mb-0 h5">
                <span>Email</span>
                <div class="card_options">
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                        {{ csrf_field() }}
                        <input type="hidden" name="setting" value="email"/>
                        <button class="save" type="submit"><i class="fa fa-save"></i></button>
                    </div>
                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree"
                      aria-expanded="false" aria-controls="collapseThree">
                      Edit 🖋
                    </button>
                </div>
              </div>
            </div>
            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
              <div class="card-body">
                <div class="current_options">
                  <span>Current: </span>
                  <span>{{{$user->email}}}</span>
                </div>
                <input type="email" name="email" placeholder="   Enter Email" required>
              </div>
            </div>
          </form>
          <!--Pass  -->
          <form class="card" action="settings/edit" method="POST" onsubmit="return confirmPassword()">
            <div class="card-header" id="headingTwo">
              <div class="mb-0 h5">
                <a>Password</a>
                <div class="card_options">
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                        {{ csrf_field() }}
                        <input type="hidden" name="setting" value="password"/>
                        <button class="save" type="submit"><i class="fa fa-save"></i></button>
                    </div>
                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo"
                      aria-expanded="false" aria-controls="collapseTwo">
                      Edit 🖋
                    </button>
                </div>
              </div>
            </div>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
              <div class="card-body">
                <input type="password" name="password" placeholder="    Enter Password" required><br>
                <input type="password" name="password_confirm" placeholder="   Confirm Password" required>
              </div>
            </div>
          </form>
          <!--Birthdate-->
          <form class="card" action="settings/edit" method="POST">
            <div class="card-header" id="headingFour">
              <div class="mb-0 h5">
                <p>Date of birth</p>
                <div class="card_options">
                    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                        {{ csrf_field() }}
                        <input type="hidden" name="setting" value="birth_date"/>
                        <button class="save" type="submit"><i class="fa fa-save"></i></button>
                    </div>
                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFour"
                      aria-expanded="false" aria-controls="collapseTwo">
                      Edit 🖋
                    </button>
                </div>
              </div>
            </div>
            <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
              <div class="card-body">
                <div class="current_options">
                  <span>Current: </span>
                  <span><?=$user->birth_date?></span>
                </div>
                <input type="date" name="birth_date" required>
              </div>
            </div>
          </form>
          <!--Profile Pic-->
          <form id="files" class="form-group" action="settings/edit" method="POST" enctype="multipart/form-data">
            {{ csrf_field() }}
            <label for="photo">Upload new profile picture </label>
            <input id="photo" class="form-control-file" name="photo" type="file" accept="image/png, image/jpeg" multiple required>
            <div class="form-group row mb-0 mt-5">
                <div class="col-md-8 offset-md-4">
                    <input type="hidden" name="setting" value="photo"/>
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
            </div>
          </form>
          <!--Delete-->
          <form id="delete" action="delete" method="POST">
            {{ csrf_field() }}
            <input type="hidden" name="_method" value="DELETE">
            <input type="submit" name="Delete Account" value="Delete Account" class="btn">
          </form>
        </div>
      </div>
@endsection