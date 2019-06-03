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

        $user = User::getURLUser($name);

        $items = $user->getCartItems();

        dump($user);
        dump($items);

        if($user->isAuthenticatedUser() || Auth::user()->isMod())                      // Mod pode ver o cart?
            return view('pages.cart', ['user' => $user, 'items' => $items]);
        else
            abort(403);
    }
}
