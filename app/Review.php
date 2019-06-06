<?php

namespace App;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class Review extends Model {
    protected $table = 'review';
    protected $primaryKey = 'id_user';
    public $timestamps = false;

    protected function setKeysForSaveQuery(\Illuminate\Database\Eloquent\Builder $query) {
        $query
            ->where('id_user', '=', $this->getAttribute('id_user'))
            ->where('id_product', '=', $this->getAttribute('id_product'));

        return $query;
    }

    public static function create($id_product, $id_user, $rating, $text)
    {
        DB::table('review')->insert(['id_user' => $id_user, 'id_product' => $id_product, 'comment' => $text, 'rating' => $rating]);
    }

    public static function remove($id_product, $id_user)
    {
        $review = Review::where('id_product', $id_product)
            ->where('id_user', $id_user)->get();

        if(sizeof($review) > 0)
        {
            $review = $review[0];
            $review->delete();

            return 200;
        }
        else
            return 404;
    }
}
