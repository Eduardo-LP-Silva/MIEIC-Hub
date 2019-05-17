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

//	Fazer um controller por modulo ???

Route::get('home', 'GeneralPageController@home');
Route::get('product', 'GeneralPageController@product');

Route::get('submit', 'SubmissionController@submit');
//Route::put('submitDesign', 'SubmissionController@submitDesign');

Route::get('/users/{name}/cart', 'PurchaseController@cart');

Route::get('about', 'GeneralPageController@about');
Route::get('faq', 'GeneralPageController@faq');

Route::get('login', 'Auth\LoginController@showLoginForm')->name('login');
Route::post('login', 'Auth\LoginController@login');
Route::get('logout', 'Auth\LoginController@logout')->name('logout');
Route::get('register', 'Auth\RegisterController@showRegistrationForm')->name('register');
Route::post('register', 'Auth\RegisterController@register');