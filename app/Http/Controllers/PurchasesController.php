<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

use Carbon\Carbon;

use App\User;
use App\Utils;
use App\Cart;
use App\City;

class PurchasesController extends Controller
{
    public function showCart($name) {

        info("test");

        $user = User::getURLUser($name);

        $items = $user->getCartItems();

        if($user->isAuthenticatedUser() || Auth::user()->isMod())                      // Mod pode ver o cart?
            return view('pages.cart', ['user' => $user, 'items' => $items]);
        else
            return redirect('/error/403');
    }

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
        $city = City::where('city', '=', $request->city)->get();
        $contact = $request->contact;
        $address = $request->address;

        $id_city = $city[0]->id_city;

        $cartitems = $user->getCartItems();

        DB::table('delivery_info')->insert(
            ['id_city' => $id_city,
             'contact' => $contact,
             'delivery_address' => $address]);

        $id_deli_info = User::getLastInfo();

        dump($id_deli_info->id_delivery_info);
        //dump($items);

        $purchase_date = date("Y-m-d H:i:s");

        /*

        DB::insert('INSERT INTO purchase (id_user, id_deli_info, purchase_date, total, status) VALUES (?, ?, ?, ?, ?)',
         [$user->id, $id_deli_info->id_delivery_info, $purchase_date, 0, 'awaiting_payment']);*/

        DB::table('purchase')->insert(
            ['id_user' => $user->id,
             'id_deli_info' => $id_deli_info->id_delivery_info,
             'purchase_date' => $purchase_date,
             'total' => 0,
             'status' => 'awaiting_payment']);
/*
        
        DB::insert( 'INSERT INTO product_purchase (id_product, id_purchase, quantity, price, id_size, id_color) VALUES (4, 6, 1, 1, 2, 3);' );

        (id_user, id_product, id_color, id_size)

*/

        $last_purchase = $this->getLastPurchase();

        $cartitems = $user->getCartItems();

        foreach ($cartitems as $item) {

            DB::table('product_purchase')->insert(
                ['id_product' => $item->id_product,
                 'id_purchase' => $last_purchase->id_purchase,
                 'quantity' => $item->quantity,
                 'price' => 1,                      // o trigger atualiza
                 'id_size' => $item->id_size,
                 'id_color' => $item->id_color]);

        }

        //on success elimina os artigos do cart

        dump($cartitems);

        foreach ($cartitems as $item) {
            Cart::find($item->id_cart)->delete();
        }

        if($user->isAuthenticatedUser() || Auth::user()->isMod())                      // Mod pode ver o cart?
            return view('pages.cart', ['user' => $user, 'items' => $user->getCartItems()] );
        else
            abort(403);

    }

    public function getLastPurchase() {
        return DB::select(DB::raw
        (
            "SELECT id_purchase FROM purchase ORDER BY id_purchase DESC LIMIT 1"
        ))[0];
    }

    public function deleteCartEntry($id_user, $id_product) {

        $cart = Cart::where('id_user', '=', $id_user)
        ->where('id_product', '=', $id_product)->first();

        if($cart->quantity > 1){

            $cart->quantity -= 1;
            $cart->save(); 

        } else { $cart->delete(); }

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