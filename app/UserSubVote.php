<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class UserSubVote extends Model 
{
    protected $table = 'user_sub_vote';
    protected $primaryKey = 'id_user';
    public $timestamps = false;

    public static function hasUserVoted($id_user, $id_sub)
    {
        return DB::table('user_sub_vote')
            ->where('id_user', $id_user)
            ->where('id_sub', $id_sub)->get();
    }

    protected function setKeysForSaveQuery(\Illuminate\Database\Eloquent\Builder $query) {
        $query
            ->where('id_user', '=', $this->getAttribute('id_user'))
            ->where('id_sub', '=', $this->getAttribute('id_sub'));

        return $query;
    }
}
