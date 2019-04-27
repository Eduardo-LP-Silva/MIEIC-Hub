<?php

namespace App\Http\Controllers;

use App\Submission;
use App\User;
use App\Card;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class SubmissionsController extends Controller
{
    /**
     * Creates a new submission.
    *
    * @param  int  $card_id
    * @param  Request request containing the description
    * @return Response
    */
    public function create(Request $request, $card_id)
    {
        $submission = new Submission();
        
        $submission->card_id = $card_id;

        $this->authorize('create', $submission);
        
        $submission->done = false;

        $submission->save();

        return $submission;
    }

    /**
     * Updates the state of an individual submission.
     *
     * @param  int  $id
     * @param  Request request containing the new state
     * @return Response
     */
    public function update(Request $request, $id)
    {
        $submission = Submission::find($id);

        $this->authorize('update', $submission);

        $submission->done = $request->input('done');
        $submission->save();

        return $submission;   
    }

    /**
     * Deletes an individual sub,ission.
     *
     * @param  int  $id
     * @return Response
     */
    public function delete(Request $request, $id)
    {
      $submission = Submission::find($id);

      $this->authorize('delete', $submission);
      $submission->delete();

      return $submission;
    }

}