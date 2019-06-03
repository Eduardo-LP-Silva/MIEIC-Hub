<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Photo extends Model 
{
    protected $table = 'photo';
    protected $primaryKey = 'id_photo';
    public $timestamps  = false;

    public static function create($image_path, $id_product)
    {
        return DB::table('photo')->insertGetId
        (
            ['image_path' => $image_path, 'id_product' => $id_product],
            'id_photo' 
        );
    }

}
