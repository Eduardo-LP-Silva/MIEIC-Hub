<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

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

    //
    public function checkout($name) {

        $user = User::getURLUser($name);

        $cities = User::getCities();

        $items = $user->getCartItems();
        
        dump($cities);
        //dump($items);

        if($user->isAuthenticatedUser() || Auth::user()->isMod())                      // Mod pode ver o cart?
            return view('pages.checkout', ['user' => $user, 'items' => $items, 'cities' => $cities] );
        else
            abort(403);
    }

    //
    public function checkoutForm(Request $request, $name) {

        $user = User::getURLUser($name);
        $id_city = $request->city;
        $contact = $request->contact;
        $address = $request->address;

        $cartitems = $user->getCartItems();

        DB::table('delivery_info')->insert(
            ['id_city' => $id_city,
             'contact' => $contact,
             'delivery_address' => $address]);

        $id_deli_info = User::getLastInfo();

        dump($id_deli_info);
        //dump($items);

        DB::table('purchase')->insert(
            ['id_user' => $user->id,
             'id_deli_info' => $id_deli_info,
             'purchase_date' => $purchase_date,
             'total' => $total,
             'status' => $status,]);

        return redirect('/home');
    }

    public function deleteCartEntry($id_user, $id_product) {

        $cart = Cart::where('id_user', '=', $id_user)
        ->where('id_product', '=', $id_product)->first();

        $cart->delete();     // n ta a eliminar so um...

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