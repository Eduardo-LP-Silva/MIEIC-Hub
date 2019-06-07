<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\URL;
use Illuminate\Http\Request;
use App\Review;

class ReviewController extends Controller
{
    public function create(Request $request, $id_product, $id_user)
    {   
        if(!$request->has('rating') || !$request->has('review'))
            return redirect(URL::previous());

        Review::create($id_product, $id_user, $request->rating, $request->review);

        redirect("/products/" . $id_product);
    }

    public function destroy($id_product, $id_user)
    {
        Review::remove($id_product, $id_user);
    }
}
