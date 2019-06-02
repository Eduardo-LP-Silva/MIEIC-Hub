<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Auth;
use App\Photo;
use Illuminate\Support\Facades\DB;

class User extends Authenticatable
{
    use Notifiable;

    // Don't add create and update timestamps in database.
    public $timestamps  = false;

    protected $table = 'users';
    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'birth_date'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function isAuthenticatedUser()
    {
        return $this->id == Auth::id();
    }

    public function isMod()
    {
        return $this->moderator;
    }

    public function getPhotoPath()
    {
        return Photo::find($this->id_photo)->image_path;
    }

    public function getReviews()
    {
        return DB::select(DB::raw
        (
            "SELECT DISTINCT product.id_product, product.product_name, review.review_date, review.comment, review.rating
            FROM users, product, review
            WHERE users.id = " . $this->id . 
            " AND users.id = review.id_user 
            AND product.id_product = review.id_product"
        ));
    }

    public function getOrders()
    {
        return DB::select(DB::raw
        (
            "SELECT DISTINCT product.id_product, product.product_name, product_purchase.price, purchase.purchase_date, purchase.status
            FROM users, purchase, product_purchase, product
            WHERE users.id = " . $this->id .
            " AND users.id = purchase.id_user 
            AND product_purchase.id_purchase = purchase.id_purchase 
            AND product_purchase.id_product = product.id_product"
        ));
    }

    public function updateSetting($setting, $value)
    {
        DB::table('users')
            ->where('id', $this->id)
            ->update([$setting => $value]);
    }

    public function getCartItems()
    {
        return DB::select(DB::raw
        (
            "SELECT product.id_product, product_name, price, image_path, quantity
            FROM users, product, cart, photo
            WHERE users.id = " . $this->id . "AND users.id = cart.id_user AND 
            cart.id_product = product.id_product AND photo.id_product = product.id_product
            ;"

        ));
    }

}
