<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\User;
use App\Utils;

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

        if($setting != "email" && $setting != "password" && $setting != "birth_date")
            abort(404, 'User setting ' . $setting . " does not exist");

        $value = null;

        if($setting == "password")
            $value = Hash::make($request->$setting);
        else
            $value = $request->$setting;

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
