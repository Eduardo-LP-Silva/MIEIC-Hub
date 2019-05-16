<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Photo extends Model {
    protected $table = 'photo';
    protected $primaryKey = 'id_photo';
    public $timestamps  = false;
}
