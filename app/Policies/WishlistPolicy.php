<?php

namespace App\Policies;

use App\User;
use App\Wishlist;

use Illuminate\Auth\Access\HandlesAuthorization;
use Illuminate\Support\Facades\Auth;

class WishlistPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view the wishlist.
     *
     * @param  \App\User  $user
     * @param  \App\Wishlist  $wishlist
     * @return mixed
     */
    public function view(User $user, Wishlist $wishlist) {
        return $user->id == $wishlist->id_user;
    }

    /**
     * Determine whether the user can create wishlists.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function create(User $user) {
    }

    /**
     * Determine whether the user can update the wishlist.
     *
     * @param  \App\User  $user
     * @param  \App\Wishlist  $wishlist
     * @return mixed
     */
    public function update(User $user, Wishlist $wishlist)
    {
        //
    }

    /**
     * Determine whether the user can delete the wishlist.
     *
     * @param  \App\User  $user
     * @param  \App\Wishlist  $wishlist
     * @return mixed
     */
    public function delete(User $user, Wishlist $wishlist)
    {
        //
    }
}
