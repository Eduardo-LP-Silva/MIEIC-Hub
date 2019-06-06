<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

use App\Product;
use App\Photo;
use App\Review;
use App\Wishlist;

class ProductsController extends Controller
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
    public function show($id) {
        $product = Product::find($id);
        $photos = Photo::where('id_product', $id)->get();
        $reviews = Review::where('id_product', $id)->get();
        $sizes = DB::select(
            'select size
            from product_size, size
            where id_product = :id and product_size.id_size = size.id_size', ['id' => $id]);
        $colors = DB::select(
            'select color
            from product_color, color
            where id_product = :id and product_color.id_color = color.id_color', ['id' => $id]); 

        $canReview = false;
        $inWishlist = false;
        if(Auth::check()) {
            $idUser = Auth::id();
            $inWishlist = sizeof(Wishlist::where('id_user', $idUser)->where('id_product', $id)->get()) > 0;
            $results = DB::select(
                'select id_user 
                from purchase, product_purchase 
                where id_user = :id_user and id_product = :id_product and purchase.id_purchase = product_purchase.id_purchase', 
                ['id_user' => $idUser, 'id_product' => $id]);
            $userReview = Review::where('id_user', $idUser)->where('id_product', $id)->get();
            if(sizeof($results) > 0 && sizeof($userReview) == 0) {
                $canReview = true;
            }
        }

        return view('pages.product', ['product' => $product, 'photos' => $photos, 'sizes' => $sizes, 'colors' => $colors, 'reviews' => $reviews, 'canReview' => $canReview, 'inWishlist' => $inWishlist]);
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
