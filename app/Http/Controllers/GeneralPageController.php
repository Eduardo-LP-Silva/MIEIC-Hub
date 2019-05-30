<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class GeneralPageController extends Controller {
    public function home() 
    {
        return view('pages.home');
    }

    public function about()
    {
        return view('pages.about');
    }

    public function faq()
    {
        return view('pages.faq');
    }

    public function product()
    {
        return view('pages.product');
    }
}
