<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\User;
use App\Utils;
use App\Photo;

class UsersController extends Controller
{
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
    public function show($name)
    {
        return redirect('users/' . $name . '/reviews');
    }

    public function profileReviews($name)
    {
        $user = $this->getURLUser($name);
        $reviews = $user->getReviews();

        return view('pages.profile-reviews', ['user' => $user, 'reviews' => $reviews]);
    }

    public function profileOrders($name)
    {
        $user = $this->getURLUser($name);
        $orders = $user->getOrders();
        $current_user = Auth::user();

        if($user->isAuthenticatedUser() || $current_user->isMod())
            return view('pages.profile-orders', ['user' => $user, 'orders' => $orders]);
        else
            abort(403);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($name)
    {
        $user = $this->getURLUser($name);

        if($user->isAuthenticatedUser() || Auth::user()->isMod())
            return view('pages.settings', ['user' => $user]);
        else
            abort(403, 'Permission denied');  
    }

    public function getURLUser($name)
    {
        $user = User::where('name', $name)->get();

        if(count($user) == 0)
        {
            $user = User::where('name', Utils::reverse_slug($name))->get();

            if(count($user) == 0)
                abort(404, 'User ' . $name . ' does not exist');
        }

        return $user[0];
    }
    
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $name)
    {
        $user = $this->getURLUser($name);

        if(!$user->isAuthenticatedUser() && !Auth::user()->isMod())
            abort(403, 'Permission denied');

        $setting = $request->setting;
        $value = null;

        switch($setting)
        {
            case "photo": 

                if(!$request->has('photo'))
                    abort(400, 'No file');

                $request->validate
                (
                    ['photo' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',]
                );

                $setting = "id_photo";
                $old_photo = $user->getPhoto(false);

                if($old_photo->id_photo != 1)
                {
                    $old_photo->delete();
                    Utils::deleteImage("/" . Utils::replaceWhiteSpace($old_photo->image_path), "public");
                }
                 
                $new_image = $request->file('photo');

                if($new_image == null)
                    abort(400, 'Null file');
                
                $new_photo_name =  Utils::slug($user->name);
                $value = Photo::create
                (
                    "img/users/" . $new_photo_name . '.' . $new_image->getClientOriginalExtension(), 
                    null
                );

                Utils::saveImage($new_image, "/img/users/", "public", $new_photo_name);
                break;

            case "password":
                $value = Hash::make($request->$setting);
                break;

            case "email":
            case "birth_date":
                $value = $request->$setting;
                break;

            default:
                abort(404, 'User setting ' . $setting . " does not exist");
        }

        $user->updateSetting($setting, $value);

        return redirect('users/' . $name);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($name)
    {
        $user = $this->getURLUser($name);

        if($user->isAuthenticatedUser() || Auth::user()->isMod())
        {
            Auth::logout();
            $user->delete();
            
            return redirect("/home");
        }
        else
            abort(403, 'Permission denied');
    }
}
