<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\User;

class PurchaseController extends Controller
{

    public function cart($name)
    {

    	//$user = User::find($name);
    	//$id = 

    	$results = DB::select("SELECT product.id, product_name, price, image_path, quantity FROM users, product, cart, photo WHERE users.id = $name AND users.id = cart.id_user AND cart.id_product = product.id AND photo.id_product = product.id GROUP BY product.product_name; ");
    	//User::find($name)
    	//

        return view('pages.cart');
    }

}
