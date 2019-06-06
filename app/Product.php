<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Photo;
use Illuminate\Support\Facades\DB;

class Product extends Model
{
    protected $table = 'product';
    protected $primaryKey = 'id_product';
    public $timestamps  = false;

    public function getPhotos($thumbnail)
    {
        $query_string = "SELECT image_path
        FROM product, photo
        WHERE product.id_product = " . $this->id_product . 
        " AND photo.id_product = " . $this->id_product;

        if($thumbnail)
            $query_string .= "\nLIMIT 1";

        $results = DB::select(DB::raw($query_string));

        if($thumbnail)
            return $results[0]->image_path;
        else 
            return $results;
    }

    public static function search($query, $in_category)
    {
        if($in_category)
            return DB::select(DB::raw
            (
                "SELECT product.id_product, product_name, price, rating, 
                ts_rank_cd(text_search, query) AS rank
                FROM product, category, plainto_tsquery('" . $query . "') AS query, 
                to_tsvector(category.category) AS text_search
                WHERE product.id_category = category.id_category 
                AND text_search @@ query
                ORDER BY rank DESC"
            ));
        else
            return DB::select(DB::raw
            (
                "SELECT product.id_product, product.product_name, product.price, product.rating, 
                    ts_rank_cd(text_search, query) AS rank
                FROM product, plainto_tsquery('" . $query . "') AS query, 
                    to_tsvector(product.product_name || ' ' || product_description) AS text_search
                WHERE text_search @@ query
                ORDER BY rank DESC"
            ));
    }
}