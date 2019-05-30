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
Route::get('users/{name}', 'UsersController@profile');
Route::get('users/{name}/reviews', 'UsersController@profileReviews');
Route::get('users/{name}/settings', 'UsersController@settings');

// Route::get('login', 'GeneralPageController@login');

Route::get('about', 'GeneralPageController@about');
Route::get('faq', 'GeneralPageController@faq');

Route::get('login', 'Auth\LoginController@showLoginForm')->name('login');
Route::post('login', 'Auth\LoginController@login');
Route::get('logout', 'Auth\LoginController@logout')->name('logout');
Route::get('register', 'Auth\RegisterController@showRegistrationForm')->name('register');
Route::post('register', 'Auth\RegisterController@register');

Route::get('upcoming', 'Auth\PollsController@upcoming');
Route::get('submission/{id_submission}', 'SubmissionController@show');