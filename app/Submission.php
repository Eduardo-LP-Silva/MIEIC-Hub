<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Submission extends Model {
    protected $table = 'submission';
    protected $primaryKey = 'id_submission';
    public $timestamps  = false;
}
