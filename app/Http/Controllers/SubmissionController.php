<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SubmissionController extends Controller
{

	// aqui ou no GeneralPageController ?

    public function submit()
    {
        return view('pages.submit');
    }

    public function submitDesign()
    {
    	return null;
    }

}
