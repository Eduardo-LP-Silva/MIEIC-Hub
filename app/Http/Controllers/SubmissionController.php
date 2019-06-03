<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
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

        $field = $request->field;

        $value = null;

        switch($field)
        {
            case "name":
                $value = $request->$field;
                break;

            case "description":
                $value = $request->$field;
                break;

            case "type":
                $value = $request->$field;
                break;

            case "images":
                if(!$request->has('images'))
                    abort(400, 'No files');

                $request->validate
                (
                    ['images' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',]
                );

            default:
                //abort(404, 'User setting ' . $setting . " does not exist");
        }


        return reditect($redirectTo);

    }

    public function submitFields($fields, $id_user)
    {
        DB::table('submission')->insert([
            ['id_user' => $id_user, 'votes' => 0],
        ]);
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

        dump($id_submission);
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
}
