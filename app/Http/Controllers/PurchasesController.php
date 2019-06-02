<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\User;
use App\Utils;

class PurchasesController extends Controller
{
    //
    public function showCart($name) {

        $user = User::where('name', $name)->get();

        if(count($user) == 0)
        {
            $user = User::where('name', Utils::reverse_slug($name))->get();

            if(count($user) == 0)
                abort(404);
        }

        $user = $user[0];
        $items = $user->getCartItems();
        $current_user = Auth::user();

    	return view('pages.cart', ['user' => $user, 'items' => $items]);
    }
}
