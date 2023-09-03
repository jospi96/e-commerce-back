<?php

namespace App\Http\Controllers\category;

use App\Http\Controllers\Controller;
use App\Http\Resources\Categories\CategoryProduct;
use App\Repositories\Contract\CategoryRepositoryInterface;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
  function getCateryList(Request $request, CategoryRepositoryInterface $categoryRepository){
    return  $categoryRepository->get();
   }

   function  getCategoryProducts($id,Request $request, CategoryRepositoryInterface $categoryRepository){

    return CategoryProduct::collection($categoryRepository->Categoryproduct($id));

  }
}