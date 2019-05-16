@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/faq.css') }}">
@endsection

@section('title')
    <title>FAQ - MIEIC Hub</title>
@endsection

@section('content')
        <div class="accordion" id="accordionExample">
          <h1> Frequently Asked Questions</h1>

          <div class="card">
            <div class="card-header" id="headingOne">
              <h5 class="mb-0">
                <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                  Question 1: How can I buy a product ?  🔻
                </button>
              </h5>
            </div>
        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
          <div class="card-body">
            To buy a product, you need to click "Products" in the navigation bar to show the products dropdown. 
            There, you can choose the type of the product that you want. You can also search for a product in the 
            search bar of the navigation bar. When you get to one of this pages, you can choose one of the products. 
            In that specific product page, you can buy the item immediately or you can add it to your cart and buy 
            it later. Both of these actions can be accomplished through two buttons present on that page.
          </div>
        </div>
      </div>
      <div class="card">
        <div class="card-header" id="headingTwo">
          <h5 class="mb-0">
            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
              Question 2: How can I create an account ?  🔻
            </button>
          </h5>
        </div>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
          <div class="card-body">
          To create an account, you need to press the User icon in the navigation bar, followed by the option Sign-up
          in the dropdown that appeared.
          </div>
        </div>
      </div>
      <div class="card">
        <div class="card-header" id="headingThree">
          <h5 class="mb-0">
            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
              Question 3: How can I add a product to my wishlist ?  🔻
            </button>
          </h5>
        </div>
        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
          <div class="card-body">
          To add a product to your wishlist, you have to be logged in. In the product's page you should press the button 
          "Add to wishlist".
          </div>
        </div>
      </div>

      <div class="card">
        <div class="card-header" id="headingFour">
          <h5 class="mb-0">
            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseThree">
              Question 4: How can I create a design ?  🔻
            </button>
          </h5>
        </div>
        <div id="collapseFour" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
          <div class="card-body">
            If you want to submit your own design, you have to be logged int and then press the "Submit your design" 
            button on the navigation bar. There you have to fill the various fields regarding your desing and then submit it.
          </div>
        </div>
      </div>

      <div class="card">
        <div class="card-header" id="headingFive">
          <h5 class="mb-0">
            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseThree">
              Question 5: How can I vote on a desing ?  🔻
            </button>
          </h5>
        </div>
        <div id="collapseFive" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
          <div class="card-body">
            To vote on a design, you have to log in and then click on the "Upcomig" button on the navigation bar. 
            There you have several polls of designs made by other users. To vote on a design, you should press the heart 
            button that appears on the product that you put the cursor on. Your vote is registed when that button gains 
            color. 
          </div>
        </div>
      </div>
    </div>
@endsection
