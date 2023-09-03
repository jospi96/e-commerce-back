<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\LogoutController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Brand\BrandController;
use App\Http\Controllers\category\CategoryController;
use App\Http\Controllers\Discount\DiscountController;
use App\Http\Controllers\product\ProductController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\Order\OrderController;
use App\Http\Controllers\Cart\CartController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
 */

/*free routes*/
Route::post("register", [RegisterController::class, 'userRegister'])->name("register");
Route::post("login", [LoginController::class, 'login']);

/* Get all products paginate */
Route::get("products", [ProductController::class, 'getProducts']);
Route::get("products/{id}", [ProductController::class, 'getSingleProduct']);
Route::get("brands", [BrandController::class, 'getAll']);
Route::get("brand/{id}", [ProductController::class, 'getBrandProducts']);
Route::get("cat-products/{id}", [CategoryController::class, 'getCategoryProducts']);
Route::get("discount-prod/", [ProductController::class, 'discountProducts']);
/*category list */
Route::get("categories", [CategoryController::class, "getCateryList"]);
/*discont free routes */
Route::get("discount-code", [DiscountController::class, "getByCode"]);
Route::post("cart/{id}", [CartController::class, "updade"]);


Route::put("cart/{id}", [CartController::class, "delete"]);



Route::post("order", [OrderController::class, "create"]);
Route::get("checkout", [OrderController::class,"generate"]);
Route::post("payament", [OrderController::class,"makePayment"]);

/*--------------------------------------------*/

/*user logged routes*/
Route::group(['middleware' => 'jwt.user'], function () {
    /*logout*/
    Route::post("logout", [LogoutController::class, 'logout']);
    /** User operation */
    Route::put("user", [UserController::class, "update"]);
    Route::get("user/show", [UserController::class, "show"]);
    Route::get("cart/{user}", [CartController::class, "userCart"]);

});
/*--------------------------------------------*/
/*admin routes*/
Route::group(['middleware' => 'jwt.admin'], function () {
    /** User operation */
    Route::put("user", [UserController::class, "update_admin"]);
    Route::get("users", [UserController::class, "index"]); // return all users
    Route::get("user/show/{id}", [UserController::class, "show_admin"]);

});
