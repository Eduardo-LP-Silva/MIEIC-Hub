<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function()
{
    return redirect('login');
});

Route::get('home', 'GeneralPageController@home');

Route::get('products/{id}', 'ProductsController@show');

Route::get('users/{name}', 'UsersController@show');
Route::get('users/{name}/reviews', 'UsersController@profileReviews');
Route::get('users/{name}/orders', 'UsersController@profileOrders');
Route::get('users/{name}/settings', 'UsersController@edit');
Route::post('users/{name}/settings/edit', 'UsersController@update');
Route::delete('users/{name}/delete', 'UsersController@destroy');
Route::get('users/{name}/privilege', 'UsersController@privilege');

Route::get('about', 'GeneralPageController@about');
Route::get('faq', 'GeneralPageController@faq');
Route::get('faq/{id}/remove', 'GeneralPageController@removeFaq');
Route::put('faq/add', 'GeneralPageController@addFaq');

Route::get('search/{filter}', 'GeneralPageController@search');

Route::get('login', 'Auth\LoginController@showLoginForm')->name('login');
Route::post('login', 'Auth\LoginController@login');
Route::get('logout', 'Auth\LoginController@logout')->name('logout');
Route::get('register', 'Auth\RegisterController@showRegistrationForm')->name('register');
Route::post('register', 'Auth\RegisterController@register');

Route::get('upcoming', 'Auth\PollsController@upcoming');
Route::get('submission/{id_submission}', 'SubmissionController@show');
Route::post('submission/{id_submission}/accept', 'SubmissionController@udpateAccepted');
Route::post('submission/{id_submission}/remove', 'SubmissionController@destroy');
Route::get('submit', 'SubmissionController@submit');
Route::post('submit', 'SubmissionController@submitForm');

Route::get('users/{name}/cart', 'PurchasesController@showCart');
Route::delete('users/{id_user}/cart/{id_product}/remove', 'PurchasesController@deleteCartEntry');