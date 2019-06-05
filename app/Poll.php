<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use App\Submission;

class Poll extends Model
{
    protected $table = 'poll';
    protected $primaryKey = 'id_poll';
    public $timestamps  = false;

    public static function getActivePolls()
    {
        return Poll::select('id_poll', 'poll_name', 'expiration')->where('active', true)->get();
    }

    public function getDesigns()
    {
        return Submission::select('id_submission', 'picture', 'votes', 'submission_name')
            ->where('id_poll', $this->id_poll)->get();
    }

    public static function getAcceptedSubmissions()
    {
      return DB::select(DB::raw
      (
          "SELECT *
          FROM submission
          WHERE submission.accepted = 'true'"
      ));
    }

    public static function getUsername($id)
    {
      return DB::select(DB::raw
      (
          "SELECT name
          FROM users
          WHERE users.id = ". $id ."
          "
      ));
    }
}
