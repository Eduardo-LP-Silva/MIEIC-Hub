<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Poll;

class PollsController extends Controller
{
    public function upcoming()
    {
        $polls = Poll::getActivePolls();

        return view('pages.upcoming', ['polls' => $polls]);
    }

    public function addPoll()
    {
      $accepted_submissions = Poll::getAcceptedSubmissions();

      $names = array();

      foreach ($accepted_submissions as $accepted_submission)
      {
        $username = Poll::getUsername($accepted_submission->id_submission);
        $names[] = $username[0];
      }

      return view('pages.addPoll', ['accepted_submissions' => $accepted_submissions, 'names' => $names ]);
    }
}
