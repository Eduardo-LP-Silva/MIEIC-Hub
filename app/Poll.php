<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
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

    public static function getPolls()
    {
        return Poll::select('id_poll', 'poll_name', 'expiration', 'active')->get();
    }

    public function getDesigns()
    {
        return Submission::select('id_submission', 'picture', 'votes', 'submission_name', 'winner')
            ->where('id_poll', $this->id_poll)->get();
    }
}
