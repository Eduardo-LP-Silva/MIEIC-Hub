<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Product;
use App\Photo;
use App\Submission;
use App\User;
use App\Utils;
use App\Category;

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

        $category = Category::where('category', $type);

        dump($category);

        $description = $request->description;
        $submission_date = date("Y/m/d");
        $accepted = false;
        $votes = 0;
        $winner = false;
        $id_poll = null;

        //photo
        $picture = null;
        if(!$request->has('photo'))
            abort(404, 'No file');

        /*$request->validate
        (
            ['photo' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',]
        );*/

        $new_image = $request->file('photo');

        if($new_image == null)
            abort(400, 'Null file');

        $new_photo_name = $user->name . $submission_name . $submission_date;

        $value = Photo::create
        (
            "img/submissions/" . $new_photo_name . '.' . $new_image->getClientOriginalExtension(),
            null
        );

        Utils::saveImage($new_image, "/img/submissions/", "public", $new_photo_name);

        DB::table('submission')->insert([
            ['id_user' => $id_user,
             'submission_name' => $submission_name,
             'id_category' => $category->id_category,
             'submission_description' => $description,
             'picture' => $value,
             'submission_date' => $submission_date,
             'accepted' => $accepted,
             'votes' => $votes,
             'winner' => $winner,
             'id_poll' => $id_poll
              ],
        ]);
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

        dump($submission);

        $user = Auth::user();

        if($user->isMod())
        {
            $submission->delete();

            return redirect("/home");
        }
        else
            abort(403, 'Permission denied');
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

          return redirect("/home");
      }
      else
          abort(403, 'Permission denied');
    }
}
