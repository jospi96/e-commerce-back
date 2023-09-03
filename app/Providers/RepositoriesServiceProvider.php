<?php

namespace App\Providers;
use App\Repositories\EloquentOrderRepository;
use App\Repositories\Contract\OrderRepositoryInterface;
use App\Repositories\EloquentUserRepository;
use App\Repositories\Contract\UserRepositoryInterface;
use App\Repositories\Contract\ProductRepositoryInterface;
use App\Repositories\EloquentProductRepository;
use App\Repositories\Contract\BrandRepositoryInterface;
use App\Repositories\EloquentBrandRepository;
use App\Repositories\Contract\CategoryRepositoryInterface;
use App\Repositories\EloquentCategoryRepository;
use App\Repositories\Contract\DiscountRepositoryInterface;
use App\Repositories\EloquentDiscountRepository;
use App\Repositories\Contract\CartRepositoryInterface;
use App\Repositories\EloquentCartRepository;
use Illuminate\Support\ServiceProvider;

class RepositoriesServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        //
        $this->app->bind(UserRepositoryInterface::class,EloquentUserRepository::class);
        $this->app->bind(ProductRepositoryInterface::class,EloquentProductRepository::class);
        $this->app->bind(BrandRepositoryInterface::class,EloquentBrandRepository::class);
        $this->app->bind(CategoryRepositoryInterface::class,EloquentCategoryRepository::class);
        $this->app->bind(DiscountRepositoryInterface::class,EloquentDiscountRepository::class);
        $this->app->bind(CartRepositoryInterface::class,EloquentCartRepository::class);
        $this->app->bind(OrderRepositoryInterface::class,EloquentOrderRepository::class);
    }
    
    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        //
    }
}
