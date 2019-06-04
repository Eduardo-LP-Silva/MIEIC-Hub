<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\FAQ;
use App\User;
use App\Product;

class GeneralPageController extends Controller {
    public function home() 
    {
        return view('pages.home');
    }

    public function about()
    {
        return view('pages.about');
    }

    public function faq()
    {
        $faqs = FAQ::getFAQs();

        return view('pages.faq', ['faqs' => $faqs]);
    }

    public function removeFaq($id)
    {
        if(!Auth::user()->isMod())
            abort(403, 'Permission denied!');

        FAQ::find($id)->delete();

        return redirect('/faq');
    }

    public function addFaq(Request $request)
    {
        if(!Auth::user()->isMod())
            abort(403, 'Permission denied!');

        FAQ::create($request->question, $request->answer);

        return redirect('/faq');
    }

    public function search($filter)
    {   
        $query = request()->input('query');

        $results = null;
        $category = false;

        switch($filter)
        {
            case "users":
                $user = Auth::user();

                if($user == null || !$user->isMod())
                    abort(403, 'Permission denied');

                $results = User::search($query);
                break;

            case "categories":
                $category = true;

            case "products":
                $results = Product::search($query, $category);
                break;

            default:
                abort(404, 'Invalid filter');
        }

        return view('pages.search', ['query' => $query, 'filter' => $filter, 'results' => $results]);
    }

    public function product()
    {
        return view('pages.product');
    }
}
