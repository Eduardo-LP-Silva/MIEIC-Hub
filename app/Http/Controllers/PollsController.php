<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Poll;
use App\User;
use App\Submission;

class PollsController extends Controller
{
    public function upcoming()
    {
        $polls = Poll::getPolls();

        return view('pages.upcoming', ['polls' => $polls]);
    }

    public function pollForm()
    {
      $accepted_submissions = Submission::getAcceptedSubmissions();

      return view('pages.add-poll', ['accepted_submissions' => $accepted_submissions]);
    }


    public function edit($poll_id)
    {
        if(!Auth::check())
            return redirect('/login');

        if(!Auth::user()->isSubManager())
            return redirect('/error/403');

        $option = Input::get('option');
        $poll = Poll::find($poll_id);

        if($poll_id == null)
            return redirect('/error/404');

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
                return redirect('/error/400');
        }

        return redirect("/upcoming");
    }

    public function addPoll(Request $request)
    {
        if(!Auth::check())
            return redirect('/login');

        if(!Auth::user()->isSubManager())
            return redirect('/error/403');

        $poll = new Poll;
        $poll->poll_name = $request->name;
        $poll->expiration = $request->expiration;
        $poll->active = true;
        $poll->save();

        for($i = 0; $i < $request->size; $i++)
        {
            $sub_string = 'sub' . $i;

            if($request->has($sub_string))
            {
                $sub = Submission::find($request->$sub_string);

                $sub->id_poll = $poll->id_poll;
                $sub->save();
            }
        }

        return redirect('/upcoming');
    }
}
