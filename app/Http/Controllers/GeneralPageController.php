<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class GeneralPageController extends Controller {
    public function home() {
        return view('pages.home');
    }

    // public function login() {
    //     return view('pages.login');
    // }

    public function about()
    {
        return view('pages.about');
    }
}
