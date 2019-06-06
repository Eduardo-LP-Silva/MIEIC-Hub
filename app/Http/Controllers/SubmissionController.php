<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\Product;
use App\Photo;
use App\Submission;
use App\User;
use App\Utils;
use App\Category;
use App\UserSubVote;

class SubmissionController extends Controller
{

    /**
     * Where to redirect users after the form.
     *
     * @var string
     */
    protected $redirectTo = '/upcoming';

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    public function vote($name, $id_sub)
    {
        $user = User::getURLUser($name);

        if(!Auth::check() || Auth::user()->name != $user->name)
            abort(403, 'Permission denied');

        $id_user = $user->id;

        if(UserSubVote::hasUserVoted($id_user, $id_sub))
            abort(400, 'User has already voted for this design on this poll');

        UserSubVote::create($id_user, $id_sub);

        return 200;
    }

    public function unvote($name, $id_sub)
    {
        $user = User::getURLUser($name);

        if(!Auth::check() || Auth::user()->name != $user->name)
            abort(403, 'Permission denied');

        $id_user = $user->id;;

        if(!UserSubVote::hasUserVoted($id_user, $id_sub))
            abort(400, "User hasn't already voted for this design on this poll");

        UserSubVote::remove($id_user, $id_sub);

        return 200;
    }

     /**
     * Show the form for submit the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function submit()
    {
        $user = Auth::user();

        if($user == null)
            abort(403, 'Permission denied');

        if($user->isAuthenticatedUser())
            return view('pages.submit', ['user' => $user]);
    }

     /**
     * Insert the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function submitForm(Request $request)
    {
        $user = Auth::user();

        if($user == null)
            abort(403, 'Permission denied');

        $id_user = $user->id;
        $submission_name = $request->name;
        $type = $request->type;

        $category = Category::where('category', $type)->get()[0];

        $description = $request->description;

        $submission_date = date("Y-m-d");
        $accepted = false;
        $votes = 0;
        $winner = false;
        $id_poll = null;

        //photo
        $picture = null;

        if(!$request->has('photo'))
            abort(404, 'No file');

        $request->validate
        (
            ['photo' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048']
        );

        $new_image = $request->file('photo');

        if($new_image == null)
            abort(400, 'Null file');

        $new_photo_name = Utils::slug($user->name) . "-" . Utils::slug($submission_name) . "-" . Utils::slug(date("Y-m-d H:i:s"));

        Utils::saveImage($new_image, "/img/submissions/", "public", $new_photo_name);

        $path = "img/submissions/" . $new_photo_name . '.' . $new_image->getClientOriginalExtension();

        DB::table('submission')->insert(
            ['id_user' => $id_user,
             'submission_name' => $submission_name,
             'id_category' => $category->id_category,
             'submission_description' => $description,
             'picture' => $path,
             'accepted' => $accepted,
             'votes' => $votes,
             'winner' => $winner,
             'id_poll' => $id_poll]);

        return redirect("/home");
    }



    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id_submission)
    {
        $submission = Submission::find($id_submission);

        $user = User::where('id', $submission->id_user)->get()[0];

        $category = Category::where('id_category', $submission->id_category)->get()[0];

        return view('pages.submission', ['submission' => $submission, 'user' => $user, 'category' => $category]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id_submission)
    {
        $submission = Submission::find($id_submission);

        $user = Auth::user();

        if($user->isMod())
        {
            $submission->delete();

            return redirect(URL::previous());
        }
        else
            abort(403, 'Permission denied');
    }

    public function showSubmissions()
    {
        if(!Auth::check() || !Auth::user()->isSubManager())
            abort(403, 'Permission denied');

        $date_filter = Input::get('filter');

        switch($date_filter)
        {
            case "Last-Week":
                $date_filter = date("Y-m-d", strtotime("-1 week +1 day"));
                break;

            case "Last-Month":
                $date_filter = date("Y-m-d", strtotime("first day of previous month"));
                break;

            case "Ever":
                $date_filter = 0;
                break;

            default:
                abort(400, 'Unknown date filter: ' . $date_filter);
        }

      $submissions = Submission::getSubmissions($date_filter);

      return view('pages.submissions', ['submissions' => $submissions]);
    }

    public function udpateAccepted($id_submission)
    {
      $submission = Submission::find($id_submission);

      $user = Auth::user();

      if($user->isMod())
      {
        $value = true;

        DB::table('submission')
            ->where('id_submission', $submission->id_submission)
            ->update(['accepted' => $value]);

          return redirect(URL::previous());
      }
      else
          abort(403, 'Permission denied');
    }
}
