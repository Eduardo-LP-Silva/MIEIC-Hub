@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/product.css') }}">
@endsection

@section('title')
    <title>Product - MIEIC Hub</title>
@endsection

@section('content')
<div id="content" class="container">
            <div id="product" class="row">
                <!-- Product photos-->
                <div id="gallery" class="carousel slide col-md-6" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#gallery" data-slide-to="0" class="active"></li>
                        <li data-target="#gallery" data-slide-to="1"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="{{asset('img/images/apparel/hoodie_1.jpg')}}">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="{{asset('img/images/apparel/hoodie_2.jpg')}}">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#gallery" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#gallery" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <!-- Informations -->
                <div id="info" class="col-md-6">
                    <h1>Sweatshirt</h1>
                    <i class="far fa-heart heart"></i>

                    <div class="to-flex">
                        <h2 id="price">Price: 15.00€</h2>
                        <div id="product-rating" class="stars-outer">
                            <div class="stars-inner"></div>
                        </div>
                    </div>

                    <div id="size">
                        <h2>Size:</h2>
                        <div class="btn-group w-75" role="group" aria-label="Size">
                            <button type="button" class="btn btn-secondary">XS</button>
                            <button type="button" class="btn btn-secondary">S</button>
                            <button type="button" class="btn btn-secondary">M</button>
                            <button type="button" class="btn btn-secondary">L</button>
                            <button type="button" class="btn btn-secondary">XL</button>
                        </div>
                    </div>

                    <div id="color">
                        <h2>Color:</h2>
                        <select class="custom-select">
                            <option selected="" value="bordeaux">Bordeaux</option>
                            <option value="grey">Grey</option>
                        </select>  
                    </div>

                    <div id="informations" class="accordion">
                        <div class="card">
                            <div class="card-header" id="descriptionheader">
                                <h2 class="mb-0">
                                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#description"
                                        aria-expanded="false" aria-controls="description">
                                        Description and details
                                    </button>
                                </h2>
                            </div>
                            <div id="description" class="collapse" aria-labelledby="descriptionheader" data-parent="#informations">
                                <div class="card-body">
                                    <ul>
                                        <li>Standard fit for a relaxed, easy feel</li>
                                        <li>Front pockets</li>
                                        <li>Fabric: 66% cotton/34% polyester</li>
                                        <li>Machine wash</li>
                                    </ul>
                                </div>
                            </div>
                        </div><!--
                        <div class="card">
                            <div class="card-header" id="deliveryheader">
                                <h2 class="mb-0">
                                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#delivery"
                                        aria-expanded="false" aria-controls="delivery">
                                        Delivery info
                                    </button>
                                </h2>
                            </div>
                            <div id="delivery" class="collapse" aria-labelledby="deliveryheader" data-parent="#informations">
                                <div class="card-body">
                                    <table class="table">
                                        <thead>
                                          <tr>
                                            <th>Region</th>
                                            <th>Price</th>
                                            <th>Business Days</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <th scope="row">Portugal</th>
                                            <td>3.99€</td>
                                            <td>3-7</td>
                                          </tr>
                                          <tr>
                                            <th scope="row">Europe</th>
                                            <td>5.99€</td>
                                            <td>5-9</td>
                                          </tr>
                                          <tr>
                                            <th scope="row">Rest of the world</th>
                                            <td>8.99€</td>
                                            <td>10-14</td>
                                          </tr>
                                        </tbody>
                                      </table>
                                </div>
                            </div>
                        </div>-->
                    </div>

                    <div id="buy">
                        <button type="button" class="btn btn-success">Buy now</button>
                        <button type="button" class="btn btn-success">Add to cart</button>
                    </div>
                </div>
            </div>
            <!-- Reviews -->
            <div id="reviews" class="row">
                <div class="col-12">
                    <h1>Reviews</h1>
                    <div id="add" class="media container">
                        <img class="d-flex mr-3" data-src="holder.js/64x64?theme=sky" alt="64x64" style="width: 64px; height: 64px;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16948714b27%20text%20%7B%20fill%3A%23FFFFFF%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16948714b27%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%230D8FDB%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2214.5%22%20y%3D%2236.8%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">
                        <div class="media-body row">
                            <h5 class="mt-0 col-6">You</h5>
                            <div class="rating col-6">
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                            </div>    
                            <textarea class="ml-3" placeholder="Add your review"></textarea>
                            <button class="btn btn-success">Submit</button>
                        </div>
                    </div>
                    <div class="media container">
                        <img class="d-flex mr-3" data-src="holder.js/64x64?theme=sky" alt="Profile picture" style="width: 64px; height: 64px;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16948714b27%20text%20%7B%20fill%3A%23FFFFFF%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16948714b27%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%230D8FDB%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2214.5%22%20y%3D%2236.8%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">
                        <div class="media-body row">
                            <h5 class="mt-0 col-6">Zé Carlos</h5>
                            <div class="rating col-6">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                            </div>    
                            <p class="ml-3">I love this hoodie! Looks really cool and is very comfortable.</p>
                        </div>
                    </div>
                    <div class="media container">
                        <img class="d-flex mr-3 " data-src="holder.js/64x64?theme=sky" alt="64x64" style="width: 64px; height: 64px;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16948714b27%20text%20%7B%20fill%3A%23FFFFFF%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16948714b27%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%230D8FDB%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2214.5%22%20y%3D%2236.8%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">
                        <div class="media-body row">
                            <h5 class="mt-0 col-6">Mariana Luís</h5>
                            <div class="rating col-6">
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star"></span>
                            </div>    
                            <p class="ml-3">The shipping took a little bit but I like the sweatshirt.</p>
                        </div>
                    </div>
                    <div class="media container">
                        <img class="d-flex mr-3" data-src="holder.js/64x64?theme=sky" alt="64x64" style="width: 64px; height: 64px;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16948714b27%20text%20%7B%20fill%3A%23FFFFFF%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16948714b27%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%230D8FDB%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2214.5%22%20y%3D%2236.8%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">
                        <div class="media-body row">
                            <h5 class="mt-0 col-6">Catarina Ramos</h5>
                            <div class="rating col-6">
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                            </div>    
                            <p class="ml-3">I don't know why I bought this. I study chemistry at FCUP.</p>
                        </div>
                    </div>
                          
                </div>
            </div>
        </div>
@endsection