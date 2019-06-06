<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Wishlist extends Model {
    protected $table = 'wishlist';
    protected $primaryKey = 'id_user';
    public $timestamps = false;

    protected function setKeysForSaveQuery(\Illuminate\Database\Eloquent\Builder $query) {
        $query
            ->where('id_user', '=', $this->getAttribute('id_user'))
            ->where('id_product', '=', $this->getAttribute('id_product'));

        return $query;
    }
}
