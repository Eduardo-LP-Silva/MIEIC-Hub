@extends('layouts.page')

@section('stylesheets')
    <link rel="stylesheet" href="{{ asset('css/settings.css') }}">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
@endsection

@section('scripts')
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"
    defer></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"
    defer></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"
    defer></script>
@endsection

@section('title')
    <title>Settings - MIEIC Hub</title>
@endsection

@section('content')
    <div id="content">
        <div>
            <h1>Settings</h1>
            <img src="{{asset('img/images/website/settings-icon.png')}}" class="avatar">
        </div>
        <div class="accordion" id="accordionExample">
          <!--Email-->
          <div class="card">
            <div class="card-header" id="headingThree">
              <h5 class="mb-0">
                <span>Email</span>
                <div class="card_options">
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                        <button class="save" type="button"><i class="fa fa-save"></i></button>
                    </div>
                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree"
                      aria-expanded="false" aria-controls="collapseThree">
                      Edit 🖋
                    </button>
                </div>
              </h5>
            </div>
            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
              <div class="card-body">
                <div class="current_options">
                  <span>Current: </span>
                  <span>edward_s@gmail.com</span>
                </div>
                <input type="email" name="emailadress" placeholder="   Enter Email">
              </div>
            </div>
          </div>
          <!--Pass  -->
          <div class="card">
            <div class="card-header" id="headingTwo">
              <h5 class="mb-0">
                <a>Password</a>
                <div class="card_options">
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                        <button class="save" type="button"><i class="fa fa-save"></i></button>
                    </div>
                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo"
                      aria-expanded="false" aria-controls="collapseTwo">
                      Edit 🖋
                    </button>
                </div>
              </h5>
            </div>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
              <div class="card-body">
                <input type="password" name="" placeholder="    Enter Password"><br>
                <input type="password" name="" placeholder="   Confirm Password">
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-header" id="headingFour">
              <h5 class="mb-0">
                <p>Date of birth</p>
                <div class="card_options">
                    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                        <button class="save" type="button"><i class="fa fa-save"></i></button>
                    </div>
                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFour"
                      aria-expanded="false" aria-controls="collapseTwo">
                      Edit 🖋
                    </button>
                </div>
              </h5>
            </div>
            <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
              <div class="card-body">
                <div class="current_options">
                  <span>Current: </span>
                  <span>22/01/1998</span>
                </div>
                <input type="date" name="bithdaydate">
              </div>
            </div>
          </div>
          <div id="files" class="form-group">
            <label for="images">Upload new profile picture<picture>
              </picture> </label>
            <input id="images" class="form-control-file" name="images" type="file" accept="image/png, image/jpeg" multiple>
          </div>
          <div id="delete">
            <input type="button" name="Delete Account" value="Delete Account" class="btn">
          </div>
        </div>
      </div>
@endsection