<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class FAQ extends Model 
{
    protected $table = 'faq';
    protected $primaryKey = 'id_question';
    public $timestamps  = false;

    public static function getFAQs()
    {
        return DB::table('faq')->get();
    }

    public static function create($question, $answer)
    {
        return DB::table('faq')->insert
        (
            ['question' => $question, 'answer' => $answer]
        );
    }
}
