<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Review extends Model {
    protected $table = 'review';
    protected $primaryKey = ['id_user', 'id_product'];
    public $timestamps = false;
}
