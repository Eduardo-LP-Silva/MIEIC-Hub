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
}