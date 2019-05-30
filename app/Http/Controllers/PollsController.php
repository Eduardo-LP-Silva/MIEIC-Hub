<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PollsController extends Controller 
{
    public function upcoming()
    {
        return view('pages.upcoming');
    }

    //admins
    public function submission()
    {
        return view('pages.submit');
    }

    


}