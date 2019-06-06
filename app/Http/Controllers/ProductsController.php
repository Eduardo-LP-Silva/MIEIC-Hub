<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\UploadedFile;

use App\Product;
use App\Photo;
use App\Review;
use App\Wishlist;
use App\Category;
use App\Utils;

class ProductsController extends Controller {
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        $user = Auth::user();
        if($user === null) {
            return Redirect::to('home');
        }
        if($user->cant('create', Product::class)) {
            // not found
            return Redirect::to('home');
        }
        return view('pages.add-product');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        $user = Auth::user();
        if($user === null) {
            return Redirect::to('home');
        }
        if($user->cant('create', Product::class)) {
            // not found
            return Redirect::to('home');
        }

        $title = $request->name;
        $price = $request->price;
        $type = $request->type;
        $description = $request->description;

        $category = Category::where('category', $type)->first();
        if($category === null) {
            return Redirect::to('home');
        }

        $folderName = Product::getCategoryFolder($type);

        $image = $request->file('images');

        if($image == null)
            abort(400, 'Null file');

        $photoName = $title . "-" . date("Y-m-d H:i:s");
        $path = "img/" . $folderName . "/";
        Utils::saveImage($image, "/" . $path, "public", $photoName);
        $path = $path . $photoName . '.' . $image->getClientOriginalExtension();

        DB::table('product')->insert(
            ['product_name' => $title,
             'price' => $price,
             'id_category' => $category->id_category,
             'product_description' => $description]);

        $product = Product::where('product_name', $title)->first();

        DB::table('photo')->insert(
            ['image_path' => $path,
            'id_product' => $product->id_product]);

        return Redirect::to('products/' . $product->id_product);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $product = Product::find($id);

        if($product === null) {
            // not found
            return Redirect::to('home');
        }

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
    public function destroy($id) {
        $user = Auth::user();
        $product = Product::find($id);
        
        if ($user->cant('delete', $product)) {
            abort(403, 'Permission denied');
        }

        $photos = $product->getPhotos(false);
        for($i = 0; $i < sizeof($photos); $i++) {
            Utils::deleteImage($photos[$i]->image_path, 'public');
        }
        
        $product->delete();
        return 200;
    }
}
