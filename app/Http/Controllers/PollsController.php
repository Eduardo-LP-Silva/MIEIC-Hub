<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Poll;
use App\User;

class PollsController extends Controller
{
    public function upcoming()
    {
        $polls = Poll::getPolls();

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


    public function edit($poll_id)
    {
        if(!Auth::check() || !Auth::user()->isSubManager())
            abort(403, 'Permission denied');

        $option = Input::get('option');
        $poll = Poll::find($poll_id);

        if($poll_id == null)
            abort(404, 'Poll not found');

        switch($option)
        {
            case "close":
                $poll->active = false;
                $poll->save();
                break;

            case "delete":
                $poll->delete();
                break;

            default:
                abort(400, 'Unknown poll action: ' . $option);
        }

        return redirect("/upcoming");
    }
}
