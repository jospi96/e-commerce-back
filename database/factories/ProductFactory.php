<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            //
           
            "title"=>$this->faker->realTextBetween(8,10),
            "description"=>$this->faker->paragraph(),
            "list_price"=>$this->faker->numberBetween(1,1000),
            "discount_price"=>$this->faker->numberBetween(1,900),
            "meta_title"=>$this->faker->title(),
            "id_brand"=>'1',
            "quantity"=>$this->faker->randomNumber(),
            
            
        ];
    }
}
