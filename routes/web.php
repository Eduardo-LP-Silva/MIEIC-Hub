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

Route::get('products/add', 'ProductsController@create');
Route::post('products/add', 'ProductsController@store');
Route::get('products/{id}', 'ProductsController@show');
Route::delete('products/{id}/delete', 'ProductsController@destroy');
Route::put('products/{id_product}/reviews/{id_user}', 'ReviewController@create');
Route::delete('products/{id_product}/reviews/{id_user}', 'ReviewController@destroy');
Route::get('users/{name}/wishlist', 'WishlistController@show');
Route::put('wishlist/{id}/add', 'WishlistController@store');
Route::delete('wishlist/{id}/delete', 'WishlistController@destroy');

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

Route::get('password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('password.reset');
Route::post('password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email');
Route::get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('password.reset.token');
Route::post('password/reset', 'Auth\ResetPasswordController@reset');

Route::get('upcoming', 'PollsController@upcoming');
Route::get('poll/{poll_id}', 'PollsController@edit');
Route::put('users/{name}/vote/{id_sub}', 'SubmissionController@vote');
Route::delete('users/{name}/vote/{id_sub}', 'SubmissionController@unvote');

Route::get('submission/{id_submission}', 'SubmissionController@show');
Route::post('submission/{id_submission}/accept', 'SubmissionController@udpateAccepted');
Route::post('submission/{id_submission}/remove', 'SubmissionController@destroy');
Route::get('submit', 'SubmissionController@submit');
Route::post('submit', 'SubmissionController@submitForm');
Route::get('submissions', 'SubmissionController@showSubmissions');
Route::get('upcoming/newpoll', 'PollsController@pollForm');
Route::post('upcoming/newpoll', 'PollsController@addPoll');

Route::get('users/{name}/cart', 'PurchasesController@showCart');
Route::delete('users/{id_user}/cart/{id_product}/remove', 'PurchasesController@deleteCartEntry');
Route::get('users/{name}/checkout', 'PurchasesController@checkout');
Route::post('users/{name}/checkout', 'PurchasesController@checkoutForm');
