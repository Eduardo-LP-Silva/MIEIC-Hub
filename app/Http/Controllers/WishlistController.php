<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\User;
use App\Wishlist;
use App\Product;

class WishlistController extends Controller
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
    public function create() {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, $id) {
        if ($user->can('create', Post::class)) {
            $item = new Wishlist;

            // TO DO: authorize
            $item->id_user = Auth::id();
            $item->id_product = $id;
    
            $item->save();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($name) {
        $user = User::getURLUser($name);
        $wishlist = Wishlist::where('id_user', $user->id)->get();

        if($user->cant('view', $wishlist)) {
            // Do something
            return;
        }

        for($i=0; $i<sizeof($wishlist); $i++) {
            $products[$i] = Product::find($wishlist[$i]->id_product);
        }

        if(isset($products)) {
            return view('pages.wishlist', ['products' => $products]);
        }
    
        return view('pages.wishlist');
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
    public function destroy($id)
    {
        //
    }
}
