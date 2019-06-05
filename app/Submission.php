<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Submission extends Model 
{
    protected $table = 'submission';
    protected $primaryKey = 'id_submission';
    public $timestamps  = false;

    public static function getSubmissions($date_filter)
    {
        $query_string = "SELECT id_submission, submission_name, picture, submission_date, users.name
        FROM submission, users
        WHERE submission.id_user = users.id";

        if($date_filter != 0)
            $query_string .= " AND submission_date > '" . $date_filter . "'";
            
        $query_string .= " ORDER BY submission_date DESC";
        
        return DB::select(DB::raw($query_string));
    }
}
