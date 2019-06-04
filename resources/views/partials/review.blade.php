@php 
 use App\User;
 $user = User::find($review->id_user) 
@endphp

<div class="media container">
    <img class="d-flex mr-3" data-src="{{asset($user->getPhoto(true))}}" alt="Profile picture" style="width: 64px; height: 64px;" src="{{asset($user->getPhoto(true))}}" data-holder-rendered="true">
    <div class="media-body row">
    <h5 class="mt-0 col-6"> {{$user->name}} </h5>
        <div class="rating col-6">
                @for($i=0; $i<$review->rating; $i++) 
                    <span class="fa fa-star checked"></span>
                @endfor
                @for($i=0; $i<5-$review->rating; $i++)
                    <span class="fa fa-star"></span>
                @endfor
        </div>    
        <p class="ml-3">{{$review->comment}}</p>
    </div>
</div>