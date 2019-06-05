<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\User;
use App\Utils;
use App\Cart;

class PurchasesController extends Controller
{
    //
    public function showCart($name) {

        info("test");

        $user = User::getURLUser($name);

        $items = $user->getCartItems();
        
        //dump($user);
        //dump($items);

        if($user->isAuthenticatedUser() || Auth::user()->isMod())                      // Mod pode ver o cart?
            return view('pages.cart', ['user' => $user, 'items' => $items]);
        else
            abort(403);
    }

    public function deleteCartEntry($id_user, $id_product) {


        info("inside");

        $cart = Cart::where('id_user', $id_user)
        ->where('id_product', $id_product)
        ->first();

       $cart->delete();     // n ta a eliminar so um..

            /*
            " DELETE FROM cart
            WHERE id_user = ?
            AND id_product = ? "
        ,[$id_user, $id_product]);*/
    }
}

/*
    public function destroy($name)
    {
        $user = User::getURLUser($name);

        if($user->isAuthenticatedUser() || Auth::user()->isMod())
        {
            if(Auth::user()->name == $user->name)
                Auth::logout();
                  
            $user->delete();
            
            if(substr(URL::previous(), -9) == "/settings")
                return redirect("/home");
        }
        else
            abort(403, 'Permission denied');
    }*/