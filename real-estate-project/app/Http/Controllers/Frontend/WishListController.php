<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\WishList;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class WishListController extends Controller
{
    public function AddToWishList(Request $request, $property_id)
    {
        if (Auth::check()) {
            $exists = WishList::where('user_id', Auth::id())->where('property_id', $property_id)->exists();
            if (!$exists) {
                WishList::insert([
                    'user_id' => Auth::id(),
                    'property_id' => $property_id,
                    'created_at' => Carbon::now(),
                ]);
                return response()->json(['success' => 'Successfully Added On Your Wish List']);

            } else {
                return response()->json(['error' => 'This Property Has Already In Your Wish List']);
            }
        } else {
            return response()->json(['error' => 'At First Login To Your Account']);
        }
    }

    public function UserWishList(){
        $id = Auth::user()->id;
        $userData = User::find($id);

        return view('frontend.dashboard.wishlist', compact('userData'));
    }
    public function GetWishListProperty(){
        $wishlist = WishList::with('property')->where('user_id', Auth::id())->latest()->get();
        $wishQty = $wishlist::count();

        return response()->json(['wishlist' => $wishlist, 'wishQty' => $wishQty]);
    }
}
