<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Poll;

class PollsController extends Controller 
{
    public function upcoming()
    {
        $polls = Poll::getActivePolls();

        return view('pages.upcoming', ['polls' => $polls]);
    }
}