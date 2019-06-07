<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Input;
use App\User;
use App\Utils;
use App\Photo;

class UsersController extends Controller
{
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

    public function privilege($name)
    {
        if(!User::isAuthMod())
            return redirect('/error/403');

        $role = Input::get('role');

        if(strlen($role) < 3)
            return redirect('/error/400');

        $remove = substr($role, 0, 3) == "rm_";
        $privilege = null;

        if($remove)
            $privilege = substr($role, 3);
        else
            $privilege = $role;

        $user = User::getURLUser($name);
        $user->setPrivilege($privilege, !$remove);

        return redirect('users/' . $name);
    }

    public function profileReviews($name)
    {
        $user = User::getURLUser($name);
        $reviews = $user->getReviews();

        return view('pages.profile-reviews', ['user' => $user, 'reviews' => $reviews]);
    }

    public function profileOrders($name)
    {
        $user = User::getURLUser($name);
        $orders = $user->getOrders();
        $current_user = Auth::user();

        if($user->isAuthenticatedUser() || $current_user->isMod())
            return view('pages.profile-orders', ['user' => $user, 'orders' => $orders]);
        else
            return redirect('/error/403');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($name)
    {
        $user = User::getURLUser($name);

        if($user->isAuthenticatedUser() || User::isAuthMod())
            return view('pages.settings', ['user' => $user]);
        else
            return redirect('/error/403');  
    }

    public function getURLUser($name)
    {
        $user = User::where('name', $name)->get();

        if(count($user) == 0)
        {
            $user = User::where('name', Utils::reverse_slug($name))->get();

            if(count($user) == 0)
                return redirect('/error/404');
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
        $user = User::getURLUser($name);

        if(!$user->isAuthenticatedUser() || !Auth::user()->isMod())
            return redirect('/error/403');

        $setting = $request->setting;
        $value = null;

        switch($setting)
        {
            case "photo": 

                if(!$request->has('photo'))
                    return redirect('/error/400');

                $request->validate
                (
                    ['photo' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048']
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
                    return redirect('/error/400');
                
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
                return redirect('/error/400');
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
        $user = User::getURLUser($name);

        if($user->isAuthenticatedUser() || User::isAuthMod())
        {
            if(Auth::user()->name == $user->name)
                Auth::logout();
                  
            $user->delete();
            
            if(substr(URL::previous(), -9) == "/settings")
                return redirect("/home");
        }
        else
            return redirect('/error/403');
    }
}