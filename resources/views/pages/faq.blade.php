@extends('layouts.page')

@section('stylesheets')
        <link rel="stylesheet" href="{{ asset('css/faq.css') }}">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
@endsection

@section('title')
    <title>FAQ - MIEIC Hub</title>
@endsection

@section('content')
  <div class="accordion" id="accordionExample">
    <h1> Frequently Asked Questions</h1>
      @if(Auth::check() && Auth::user()->isMod())
        <form class="card" action="faq/add" method="POST">
          {{ csrf_field() }}
          {{method_field('PUT')}}
          <div class="card-header" id="headingOne">
            <h5 class="mb-0">
              <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseZero"
                aria-expanded="true" aria-controls="collapseZero">
                Add F.A.Q 🔻
              </button>
            </h5>
          </div>
          <div id="collapseZero" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
            <div class="card-body">
              <form>
                <div>
                  <input type="text" name="question" placeholder="F.A.Q" required>
                </div>
                  <div>
                    <textarea required name="answer" rows="5" placeholder="Answer"></textarea>
                  </div>
                  <button type="submit" class="btn btn-danger">Submit</button>
                </form>
              </div>
            </div>
          </form>
        @endif
        @foreach($faqs as $faq)
          <form class="card" action={{url('faq/' . $faq->id_question . '/remove')}} method="GET">
            <div class="card-header" id=<?="heading" . $faq->id_question?>>
              <h5 class="mb-0">
                <button class="btn btn-link" type="button" data-toggle="collapse" data-target=<?="#collapse" . $faq->id_question?> aria-expanded="true" aria-controls=<?="collapse" . $faq->id_question?>>
                  Question {{$loop->index + 1}}: {{{$faq->question}}}  🔻
                </button>
                @if(Auth::check() && Auth::user()->isMod())
                  <button type="submit" class="btn" name="question" value=<?=$faq->id_question?>>
                    <i class="fa fa-trash"></i>
                  </button>
                @endif
              </h5>
            </div>
            <div id=<?="collapse" . $faq->id_question?> class="collapse show" aria-labelledby=<?="heading" . $faq->id_question?> data-parent="#accordionExample">
              <div class="card-body">
                {{{$faq->answer}}}
              </div>
            </div>
          </form>
        @endforeach
    </div>
@endsection
